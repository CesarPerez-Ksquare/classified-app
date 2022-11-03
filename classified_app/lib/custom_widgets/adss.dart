import 'package:flutter/material.dart';

class AdsScreen extends StatelessWidget {
  final String name;
  final num price;
  final String description;
  final String image;

  const AdsScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
    ));
  }
}
