class UserLogin {
  const UserLogin(this.email, this.password);

  final String email;
  final String password;

  factory UserLogin.fromJson(Map<String, String> json) {
    return UserLogin(json['username'] as String, json['password'] as String);
  }

  Map<String, String> toJson() {
    return {
      'username': email,
      'password': password
    };
  }
}