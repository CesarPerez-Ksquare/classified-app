import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/screen_6.dart';

class EditAdScreen extends StatelessWidget {
  const EditAdScreen({super.key});

  static const String routeName = 'edit ad';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    TextEditingController titleForm =
        TextEditingController(text: args["title"]);
    TextEditingController priceForm =
        TextEditingController(text: args["price"].toString());
    TextEditingController mobileForm =
        TextEditingController(text: args["mobile"]);
    TextEditingController descriptionForm =
        TextEditingController(text: args["description"]);

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
                    itemCount: args["images"].length,
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
                          child: Image.network(args["images"][index]),
                        ),
                      );
                    })),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
            child: TextField(
              controller: titleForm,
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
              controller: priceForm,
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
              controller: mobileForm,
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
              controller: descriptionForm,
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
