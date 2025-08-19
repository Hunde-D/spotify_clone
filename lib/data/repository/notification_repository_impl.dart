import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationRepositoryImpl  {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> requestPermission() async {
    await _messaging.requestPermission();
  }

  Future<void> saveDeviceToken(String userId) async {
    final token = await _messaging.getToken();
    if (token != null) {
      await _firestore.collection("users").doc(userId).update({
        "fcmToken": token,
      });
    }
  }

  Stream<String> get onMessage {
    return FirebaseMessaging.onMessage.map(
      (msg) => msg.notification?.title ?? "",
    );
  }
}
