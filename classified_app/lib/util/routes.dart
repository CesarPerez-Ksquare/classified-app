import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/myads_screen.dart';
import '../screens/edit_ad_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/create_new_ad_screen.dart';
import '../screens/image_viewer_screen.dart';

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
  EditProfileScreen.routeName: (ctx) => const EditProfileScreen(),
  MyAdsScreen.routeName: (ctx) => const MyAdsScreen(),
  EditAdScreen.routeName: (ctx) => const EditAdScreen(),
  ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
  CreateNewAdScreen.routeName: (ctx) => const CreateNewAdScreen(),
  ImageViewerScreen.routeName: (ctx) => const ImageViewerScreen(),
};
