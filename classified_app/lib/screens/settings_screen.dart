import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/home_screen.dart';
import 'package:myfirstapp/services/user_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myfirstapp/screens/edit_profile_screen.dart';
import '../util/constants.dart';
import 'myads_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    UserService profileService = UserService();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, HomeScreen.routeName),
        ),
        backgroundColor: Colors.black,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 28.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: profileService.profile(context),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data["data"]["imgURL"]),
                                radius: 20.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data["data"]["name"],
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 24.0),
                                    ),
                                    Text(
                                      snapshot.data["data"]["mobile"],
                                      style: const TextStyle(
                                          color: Color(0xFF848484),
                                          fontSize: 16.0),
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
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () async {
                                    UserService service = UserService();
                                    await service.profile(context);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                        context, EditProfileScreen.routeName,
                                        arguments: {
                                          "name": snapshot.data["data"]["name"],
                                          "mobile": snapshot.data["data"]
                                              ["mobile"],
                                          "email": snapshot.data["data"]
                                              ["email"],
                                          "imgUrl": snapshot.data["data"]
                                              ["imgURL"],
                                        });
                                  },
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Color(0xFFf25723),
                                    ),
                                  )),
                            )
                          ]);
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something wrong"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFf25723),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushReplacementNamed(
                  context, MyAdsScreen.routeName),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.post_add,
                      size: 32.0,
                      color: Color(0xFF8d8d8d),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36.0),
                      child: Text(
                        "My ads",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => _launchUrl(Constants().URL_ABOUT),
                child: Row(
                  children: const [
                    Icon(
                      Icons.person_outline,
                      size: 32.0,
                      color: Color(0xFF8d8d8d),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36.0),
                      child: Text(
                        "About us",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => _launchUrl(Constants().URL_CONTACT),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.contacts_outlined,
                      size: 32.0,
                      color: Color(0xFF8d8d8d),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36.0),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  url = Uri.parse(url);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw "Couldn't launch $url";
  }
}
