import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewerScreen extends StatelessWidget {
  ImageViewerScreen({super.key});

  final List<String> imgList = [
    "https://voluble-tulumba-4022f0.netlify.app/images/ad_05_01.jpeg",
    "https://voluble-tulumba-4022f0.netlify.app/images/ad_05_02.jpeg",
    "https://voluble-tulumba-4022f0.netlify.app/images/ad_05_03.jpeg",
    "https://voluble-tulumba-4022f0.netlify.app/images/ad_05_04.jpeg"
  ];

  static const String routeName = 'View images';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ]),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: CarouselSlider(
            options: CarouselOptions(),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 500)),
                    ))
                .toList(),
          )),
    );
  }
}
