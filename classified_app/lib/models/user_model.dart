class UserModel {
  UserModel({
    this.name = "",
    this.email = "",
    this.password = "",
    this.mobile = "",
    this.imgUrl = "",
  });

  String? name;
  String? email;
  String? password;
  String? mobile;
  String? imgUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        mobile: json["mobile"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "mobile": mobile,
        "imgUrl": imgUrl,
      };
}
