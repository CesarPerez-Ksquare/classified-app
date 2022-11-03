import 'package:flutter/material.dart';
import 'package:myfirstapp/routes.dart';
import 'package:myfirstapp/screens/screen_1.dart';
import 'package:myfirstapp/screens/screen_8.dart';

import 'screens/screen_10.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      title: 'Classified App',
      home: LoginScreen(),
    );
  }
}
