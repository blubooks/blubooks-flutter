class User {
  const User({
    required this.id,
  });
  final String id;
}

class UserLoginForm {
  const UserLoginForm({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  factory UserLoginForm.fromJson(Map<String, dynamic> json) {
    return UserLoginForm(
      email: json['email'],
      password: json['password'],
    );
  }

  static Map<String, dynamic> toJson(UserLoginForm value) =>
      {'email': value.email, 'password': value.password};
}
