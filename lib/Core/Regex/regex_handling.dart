class RegexHandling {
  static bool validatePhoneRegexHandler(String phoneNo) {
    String pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(phoneNo);
  }

  static bool validateEmailRegexHandler(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);

    return regExp.hasMatch(email);
  }

  static bool validateIdentityCard(String identityCard, String countryCode) {
    String egyptianIdPattern = r'^[2-3][0-9]{13}$'; // Egyptian ID validation
    String saudiIdPattern = r'^[1-2][0-9]{9}$'; // Saudi ID validation
    String? pattern;

    if (countryCode == 'EG') {
      pattern = egyptianIdPattern;
    } else if (countryCode == 'SA') {
      pattern = saudiIdPattern;
    }

    if (pattern != null) {
      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(identityCard );
    }

    return false;
  }
}
