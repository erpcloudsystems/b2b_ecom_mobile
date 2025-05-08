class LoginModel {
  final String? phoneNumber;
  final String? password;
  final String? name;
  final String? username;
  final String? sid;
  final String? userImage;
  final String? systemUser;
  final String? userId;

  LoginModel({
    this.phoneNumber,
    this.password,
    this.name,
    this.username,
    this.sid,
    this.userImage,
    this.systemUser,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      "usr": phoneNumber,
      "pwd": password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      name: map["name"],
      username: map["full_name"],
      sid: map["sid"],
      userImage: map["user_image"],
      systemUser: map["system_user"],
      userId: map["user_id"],
    );
  }
}
