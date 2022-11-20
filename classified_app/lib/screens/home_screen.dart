import 'package:flutter/material.dart';
import 'package:myfirstapp/custom_widgets/ad_model.dart';
import 'package:myfirstapp/services/ads_service.dart';
import 'package:myfirstapp/services/user_service.dart';
import 'package:myfirstapp/util/days_calculator.dart';
import 'settings_screen.dart';
import 'create_new_ad_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'ads list';

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Ads Listing",
            style: TextStyle(fontSize: 28.0),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: FutureBuilder(
                  future: UserService().profile(context),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> userData = snapshot.data["data"];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SettingsScreen.routeName,
                              arguments: {
                                "name": userData["name"],
                                "email": userData["email"],
                                "mobile": userData["mobile"],
                                "imgUrl": userData["imgUrl"],
                              });
                        },
                        child: FutureBuilder(
                            future: UserService().profile(context),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                return CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userData["imgURL"]),
                                    radius: 20.0);
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
                            }),
                      );
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
                  }),
            )
          ]),
      body: FutureBuilder(
          future: AdsService().fetchAds(context),
          builder: ((BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> allAds = snapshot.data!["data"];

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: allAds.length,
                  itemBuilder: (context, index) {
                    dynamic ad = allAds[index];
                    String createdAt =
                        TimeAgoCalculator().timeAgoCalculator(ad["createdAt"]);
                    return UserModelAds(
                      title: ad["title"],
                      price: ad["price"],
                      description: ad["description"],
                      images: ad["images"] ?? "",
                      index: index,
                      createdBy: ad["authorName"],
                      mobile: ad["mobile"],
                      createdAt: createdAt,
                    );
                  });
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something wrong"));
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFFf25723),
              ));
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, CreateNewAdScreen.routeName),
        backgroundColor: const Color(0xFFf25723),
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
