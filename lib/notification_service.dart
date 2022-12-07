import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings("launch_background");

  final DarwinInitializationSettings darwinInitializationSettings =
      const DarwinInitializationSettings();

  void initNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String channelId, String channelName, int id,
      String? title, String? body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channelId, channelName);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();

    await flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
            android: androidNotificationDetails,
            iOS: darwinNotificationDetails));
  }
}
