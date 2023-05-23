class Validate {
  static bool isNumeric(String s) {
    if (s.trim() == "" || s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static bool isPhoneValidWithout0(String? phoneNo) {
    if (phoneNo == null || phoneNo.length < 8 || phoneNo.length > 10)
      return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{9,11}$)');
    return regExp.hasMatch(phoneNo);
  }

  static bool isPhoneValid(String? phoneNo) {
    if (phoneNo == null || phoneNo.length < 9 || phoneNo.length > 10)
      return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }

  static bool isEmailValid(String? email) {
    if (email == null) return false;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regExp.hasMatch(email);
  }
}
