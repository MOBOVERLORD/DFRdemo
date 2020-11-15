import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:roboui/views/robo_ui.dart';

void setuplocator() {
  GetIt.I.registerLazySingleton(() => RoboFramServices());
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to',
        theme: ThemeData(primarySwatch: Colors.red),
        home: RoboHome());
  }
}

// Future<http.Response> fetchtext() async {
//   return http.get('http://127.0.0.1:8010/rb/');
// }