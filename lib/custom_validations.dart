class Validations {
  // Email validation
  static String? validateEmail(String? value) {
    var passNonNullValue = value ?? "";
    RegExp reg = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (passNonNullValue.isEmpty) {
      return 'Please enter your email';
    } else if (!passNonNullValue.contains("@")) {
      return ("Email should contains @");
    } else if (!reg.hasMatch(passNonNullValue)) {
      return ("Email is not valid");
    }
    return null;
  }

  // Password validation
  static String? passwordValidation(String? value) {
    var passNonNullValue = value ?? "";
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length <= 8) {
      return ("Password Must be more than 8 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and Special character ");
    }
    return null;
  }

  // Name validation
  static String? nameValidation(String? value) {
    var nameNonNullValue = value ?? "";
    RegExp regExp = RegExp(r'^[a-zA-Z]*$');
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!regExp.hasMatch(nameNonNullValue)) {
      return ("No number and special characters allowed.");
    }
    return null;
  }

  // Address validation
  static String? addressValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  // Mobile number validation
  static String? mobileValidation(String? value) {
    RegExp regExp = RegExp(r'^\d{10}$');
    var phoneNonNullValue = value ?? "";

    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(phoneNonNullValue)) {
      return ("Only 10 digit allowed");
    }
    return null;
  }

  // Age validation
  static String? ageValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    } else if (int.parse(value) < 18) {
      return ("Age should be more than 18");
    }
    return null;
  }

  // Required field validation
  static String? requireField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }

    return null;
  }

  // Aadhar card validation
  static String? aadharValidation(String? value) {
    RegExp regExp = RegExp(r'^\d{12}$');
    var aadharNonNullValue = value ?? "";

    if (value == null || value.isEmpty) {
      return 'Please enter Aadhar card number';
    } else if (!regExp.hasMatch(aadharNonNullValue)) {
      return ("Aadhar card number should be a 12-digit number");
    }
    return null;
  }

  // PAN card validation
  static String? panValidation(String? value) {
    RegExp regExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    var panNonNullValue = value ?? "";

    if (value == null || value.isEmpty) {
      return 'Please enter PAN card number';
    } else if (!regExp.hasMatch(panNonNullValue)) {
      return (" format should be ABCDE1234F");
    }
    return null;
  }
}
