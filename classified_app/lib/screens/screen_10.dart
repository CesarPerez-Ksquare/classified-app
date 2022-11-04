import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({super.key});

  static const String routeName = 'View images';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final List<String> imgList = args["images"];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Container(),
          actions: <Widget>[
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
            options: CarouselOptions(viewportFraction: 1.0),
            items: imgList
                .map((item) => Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 500)))
                .toList(),
          )),
    );
  }
}
