import 'package:flutter/material.dart';
import 'package:myfirstapp/services/auth_service.dart';

import '../models/user_model.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register-screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  UserModel toModel = UserModel();
  bool _isLoading = false;

  setLoadingFalse() {
    setState(() {
      _isLoading = false;
    });
  }

  setLoadingTrue() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 700,
        width: 700,
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Stack(children: [
              Image.asset(
                "images/buildings.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5)),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: 48,
                    width: 250,
                    child: Row(
                      children: [
                        Image.asset(
                          "images/building.png",
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "CLASSIFIED APP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "SELL ANYTHING INSTANTLY",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            )
                          ],
                        )
                      ],
                    )),
              )
            ]),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.name = newValue;
                      });
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Full Name",
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.email = newValue;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email Address",
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.mobile = newValue;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Mobile Number",
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.password = newValue;
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 20.0, color: Color(0xFF7e7e7e))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
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
                      setLoadingTrue();
                      AuthService service = AuthService();
                      _formKey.currentState?.save();
                      await service
                          .register(context, toModel)
                          .then((value) => setLoadingFalse());
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, LoginScreen.routeName),
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xFFf25723),
                    fontSize: 20.0,
                  ),
                )),
          )
        ]),
      ),
    ));
  }
}
