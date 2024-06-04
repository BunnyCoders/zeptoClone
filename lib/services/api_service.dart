import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:zepto_clone/core/locator.dart';
import 'package:zepto_clone/core/constants.dart';
import 'package:zepto_clone/global_models/account_data.dart';

final ApiService apiService = locator<ApiService>();

class ApiService {
  String _token = "";

  Uri _uri({required apiEndpoint}) {
    return Uri.parse(URL + apiEndpoint);
  }

  Map<String, String> _headers({bool includeToken = true}) {
    return includeToken
        ? {
            "Authorization": "Bearer $_token",
            "Accept": "*/*",
            "Accept-Encoding": "gzip, deflate, br",
            "Content-Type": "application/json",
            "Connection": "keep-alive",
          }
        : {
            "Accept": "*/*",
            "Accept-Encoding": "gzip, deflate, br",
            "Content-Type": "application/json",
            "Connection": "keep-alive",
          };
  }

  String _apiExceptionHandling({required e}) {
    if (e is SocketException) {
      return "No internet";
    } else if (e is TimeoutException) {
      return "Session timeout";
    } else if (e is FormatException) {
      return "Something went wrong";
    } else {
      return "Something went wrong";
    }
  }

  

  Future<AccountData> getAccountData() async {
    AccountData accountData = AccountData();

    try {
      Response response = await http.post(
        _uri(apiEndpoint: "/_"),
        headers: _headers(),
        body: jsonEncode(
          {},
        ),
      );

      switch (response.statusCode) {
        case 200:
          accountData = AccountData.fromJson(jsonDecode(response.body));

          return accountData;
        default:
          accountData.errorMessage = "Unexpected response";

          return accountData;
      }
    } catch (e) {
      accountData.errorMessage = _apiExceptionHandling(e: e);

      return accountData;
    }
  }
}
