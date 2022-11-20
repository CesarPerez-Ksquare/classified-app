import 'package:flutter/material.dart';
import 'package:myfirstapp/services/ads_service.dart';
import 'package:myfirstapp/util/days_calculator.dart';
import 'edit_ad_screen.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  static const String routeName = 'my ads screen';

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
        title: const Text(
          "My Ads",
          style: TextStyle(fontSize: 28.0),
        ),
      ),
      body: FutureBuilder(
          future: AdsService().userAds(context),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> myAds = snapshot.data!["data"];
              return ListView.builder(
                  itemCount: myAds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          EditAdScreen.routeName,
                          arguments: {
                            "title": myAds[index]["title"],
                            "price": myAds[index]["price"],
                            "images": myAds[index]["images"],
                            "mobile": myAds[index]["mobile"],
                            "description": myAds[index]["description"],
                            "_id": myAds[index]["_id"],
                          },
                        ),
                        child: Container(
                            height: 150,
                            width: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  width: 2.0,
                                  color: const Color(0xFFe0e0e0),
                                )),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                          myAds[index]["images"][0],
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          myAds[index]["title"],
                                          style: const TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.timer_outlined,
                                              size: 12.0,
                                              color: Color(0xFFaaaaaa),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Text(
                                                TimeAgoCalculator()
                                                    .timeAgoCalculator(snapshot
                                                            .data!["data"]
                                                        [index]["createdAt"]),
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Color(0xFFaaaaaa)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          myAds[index]["price"].toString(),
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFFf25723)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  });
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
}
