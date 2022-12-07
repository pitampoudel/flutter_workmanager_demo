import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings("launch_background");

  void initNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String channelId, String channelName, int id,
      String? title, String? body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channelId, channelName);
    await flutterLocalNotificationsPlugin.show(id, title, body,
        NotificationDetails(android: androidNotificationDetails));
  }
}
