import 'package:flutter/material.dart';

class CreateNewAdScreen extends StatelessWidget {
  const CreateNewAdScreen({super.key});

  static const String routeName = 'create new ad';

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
        title: const Text("Create Ad"),
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
          const Padding(
            padding: EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
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
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
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
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
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
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: TextField(
              maxLines: 3,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFe0e0e0),
                  )),
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  alignLabelWithHint: true,
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
                  onPressed: () => Navigator.pop(context),
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
