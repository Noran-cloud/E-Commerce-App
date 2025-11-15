// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rwad2/main.dart';

// class FirebaseNotification extends StatefulWidget {
//   const FirebaseNotification({super.key});

//   @override
//   State<FirebaseNotification> createState() => _FirebaseNotificationState();
// }

// class _FirebaseNotificationState extends State<FirebaseNotification> {
//   String? _token;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initFCM();
//   }

//   void initFCM() async {
//     final messeging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messeging.requestPermission();
//     print('User Granted Permission: ${settings.authorizationStatus}');
//     String? token = await messeging.getToken();

//     setState(() {
//       _token = token;
//     });

//     print('FCM Token: $token');

//     //when app is in foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage messege) {
//       final notification = messege.notification;
//       if (notification != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               androidChannel.id,
//               androidChannel.name,
//             ),
//             iOS: DarwinNotificationDetails(),
//           ),
//         );
//       }
//     });

//     //when user turn on notification and app is in background
//     FirebaseMessaging.onMessageOpenedApp.listen((messege) {
//       print('OnMessegeOpenedApp: ${messege.data}');
//     });

//     //App is completely terminated
//     RemoteMessage? initialMessege = await messeging.getInitialMessage();
//     if (initialMessege != null) {
//       print(
//         'App opened from terminated state by messege: ${initialMessege.data}',
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('FCM Token : $_token')));
//   }
// }
