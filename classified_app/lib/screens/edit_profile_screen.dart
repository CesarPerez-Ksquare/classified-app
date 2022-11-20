import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/login_screen.dart';
import 'package:myfirstapp/services/user_service.dart';
import '../models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String routeName = 'edit profile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  UserModel toModel = UserModel();
  // UserModel toModelImage = UserModel();
  final bool _isLoading = false;
  final bool _isLoading2 = false;

  setLoadingFalse(isLoading) {
    setState(() {
      isLoading = false;
    });
  }

  setLoadingTrue(isLoading) {
    setState(() {
      isLoading = true;
    });
  }

  String _imagePath = "";

  Future<dynamic> pickImage() async {
    XFile? imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      setState(() {
        _imagePath = imagePicked.path;
      });
      setLoadingTrue(_isLoading2);

      // ignore: use_build_context_synchronously
      await UserService()
          .uploadProfilePicture(context, _imagePath)
          .then((value) => setLoadingFalse(_isLoading2));
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    TextEditingController nameController =
        TextEditingController(text: args["name"]);

    TextEditingController emailController =
        TextEditingController(text: args["email"]);

    TextEditingController mobileController =
        TextEditingController(text: args["mobile"]);

    dynamic imageSelect(String imagePath) {
      if (imagePath.isEmpty) {
        return NetworkImage(args["imgUrl"]);
      } else {
        return FileImage(File(imagePath));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          "Edit profile",
          style: TextStyle(fontSize: 28.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: UserService().profile(context),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return InkWell(
                      onTap: () async {
                        await pickImage();
                        setState(() async {
                          await UserService().profile(context);
                          setLoadingFalse(_isLoading2);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Visibility(
                          visible: _isLoading2,
                          replacement: CircleAvatar(
                              // backgroundImage: NetworkImage(
                              //     snapshot.data!["data"]["imgURL"]),
                              backgroundImage: imageSelect(_imagePath),
                              radius: 40.0),
                          child: const Center(
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Color(0xFFf25723),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFf25723),
                      ),
                    );
                  }
                }),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: ((newValue) {
                        setState(() {
                          toModel.name = newValue;
                        });
                      }),
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(fontSize: 20.0),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: ((newValue) {
                        setState(() {
                          toModel.email = newValue;
                        });
                      }),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 20.0),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email Address",
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: ((newValue) {
                        setState(() {
                          toModel.mobile = newValue;
                        });
                      }),
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(fontSize: 20.0),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Contact Number",
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
              child: SizedBox(
                height: 48,
                width: 452,
                child: Visibility(
                  visible: _isLoading,
                  replacement: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFf25723)),
                          elevation: MaterialStateProperty.all(0.0)),
                      onPressed: () async {
                        setLoadingTrue(_isLoading);
                        UserService service = UserService();
                        _formKey.currentState?.save();
                        await service
                            .updateProfile(context, toModel)
                            .then((value) => setLoadingFalse(_isLoading));
                      },
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                  child: const Center(
                      child: SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: Color(0xFFf25723),
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold)),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFf25723),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
