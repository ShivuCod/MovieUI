class User {
  String username;
  String password;
  String email;
  String passwordConfirm;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.passwordConfirm,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      passwordConfirm: json['passwordConfirm'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "email": email
    };
  }
}
