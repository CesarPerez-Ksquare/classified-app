import 'package:flutter/material.dart';
import 'package:myfirstapp/services/auth_service.dart';
import '../models/user_model.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  UserModel toModel = UserModel();
  bool _isLoading = false;

  TextEditingController emailController =
      TextEditingController(text: "cesar@gmail.com");

  TextEditingController passwordController =
      TextEditingController(text: "654321");
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
                      const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    controller: emailController,
                    onSaved: ((newValue) {
                      setState(() {
                        toModel.email = newValue;
                      });
                    }),
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
                      const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    controller: passwordController,
                    onSaved: ((newValue) {
                      setState(() {
                        toModel.password = newValue;
                      });
                    }),
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
                          .login(context, toModel)
                          .then((value) => setLoadingFalse());
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
                child: const Center(
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Color(0xFFf25723),
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RegisterScreen())),
                child: const Text(
                  "Don't have any account?",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFf25723),
                  ),
                )),
          )
        ]),
      ),
    ));
  }
}
