import 'package:flutter/material.dart';
import 'package:myfirstapp/util/routes.dart';
import 'package:myfirstapp/screens/login_screen.dart';

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
