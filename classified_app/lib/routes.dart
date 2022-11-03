import 'package:flutter/material.dart';

import 'screens/screen_1.dart';
import 'screens/screen_2.dart';
import 'screens/screen_3.dart';
import 'screens/screen_4.dart';
import 'screens/screen_5.dart';
import 'screens/screen_6.dart';
import 'screens/screen_7.dart';

final routes = <String, WidgetBuilder>{
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  RegisterScreen.routeName: (ctx) => const RegisterScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  SettingsScreen.routeName: (ctx) => const SettingsScreen(),
  EditProfileScreen.routeName: (ctx) => const EditProfileScreen(),
  MyAdsScreen.routeName: (ctx) => MyAdsScreen(),
  EditAdScreen.routeName: (ctx) => EditAdScreen(),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final name = settings.name;

  return MaterialPageRoute(
    builder: routes[name]!,
    settings: settings,
  );
}
