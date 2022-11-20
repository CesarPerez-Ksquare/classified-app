import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;
import "package:http/http.dart";
import '../util/alert_manager.dart';
import '../util/constants.dart';
import '../models/user_model.dart';
import '../screens/home_screen.dart';

class AuthService {
  Future register(context, UserModel model) async {
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_REGISTER);
    Map<String, dynamic> modelObj = model.toJson();
    try {
      Response response =
          await http.post(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        AlertManager().displaySnackBar(context, "User successfully created");
        await login(context, model);
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future login(context, UserModel model) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_LOGIN);
    Map<String, dynamic> modelObj = model.toJson();
    try {
      Response response =
          await http.post(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        storage.write(key: "token", value: modelObj["data"]["token"]);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName,
            arguments: {
              "name": modelObj["data"]["user"]["name"],
              "email": modelObj["data"]["user"]["email"],
              "mobile": modelObj["data"]["user"]["mobile"],
              "imgUrl": modelObj["data"]["user"]["imgURL"],
            });
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }
}
