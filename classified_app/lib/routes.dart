import 'package:flutter/material.dart';

import 'screens/screen_1.dart';
import 'screens/screen_2.dart';
import 'screens/screen_3.dart';
import 'screens/screen_4.dart';
import 'screens/screen_5.dart';
import 'screens/screen_6.dart';
import 'screens/screen_7.dart';
import 'screens/screen_8.dart';
import 'screens/screen_9.dart';
import 'screens/screen_10.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final name = settings.name;

  return MaterialPageRoute(
    builder: routes[name]!,
    settings: settings,
  );
}

var routes = <String, WidgetBuilder>{
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  RegisterScreen.routeName: (ctx) => const RegisterScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  SettingsScreen.routeName: (ctx) => const SettingsScreen(),
  EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
  MyAdsScreen.routeName: (ctx) => const MyAdsScreen(),
  EditAdScreen.routeName: (ctx) => const EditAdScreen(),
  ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
  CreateNewAdScreen.routeName: (ctx) => const CreateNewAdScreen(),
  ImageViewerScreen.routeName: (ctx) => const ImageViewerScreen(),
};
