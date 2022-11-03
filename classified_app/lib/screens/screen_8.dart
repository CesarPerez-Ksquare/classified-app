import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/screen_6.dart';

import 'screen_10.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  static const String routeName = 'Product detail';

  // ignore: non_constant_identifier_names
  final my_product_data = {
    "title": "iPhone for Sale",
    "price": 19999,
    "createdBy": "Abi",
    "createdAt": "5 days ago",
    "description": "iPhone for sale with Good Condition",
    "image": "https://voluble-tulumba-4022f0.netlify.app/images/ad_01_01.jpeg",
  };

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Audi A6 for Sale",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 0),
              child: Text(
                "2000000",
                style: TextStyle(fontSize: 16.0, color: Color(0xFFf25723)),
              )),
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, ImageViewerScreen.routeName),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      "https://voluble-tulumba-4022f0.netlify.app/images/ad_02_01.jpeg",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
            child: Row(children: [
              Row(
                children: const [
                  Icon(
                    Icons.person_outline,
                    size: 12.0,
                  ),
                  Text(
                    "Abi",
                    style: TextStyle(fontSize: 12.0),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 12.0, 0),
                child: Row(children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.timer_outlined,
                        size: 12.0,
                      ),
                      Text(
                        "3 days ago",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  )
                ]),
              ),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Audi A6 for Sale with Good Condition",
                  style: TextStyle(fontSize: 16.0),
                )),
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
                  onPressed: () {},
                  child: const Text(
                    'Contact Seller',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
