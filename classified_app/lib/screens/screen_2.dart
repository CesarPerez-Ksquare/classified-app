import 'package:flutter/material.dart';

import 'screen_1.dart';
import 'screen_3.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 700,
      width: 500,
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
                  width: 220,
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
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "SELL ANYTHING INSTANTLY",
                            style:
                                TextStyle(color: Colors.white, fontSize: 8.0),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ]),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Full Name",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email Address",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Mobile Number",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 16.0, color: Color(0xFF7e7e7e))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
          child: SizedBox(
            height: 48,
            width: 452,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFf25723)),
                    elevation: MaterialStateProperty.all(0.0)),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, HomeScreen.routeName),
                child: const Text(
                  'Register Now',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
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
                ),
              )),
        )
      ]),
    ));
  }
}
