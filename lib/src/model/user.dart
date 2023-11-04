class User {
  late String id;
  late String password;
  late String nickname;

  User({required this.id, required this.password, required this.nickname});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'password': password, 'nickname': nickname};
}
