import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'image_viewer_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static const String routeName = 'Product detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    args["title"],
                    style: const TextStyle(
                        fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 0),
                child: Text(
                  args["price"].toString(),
                  style:
                      const TextStyle(fontSize: 20.0, color: Color(0xFFf25723)),
                )),
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                ImageViewerScreen.routeName,
                arguments: {"images": args["images"]},
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        args["images"][0],
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
              child: Row(children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16.0,
                    ),
                    Text(
                      args["createdBy"],
                      style: const TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 0, 12.0, 0),
                  child: Row(children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          size: 16.0,
                        ),
                        Text(
                          args["createdAt"],
                          style: const TextStyle(fontSize: 16.0),
                        )
                      ],
                    )
                  ]),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    args["description"],
                    style: const TextStyle(fontSize: 20.0),
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: SizedBox(
                height: 48,
                width: 452,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFf25723)),
                        elevation: MaterialStateProperty.all(0.0)),
                    onPressed: () => _launchUrl("tel:${args["mobile"]}"),
                    child: const Text(
                      "Contact Seller",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  url = Uri.parse(url);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw "Couldn't launch $url";
  }
}
