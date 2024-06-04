import 'package:flutter/cupertino.dart';

String? tempValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid name in alphabets only';
  }

  if (value.length < 3) {
    return 'Name must be atleast 3 characters';
  }

  if (value.length >= 20) {
    return 'Name must be less than 20 digits';
  }

  return null;
}

String? searchValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter something for search';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid search name in alphabets only';
  }

  return null;
}

String? nameValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid name in alphabets only';
  }

  if (value.length < 3) {
    return 'Name must be at least 3 characters';
  }

  if (value.length >= 20) {
    return 'Name must be less than 20 digits';
  }

  return null;
}

String? firstNameValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter first name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid first name in alphabets only';
  }

  if (value.length < 3) {
    return 'First name must be at least 3 characters';
  }

  if (value.length >= 20) {
    return 'First name must be less than 20 digits';
  }

  return null;
}

String? lastNameValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter last name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid last name in alphabets only';
  }

  if (value.length < 3) {
    return 'Last name must be at least 3 characters';
  }

  if (value.length >= 20) {
    return 'Last name must be less than 20 digits';
  }

  return null;
}

String? emailValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter email address';
  }

  if (!RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value)) {
    return 'Please enter valid email address';
  }

  return null;
}

String? phoneNumberValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter phone number';
  }

  if (value.length != 10) {
    return 'Mobile number must be of 10 digit';
  }

  if (value.isNotEmpty) {
    bool mobileValid =
        RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value);
    if (mobileValid) {
      return null;
    } else {
      return 'Invalid input. Please try again';
    }
  }

  return null;
}

String? passwordValidator({required String value}) {
  if (value.isEmpty) {
    return 'Password is required please enter';
  }

  if (!RegExp(
          r'"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$"')
      .hasMatch(value)) {
    return 'Please enter valid password';
  }
  return null;
}

String? confirmPasswordValidator({
  required String value,
  required TextEditingController password,
}) {
  if (value.isEmpty) {
    return 'Confirm Password is required please enter';
  }

  if (value != password.text) {
    return 'The passwords does not match';
  }

  return null;
}

String? pinValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter pin';
  }

  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Please enter valid pin only';
  }

  if (value.length < 4) {
    return 'Pin code must be at least 4 digits';
  }

  return null;
}

String? giftCardNumberValidator({required String value}) {
  if (value.isEmpty || value.trim().isEmpty) {
    return 'Please enter gift card number';
  }

  if (value.length < 12) {
    return 'Pin code must be at least 12 digits';
  }

  return null;
}

String? pinCodeValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter pin code';
  }

  if (!RegExp(r'^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$').hasMatch(value)) {
    return 'Please enter valid pin code in numbers only';
  }

  if (value.length < 6) {
    return 'Pin code must be at least 6 digits';
  }

  return null;
}

String? cityValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter city name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid city name in alphabets only';
  }

  if (value.length < 3) {
    return 'City name must be at least 3 characters';
  }

  if (value.length >= 20) {
    return 'City name must be less than 20 digits';
  }

  return null;
}

String? stateValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter state name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid state name in alphabets only';
  }

  if (value.length < 3) {
    return 'State name must be at least 3 characters';
  }

  if (value.length >= 20) {
    return 'state name must be less than 20 digits';
  }

  return null;
}

String? localityValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter locality';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid locality in alphabets only';
  }

  if (value.length < 3) {
    return 'Locality must be at least 3 characters';
  }

  if (value.length >= 20) {
    return 'Locality must be less than 20 digits';
  }

  return null;
}

String? flatNumberValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter name';
  }

  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Please enter valid name in alphabets only';
  }

  if (value.length < 3) {
    return 'Name must be atleast 3 characters';
  }

  if (value.length >= 20) {
    return 'Name must be less than 20 digits';
  }

  return null;
}

String? upiNumberValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter upi number';
  }

  if (!RegExp(r'[a-zA-Z0-9\\.\\-]{2,256}\\@[a-zA-Z][a-zA-Z]{2,64}')
      .hasMatch(value)) {
    return 'Please enter valid upi number only';
  }

  return null;
}

String? cardNumberValidator({required String value}) {
  if (value.isEmpty || value.trim().isEmpty) {
    return 'Please enter card number';
  }

  return null;
}

String? cvvValidator({required String value}) {
  if (value.isEmpty) {
    return "Please enter card CVV";
  }

  if (value.length < 3 || value.length > 4) {
    return "CVV is invalid";
  }
  return null;
}

String? monthValidator({required String value}) {
  if (value.isEmpty) {
    return 'Month is required';
  }

  int month;
  // The value contains a forward slash if the month and year has been
  // entered.
  if (value.contains(RegExp(r'(/)'))) {
    var split = value.split(RegExp(r'(/)'));
    // The value before the slash is the month while the value to right of
    // it is the year.
    month = int.parse(split[0]);
    // year = int.parse(split[1]);
  } else {
    // Only the month was entered
    month = int.parse(value.substring(0, (value.length)));
  }

  if ((month < 1) || (month > 12)) {
    // A valid month is between 1 (January) and 12 (December)
    return 'Expiry month is invalid';
  }

  return null;
}

String? yearValidator({required String value}) {
  if (value.isEmpty) {
    return "Year is required";
  }

  int year;
  int month;
  // The value contains a forward slash if the month and year has been
  // entered.
  if (value.contains(RegExp(r'(/)'))) {
    var split = value.split(RegExp(r'(/)'));
    // The value before the slash is the month while the value to right of
    // it is the year.
    month = int.parse(split[0]);
    year = int.parse(split[1]);
  } else {
    // Only the month was entered
    month = int.parse(value.substring(0, (value.length)));
    year = -1; // Lets use an invalid year intentionally
  }

  if ((month < 1) || (month > 12)) {
    // A valid month is between 1 (January) and 12 (December)
    return 'Expiry month is invalid';
  }

  var fourDigitsYear = convertYearTo4Digits(year);
  if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
    // We are assuming a valid should be between 1 and 2099.
    // Note that, it's valid doesn't mean that it has not expired.
    return 'Expiry year is invalid';
  }

  if (!hasDateExpired(month, year)) {
    return "Card has expired";
  }
  return null;
}

/// Convert the two-digit year to four-digit year if necessary
int convertYearTo4Digits(int year) {
  if (year < 100 && year >= 0) {
    var now = DateTime.now();
    String currentYear = now.year.toString();
    String prefix = currentYear.substring(0, currentYear.length - 2);
    year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
  }
  return year;
}

bool hasDateExpired(int month, int year) {
  return isNotExpired(year, month);
}

bool isNotExpired(int year, int month) {
  // It has not expired if both the year and date has not passed
  return !hasYearPassed(year) && !hasMonthPassed(year, month);
}

List<int> getExpiryDate(String value) {
  var split = value.split(new RegExp(r'(/)'));
  return [int.parse(split[0]), int.parse(split[1])];
}

bool hasMonthPassed(int year, int month) {
  var now = DateTime.now();
  // The month has passed if:
  // 1. The year is in the past. In that case, we just assume that the month
  // has passed
  // 2. Card's month (plus another month) is more than current month.
  return hasYearPassed(year) ||
      convertYearTo4Digits(year) == now.year && (month < now.month + 1);
}

bool hasYearPassed(int year) {
  int fourDigitsYear = convertYearTo4Digits(year);
  var now = DateTime.now();
  // The year has passed if the year we are currently is more than card's
  // year
  return fourDigitsYear < now.year;
}

String getCleanedNumber(String text) {
  RegExp regExp = new RegExp(r"[^0-9]");
  return text.replaceAll(regExp, '');
}

String? ratingValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please enter review ';
  }

  return null;
}

String? dateOfBirthValidator({required String value}) {
  if (value.isEmpty) {
    return 'Please select date of birth ';
  }

  return null;
}
