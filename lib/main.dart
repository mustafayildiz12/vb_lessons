import 'package:dio_servis_learn_202/theme/theme_purple.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'pages/callback_learn.dart';

const simplePeriodicTask = "simplePeriodicTask";
final onNotifications = BehaviorSubject<String?>();
// flutter local notification setup

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: purpleTheme,
      home: const CallBackLearn(),
    );
  }
}
