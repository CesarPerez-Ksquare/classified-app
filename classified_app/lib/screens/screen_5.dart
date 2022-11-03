import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/screen_1.dart';
import 'package:myfirstapp/screens/screen_4.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static const String routeName = 'edit profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Edit profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
                radius: 40.0),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Sundaravel",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "sundar@appmaking.co",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "+919876543210",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
            child: SizedBox(
              height: 48,
              width: 452,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFf25723)),
                      elevation: MaterialStateProperty.all(0.0)),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, SettingsScreen.routeName),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, LoginScreen.routeName),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Color(0xFFf25723),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
