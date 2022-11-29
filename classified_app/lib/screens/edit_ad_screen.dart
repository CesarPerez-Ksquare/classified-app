import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfirstapp/models/ads_model.dart';
import 'package:myfirstapp/services/ads_service.dart';
import 'package:myfirstapp/services/user_service.dart';

class EditAdScreen extends StatefulWidget {
  const EditAdScreen({super.key});

  static const String routeName = 'edit ad';

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen> {
  final _formKey = GlobalKey<FormState>();
  AdsModel toModel = AdsModel();
  bool _isLoading = false;
  bool _isLoading2 = false;

  setLoadingFalse(isLoading) {
    setState(() {
      isLoading = false;
    });
  }

  setLoadingTrue(isLoading) {
    setState(() {
      isLoading = true;
    });
  }

  List<dynamic> _imageList = [];
  dynamic lista = [];

  Future<dynamic> pickImage() async {
    List<XFile?> imagePicked = await ImagePicker().pickMultiImage();
    if (imagePicked.isNotEmpty) {
      setState(() async {
        _imageList = imagePicked;
        lista = await AdsService()
            .updateAdPhotos(context, _imageList)
            .then((value) => setLoadingFalse(_isLoading2));
        print(lista);
      });
    }
  }

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
        title: const Text(
          "Edit Ad",
          style: TextStyle(fontSize: 28.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () async {
                await pickImage();
              },
              child: Container(
                height: 150,
                width: 150,
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
                        size: 60.0,
                      ),
                      Text(
                        "Tap to upload",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      )
                    ]),
              ),
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.title = newValue;
                      });
                    },
                    controller: titleForm,
                    style: const TextStyle(fontSize: 20.0),
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
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.price = int.parse(newValue!);
                      });
                    },
                    controller: priceForm,
                    style: const TextStyle(fontSize: 20.0),
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
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.mobile = newValue;
                      });
                    },
                    controller: mobileForm,
                    style: const TextStyle(fontSize: 20.0),
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
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        toModel.description = newValue;
                      });
                    },
                    maxLines: 3,
                    controller: descriptionForm,
                    style: const TextStyle(fontSize: 20.0),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: SizedBox(
                height: 48,
                width: 452,
                child: Visibility(
                  visible: _isLoading,
                  replacement: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFf25723)),
                        elevation: MaterialStateProperty.all(0.0)),
                    onPressed: () async {
                      setLoadingTrue(_isLoading);
                      setLoadingTrue(_isLoading2);
                      _formKey.currentState?.save();
                      // toModel.images = await AdsService()
                      //     .updateAdPhotos(context, _imageList)
                      //     .then((value) => setLoadingFalse(_isLoading2));
                      print(toModel.images);
                      // ignore: use_build_context_synchronously
                      var wait = Future.delayed(const Duration(seconds: 5), () {
                        toModel.images = _imageList;
                      });
                      await AdsService()
                          .updateAd(context, toModel, args["_id"])
                          .then((value) => setLoadingFalse(_isLoading));
                    },
                    child: const Text(
                      'Submit Ad',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  child: const Center(
                    child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Color(0xFFf25723),
                      ),
                    ),
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
