class User {
  final String uid; // 변경 x
  String username;
  String password;
  String nickname;
  int verifyUsername;
  int verifyNickname;
  String? imageUrl;

  User({
    this.uid = "",
    required this.username,
    required this.password,
    this.nickname = "",
    this.verifyUsername = 1,
    this.verifyNickname = 1,
    this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? "",
      username: json['username'] ?? "",
      password: json['password'] ?? "",
      nickname: json['nickname'] ?? "",
      verifyUsername: json['verifyusername'] ?? 1,
      verifyNickname: json['verifyNickname'] ?? 1,
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'password': password,
        'nickname': nickname,
        'verifyUsername': verifyUsername,
        'verifyNickname': verifyNickname,
        'imageUrl': imageUrl,
      };
}
