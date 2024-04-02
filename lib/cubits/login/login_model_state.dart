class LoginModel {
  final String firstText;
  final String secondText;
  final String oldUserText;

  LoginModel({
    required this.oldUserText,
    required this.firstText,
    required this.secondText,
  });

  LoginModel copyWith(
      {String? firstText, String? secondText, String? oldUserText}) {
    return LoginModel(
      oldUserText: oldUserText ?? this.oldUserText,
      firstText: firstText ?? this.firstText,
      secondText: secondText ?? this.secondText,
    );
  }
}
