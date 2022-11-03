import 'package:flutter/material.dart';

import 'screen_7.dart';

class MyAdsScreen extends StatelessWidget {
  MyAdsScreen({super.key});

  static const String routeName = 'my ads screen';

  // ignore: non_constant_identifier_names
  final List my_ads_Abi = [
    {
      "id": "ad_01",
      "title": "iPhone for Sale",
      "price": 19999,
      "createdBy": "Abi",
      "createdAt": "5 days ago",
      "mobile": "+919876543210",
      "description": "iPhone for sale with Good Condition",
      "images": [
        "https://voluble-tulumba-4022f0.netlify.app/images/ad_01_01.jpeg",
        "https://voluble-tulumba-4022f0.netlify.app/images/ad_01_02.jpeg",
      ]
    },
    {
      "id": "ad_02",
      "title": "Audi A6 for Sale",
      "price": 2000000,
      "createdBy": "Abi",
      "createdAt": "3 days ago",
      "mobile": "+919876543211",
      "description": "Audi A6 for Sale with Good Condition",
      "images": [
        "https://voluble-tulumba-4022f0.netlify.app/images/ad_02_01.jpeg",
        "https://voluble-tulumba-4022f0.netlify.app/images/ad_02_02.jpeg",
        "https://voluble-tulumba-4022f0.netlify.app/images/ad_02_03.jpeg",
      ]
    },
  ];

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
        title: const Text("My Ads"),
      ),
      body: ListView.builder(
          itemCount: my_ads_Abi.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, EditAdScreen.routeName),
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
                                  my_ads_Abi[index]["images"][0],
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  my_ads_Abi[index]["title"],
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
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        my_ads_Abi[index]["createdAt"],
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFFaaaaaa)),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  my_ads_Abi[index]["price"].toString(),
                                  style: const TextStyle(
                                      fontSize: 20.0, color: Color(0xFFf25723)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
