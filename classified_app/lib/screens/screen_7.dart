import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/screen_6.dart';

// ignore: must_be_immutable
class EditAdScreen extends StatelessWidget {
  EditAdScreen({super.key});

  static const String routeName = 'edit ad';

  // ignore: non_constant_identifier_names
  final List edit_ad_images = [
    "https://voluble-tulumba-4022f0.netlify.app/images/ad_01_01.jpeg",
    "https://voluble-tulumba-4022f0.netlify.app/images/ad_01_02.jpeg",
  ];

  final my_ad_data = {
    "title": "iPhone for Sale",
    "price": 19999,
    "mobile": "+919876543210",
    "description": "iPhone for sale with Good Condition",
  };

  // ignore: non_constant_identifier_names
  TextEditingController title_form =
      TextEditingController(text: "iPhone for Sale");
  // ignore: non_constant_identifier_names
  TextEditingController price_form = TextEditingController(text: "19999");
  // ignore: non_constant_identifier_names
  TextEditingController mobile_form =
      TextEditingController(text: "+919876543210");
  // ignore: non_constant_identifier_names
  TextEditingController description_form =
      TextEditingController(text: "iPhone for sale with Good Condition");

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
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: edit_ad_images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                width: 2.0,
                                color: const Color(0xFFe0e0e0),
                              )),
                          child: Image.network(edit_ad_images[index]),
                        ),
                      );
                    })),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
            child: TextField(
              controller: title_form,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFe0e0e0),
                  )),
                  border: OutlineInputBorder(),
                  labelText: "Title",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              controller: price_form,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFe0e0e0),
                  )),
                  border: OutlineInputBorder(),
                  labelText: "Price",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              controller: mobile_form,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFe0e0e0),
                  )),
                  border: OutlineInputBorder(),
                  labelText: "Contact number",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              maxLines: 3,
              controller: description_form,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFe0e0e0),
                  )),
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: SizedBox(
              height: 48,
              width: 452,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFf25723)),
                      elevation: MaterialStateProperty.all(0.0)),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, MyAdsScreen.routeName),
                  child: const Text(
                    'Submit Ad',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
