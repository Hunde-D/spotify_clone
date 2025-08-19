
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String fcmToken;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.fcmToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uid'],
      fullName: json['full_name'],
      email: json['email_address'],
      fcmToken: json['fcm_token'],
    );
  }

  factory UserModel.fromFirebase(
    User firebaseUser, {
    String? fullName,
    String? fcmToken,
  }) {
    return UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      fullName: fullName ?? '',
      fcmToken: fcmToken ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': fullName, 'email': email, 'fcm_token': fcmToken};
  }
}
