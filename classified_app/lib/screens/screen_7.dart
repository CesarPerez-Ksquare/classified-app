import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/screen_4.dart';

class EditAdScreen extends StatelessWidget {
  EditAdScreen({super.key});

  static const String routeName = 'edit ad';

  // ignore: non_constant_identifier_names
  final List edit_ads_Abi = [
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
        title: const Text("Edit Ad"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 2.0,
                    color: const Color(0xFFe0e0e0),
                  )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    Text(
                      "Tap to upload",
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    )
                  ]),
            ),
          ),
          SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: edit_ads_Abi["images"].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                    child: Container(
                      height: 75,
                      width: 75,
                      child: Image.network(edit_ads_Abi[index]["images"]),
                    ),)
                  })),
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
                onPressed: () {},
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
