import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initNotifications();
  runApp(const MaterialApp(home: MyApp()));
}

Future<void> _initNotifications() async {
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidSettings);

  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _showNotification() {
    flutterLocalNotificationsPlugin.show(
      1,
      'Тестовое уведомление',
      'прием прием',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'test_channel',
          'Test Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Тест уведомлений')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: const Text('Проверка'),
        ),
      ),
    );
  }
}