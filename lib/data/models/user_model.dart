
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;

  UserModel({required this.id, required this.fullName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uid'],
      fullName: json['full_name'],
      email: json['email_address'],
    );
  }

  factory UserModel.fromFirebase(User firebaseUser) {
    return UserModel(
      id: firebaseUser.uid,
      fullName: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'uid': id, 'full_name': fullName, 'email_address': email};
  }
}
