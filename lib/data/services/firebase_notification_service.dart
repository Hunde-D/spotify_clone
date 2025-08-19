import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingInBackgroundHandler(
  RemoteMessage message,
) async {
  FirebaseNotificationService.instance.setupNotifications();
  FirebaseNotificationService.instance.showNotification(message);
  print("🎸New Song Background FCM: ${message.data}🎶");
}

class FirebaseNotificationService {
  FirebaseNotificationService._();

  static final FirebaseNotificationService instance =
      FirebaseNotificationService._();

  final _messaging = FirebaseMessaging.instance;
  final _localNotification = FlutterLocalNotificationsPlugin();
  bool _isLocalNotificationInitialized = false;

  Future<void> initNotification() async {
    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingInBackgroundHandler,
    );
    await _messaging.subscribeToTopic("all");
    await _requestPermission();
    await _setupMessageHandlers();

    final fcmToken = await _messaging.getToken();
    print('Firebase Cloud Messaging Token: $fcmToken');
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> setupNotifications() async {
    if (!_isLocalNotificationInitialized) {
      //android setup
      const channel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notifications.',
        importance: Importance.high,
      );

      await _localNotification
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(channel);

      const initializationSettingsAndroid = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );

      const initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await _localNotification.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          // Handle the notification tapped event
        },
      );

      _isLocalNotificationInitialized = true;
    }
    return;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    // Handle background messages
    FirebaseMessaging.onMessageOpenedApp.listen(_onBackgroundMessage);

    final initialMessage = await _messaging.getInitialMessage();

    if (initialMessage != null) {
      _onBackgroundMessage(initialMessage);
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      print("🎶New Song: ${message.data}🎶");
    } else {
      print("🎵Foreground message received🎵");
    }
    showNotification(message);
  }

  void _onBackgroundMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      // Handle chat message
    }
  }
}
