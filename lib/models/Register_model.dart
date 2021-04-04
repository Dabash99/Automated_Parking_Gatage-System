class RegisterResponseModel {
  final String token;

  final String error;

  RegisterResponseModel({this.token, this.error});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class RegisterRequestModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String carNumber;
  String carLetter;

  RegisterRequestModel({this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.carLetter,
    this.carNumber});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "email": email.trim(),
      "password": password.trim(),
      "phoneNumber": phoneNumber.trim(),
      "carNumber": carNumber.trim(),
      "carLetter": carLetter,
    };
    return map;
  }

}