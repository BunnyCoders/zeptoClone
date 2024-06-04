import 'parent.dart';

class AccountData extends Parent {
  String? temp;

  AccountData({
    this.temp,
  });

  AccountData.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;

    return data;
  }
}
