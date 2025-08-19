abstract class NotificationRepository {
  Future<void> initializeNotifications();
  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  });
}
