import 'package:flutter/material.dart';
import 'package:myfirstapp/custom_widgets/adss.dart';
import 'package:myfirstapp/data/data.dart';

import 'screen_4.dart';
import 'screen_9.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'ads list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Ads Listing"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, SettingsScreen.routeName),
              child: const CircleAvatar(
                  backgroundImage: AssetImage("images/profile.jpg"),
                  radius: 20.0),
            ),
          )
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: ads.length,
          itemBuilder: (context, index) {
            return AdsScreen(
              name: ads[index]["title"],
              price: ads[index]["price"],
              description: ads[index]["description"],
              image: ads[index]["images"][0],
              index: index,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, CreateNewAdScreen.routeName),
        backgroundColor: const Color(0xFFf25723),
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
