import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class UserModelAds extends StatelessWidget {
  final String title;
  final num price;
  final String description;
  final List<dynamic> images;
  final String? createdBy;
  final String? mobile;
  final String? createdAt;
  final int index;

  const UserModelAds({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    this.createdBy,
    this.mobile,
    this.createdAt,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailScreen.routeName,
          arguments: {
            "title": title,
            "price": price,
            "description": description,
            "images": images,
            "createdBy": createdBy,
            "mobile": mobile,
            "createdAt": createdAt,
          }),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text("Something went wrong with the image"));
                },
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
                            title,
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
