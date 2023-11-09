class User {
  late String username;
  late String password;
  late String nickname;
  int verifyUsername;
  int verifyNickname;

  User({
    required this.username,
    required this.password,
    required this.nickname,
    this.verifyUsername = 1,
    this.verifyNickname = 1,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      nickname: json['nickname'],
      verifyUsername: json['verifyusername'] ?? 1,
      verifyNickname: json['verifyNickname'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'nickname': nickname,
        'verifyUsername': verifyUsername,
        'verifyNickname': verifyNickname,
      };
}
