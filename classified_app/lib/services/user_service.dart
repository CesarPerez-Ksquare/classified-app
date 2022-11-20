import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;
import "package:http/http.dart";
import 'package:myfirstapp/models/picture_model.dart';
import 'package:myfirstapp/models/user_model.dart';
import '../util/alert_manager.dart';
import '../util/constants.dart';
import '../screens/settings_screen.dart';

class UserService {
  Future profile(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_PROFILE);
    Map<String, dynamic> modelObj = {};
    String? token = await storage.read(key: "token");
    try {
      Response response =
          await http.post(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future updateProfile(context, UserModel model) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url =
        Uri.https(Constants().SERVER, Constants().ENDPOINT_UPDATE_PROFILE);
    Map<String, dynamic> modelObj = model.toJson();
    String? token = await storage.read(key: "token");
    try {
      Response response =
          await http.patch(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        AlertManager().displaySnackBar(context, "Profile successfully updated");
        Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future<dynamic> uploadProfilePicture(context, String imagePath) async {
    PictureModel model = PictureModel();
    Uri url = Uri.https(
        Constants().SERVER, Constants().ENDPOINT_UPDATE_PROFILE_PICTURE);
    MultipartRequest request = http.MultipartRequest("POST", url);
    MultipartFile image =
        await http.MultipartFile.fromPath("avatar", imagePath);
    request.files.add(image);
    StreamedResponse response = await request.send();
    dynamic responseStream = await response.stream.bytesToString();
    dynamic responseJson = jsonDecode(responseStream);
    model.imgURL = responseJson["data"]["path"];

    FlutterSecureStorage storage = const FlutterSecureStorage();
    url = Uri.https(Constants().SERVER, Constants().ENDPOINT_UPDATE_PROFILE);
    Map<String, dynamic> modelObj = model.toJson();
    String? token = await storage.read(key: "token");
    try {
      Response response =
          await http.patch(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        AlertManager().displaySnackBar(context, "Profile picture updated");
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
