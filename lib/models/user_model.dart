import 'dart:convert';

class UserModel {
  String socialMediaPreference;
  String phoneNumber;
  String surname;
  String sex;
  String name;
  int age;
  bool admin;

  UserModel({
    required this.socialMediaPreference,
    required this.phoneNumber,
    required this.surname,
    required this.sex,
    required this.name,
    required this.age,
    required this.admin,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        socialMediaPreference: json["socialMediaPreference"],
        phoneNumber: json["phoneNumber"],
        surname: json["surname"],
        sex: json["sex"],
        name: json["name"],
        age: json["age"],
        admin: json["admin"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "socialMediaPreference": socialMediaPreference,
        "phoneNumber": phoneNumber,
        "surname": surname,
        "sex": sex,
        "name": name,
        "admin": admin,
      };

  UserModel copyWith({
    String? socialMediaPreference,
    String? phoneNumber,
    String? surname,
    String? sex,
    String? name,
    int? age,
    bool? admin,
  }) =>
      UserModel(
        socialMediaPreference:
            socialMediaPreference ?? this.socialMediaPreference,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        surname: surname ?? this.surname,
        sex: sex ?? this.sex,
        name: name ?? this.name,
        age: age ?? this.age,
        admin: admin ?? this.admin,
      );
}
