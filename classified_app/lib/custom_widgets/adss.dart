import 'package:flutter/material.dart';

import '../data/data.dart';
import '../screens/screen_8.dart';

class AdsScreen extends StatelessWidget {
  final String name;
  final num price;
  final String description;
  final String image;
  final int index;

  const AdsScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailScreen.routeName,
        arguments: {
          "title": ads[index]["title"],
          "price": ads[index]["price"],
          "images": ads[index]["images"],
          "createdBy": ads[index]["createdBy"],
          "createdAt": ads[index]["createdAt"],
          "mobile": ads[index]["mobile"],
          "description": ads[index]["description"],
        },
      ),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 12.0),
                height: 52.0,
                color: const Color(0xFF666666).withOpacity(0.5),
                child: Row(children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFcbced0)),
                          ),
                          Text("$price",
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff25723))),
                        ]),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
