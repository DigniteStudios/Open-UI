
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/services/service_locator.dart';
import '../core/services/storage_service.dart';


class NotificationController {
  final StorageService _prefsService = locator<StorageService>();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "high_importance_channel", // id
    "High Importance Notifications", // title
    description: "This channel is used for important notifications.", // description
    importance: Importance.max,
  );

  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  static const AndroidInitializationSettings _initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');
  static const DarwinInitializationSettings _initializationSettingsDarwin = DarwinInitializationSettings(

    // onDidReceiveLocalNotification: (id, title, body, payload) {},
  );
  final InitializationSettings initializationSettings = const InitializationSettings(
    android: _initializationSettingsAndroid,
    iOS: _initializationSettingsDarwin,);

  NotificationController() : super() {
    _initNotification();
    FirebaseMessaging.onMessage.listen(_handleNotification);
  }

  Future<void> _initNotification() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // use the returned token to send messages to users from your custom server
    String? token = await messaging.getToken();
    if(token?.isNotEmpty ?? false) {
      _prefsService.setFCMToken(token!);
    }
    debugPrint("FCM TOKEN:: $token");

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {},
      // onDidReceiveBackgroundNotificationResponse: (details) {},
    );
  }

  _handleNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    debugPrint("REMOTE MESSAGE:: ${message.notification?.title}");

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
              // other properties...
            ),
          ));
    }
  }
}