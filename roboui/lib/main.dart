import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:roboui/views/robo_ui.dart';
import 'package:roboui/services/get_request.dart';

void setupLocator() {
  // To initialize instances
  GetIt.I.registerLazySingleton(() => RoboFrameServices());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: RoboHome());
  }
}

// Future<http.Response> fetchtext() async {
//   return http.get('http://127.0.0.1:8010/rb/');
// }
