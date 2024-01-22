import 'package:cloud_firestore/cloud_firestore.dart';

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

  /*factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
        id: document.id,
        email: data["Email"],
        password: data["Password"],
        username: data["Username"],
        phone: data["Phone"]);
  }*/
}
