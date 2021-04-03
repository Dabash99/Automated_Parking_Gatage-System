// To parse this JSON data, do
//
//     final userModelRegister = userModelRegisterFromJson(jsonString);

import 'dart:convert';

UserModelRegister userModelRegisterFromJson(String str) => UserModelRegister.fromJson(json.decode(str));

String userModelRegisterToJson(UserModelRegister data) => json.encode(data.toJson());

class UserModelRegister {
  UserModelRegister({
    this.user,
  });

  User user;

  factory UserModelRegister.fromJson(Map<String, dynamic> json) => UserModelRegister(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.carNumber,
    this.carLetter,
  });

  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String carNumber;
  String carLetter;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    carNumber: json["carNumber"],
    carLetter: json["carLetter"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "carNumber": carNumber,
    "carLetter": carLetter,
  };
}
