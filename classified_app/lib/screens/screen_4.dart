import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/screen_5.dart';

import 'screen_6.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpg"),
                    radius: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sundar",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        Text(
                          "9876543210",
                          style: TextStyle(
                              color: Color(0xFF848484), fontSize: 12.0),
                        )
                      ]),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pushNamed(
                          context, EditProfileScreen.routeName),
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xFFf25723),
                        ),
                      )),
                )
              ]),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, MyAdsScreen.routeName),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.post_add,
                    color: Color(0xFF8d8d8d),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 36.0),
                    child: Text(
                      "My ads",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Icon(
                  Icons.person_outline,
                  color: Color(0xFF8d8d8d),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 36.0),
                  child: Text(
                    "About us",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Icon(
                  Icons.contacts_outlined,
                  color: Color(0xFF8d8d8d),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 36.0),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
