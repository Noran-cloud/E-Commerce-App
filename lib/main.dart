import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/DI/di.dart' as di;
import 'package:rwad2/Screens/CRUD_firebase.dart';
import 'package:rwad2/Screens/HarryPotter.dart';
import 'package:rwad2/Screens/Search_product.dart';
import 'package:rwad2/Screens/add_note.dart';
import 'package:rwad2/Screens/all_products.dart';
import 'package:rwad2/Screens/animation1.dart';
import 'package:rwad2/Screens/displayComments.dart';
import 'package:rwad2/Screens/displayWeather.dart';
import 'package:rwad2/Screens/doctorUI.dart';
import 'package:rwad2/Screens/firebase_notification.dart';
import 'package:rwad2/Screens/loginScreen.dart';
import 'package:rwad2/Screens/movies_Screen.dart';
import 'package:rwad2/Screens/notes.dart';
import 'package:rwad2/Screens/showProduct.dart';
import 'package:rwad2/Screens/signupScreen.dart';
import 'package:rwad2/Screens/user_screen.dart';
import 'package:rwad2/Services/harryPotter_service.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/Services/weather_service.dart';
import 'package:rwad2/cubit/comments_cubit.dart';
import 'package:rwad2/cubit/harry_potter_cubit.dart';
import 'package:rwad2/cubit/login_api_cubit.dart';
import 'package:rwad2/cubit/weather_cubit.dart';
import 'package:rwad2/firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  "high_importance_channel",
  "High Importance Notifications",
  description: "This is channel for FCM test",
  importance: Importance.max,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();
  final LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'Open notification');
  final WindowsInitializationSettings initializationSettingsWindows =
      WindowsInitializationSettings(
        appName: 'Flutter Local Notifications Example',
        appUserModelId: 'Com.Dexterous.FlutterLocalNotificationsExample',
        // Search online for GUID generators to make your own
        guid: 'd49b0314-ee7a-4626-bf79-97cdb8a991bb',
      );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    macOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux,
    windows: initializationSettingsWindows,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) {
      print("Local Notification clicked");
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) =>
            HarryPotterCubit(HarryPotterService())..getHarryBooks(),
        child: Harrypotter(),
      ),
    );
  }
}
