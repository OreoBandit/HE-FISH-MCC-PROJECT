class User {
  int id;
  String email;
  String username;
  String pass;
  String token;

  User(
      {required this.id,
      required this.email,
      required this.username,
      required this.pass,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        email: json['email'],
        username: json['username'],
        pass: json['pass'],
        token: json['token']);
  }
}
