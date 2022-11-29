import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfirstapp/models/picture_model.dart';
import 'package:myfirstapp/screens/myads_screen.dart';
import '../util/alert_manager.dart';
import '../util/constants.dart';
import "package:http/http.dart" as http;
import '../models/ads_model.dart';

class AdsService {
  Future<Map<String, dynamic>> fetchAds(context) async {
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_ADS);
    Map<String, dynamic> modelObj = {};
    try {
      Response response = await http.get(url);
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        AlertManager().displaySnackBar(context, "Ads successfully updated");
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future<Map<String, dynamic>> createAd(context, AdsModel model) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_ADS);
    Map<String, dynamic> modelObj = model.toJson();
    String? token = await storage.read(key: "token");
    try {
      Response response =
          await http.post(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        AlertManager().displaySnackBar(context, "Ad successfully created ");
        Navigator.pop(context);
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future<Map<String, dynamic>> userAds(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_ADS_USER);
    Map<String, dynamic> modelObj = {};
    String? token = await storage.read(key: "token");
    try {
      Response response =
          await http.post(url, body: jsonEncode(modelObj), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      modelObj = jsonDecode(response.body);
      if (modelObj["status"] == true) {
        AlertManager().displaySnackBar(context, "User posted ads");
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future<Map<String, dynamic>> updateAd(
      context, AdsModel model, String id) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Uri url =
        Uri.https(Constants().SERVER, "${Constants().ENDPOINT_ADS}${"/"}$id");
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
        AlertManager().displaySnackBar(context, "Ad successfully updated");
        Navigator.pushReplacementNamed(context, MyAdsScreen.routeName);
      }
      if (modelObj["status"] == false) {
        AlertManager().displaySnackBar(context, modelObj["message"]["message"]);
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  Future<dynamic> updateAdPhotos(context, List<dynamic> imageList) async {
    List<dynamic> imagesListPath = [];
    Uri url = Uri.https(Constants().SERVER, Constants().ENDPOINT_ADS_PHOTOS);
    try {
      MultipartRequest request = http.MultipartRequest("POST", url);
      for (dynamic imagePath in imageList) {
        MultipartFile image =
            await http.MultipartFile.fromPath("photos", imagePath.path);
        request.files.add(image);
      }
      StreamedResponse response = await request.send();
      dynamic responseStream = await response.stream.bytesToString();
      dynamic responseJson = jsonDecode(responseStream);
      imagesListPath = (responseJson["data"]["path"]);
      print(imagesListPath);
      return imagesListPath;
    } catch (e) {
      print("Eerrrrrrrrrrrrrrrrrrrrrrrrorrrr: ");
      print(e);
      return imagesListPath;
    }
  }
}
