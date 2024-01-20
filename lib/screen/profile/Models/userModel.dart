import 'dart:convert';

class UserModel {
  String email;
  String profileImage;
  List<String> alamat;
  List<String> label;

  UserModel({
    required this.email,
    required this.profileImage,
    required this.alamat,
    required this.label,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["Email"],
        profileImage: json["ProfileImage"],
        alamat: List<String>.from(json["Alamat"].map((x) => x)),
        label: List<String>.from(json["Label"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "ProfileImage": profileImage,
        "Alamat": List<dynamic>.from(alamat.map((x) => x)),
        "Label": List<dynamic>.from(label.map((x) => x)),
      };
}
