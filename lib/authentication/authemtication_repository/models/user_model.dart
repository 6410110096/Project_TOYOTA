class UserModel {
  final String? id;
  final String username;
  final String email;
  final String phone;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
  });

  toJson() {
    return {
      'FullName': username,
      'Email': email,
      'Phone': phone,
      'Password': password,
    };
  }
}
