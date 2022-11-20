import 'package:flutter/material.dart';
import 'package:myfirstapp/models/ads_model.dart';
import 'package:myfirstapp/services/ads_service.dart';

class CreateNewAdScreen extends StatefulWidget {
  const CreateNewAdScreen({super.key});

  static const String routeName = 'create new ad';

  @override
  State<CreateNewAdScreen> createState() => _CreateNewAdScreenState();
}

class _CreateNewAdScreenState extends State<CreateNewAdScreen> {
  final _formKey = GlobalKey<FormState>();
  AdsModel toModel = AdsModel();
  bool _isLoading = false;

  setLoadingFalse() {
    setState(() {
      _isLoading = false;
    });
  }

  setLoadingTrue() {
    setState(() {
      _isLoading = true;
    });
  }

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
        title: const Text(
          "Create Ad",
          style: TextStyle(fontSize: 28.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: (newValue) {
                        setState(() {
                          toModel.title = newValue;
                        });
                      },
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
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: (newValue) {
                        setState(() {
                          toModel.price = int.parse(newValue!);
                        });
                      },
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
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: (newValue) {
                        setState(() {
                          toModel.mobile = newValue;
                        });
                      },
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
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      onSaved: (newValue) {
                        setState(() {
                          toModel.description = newValue;
                        });
                      },
                      maxLines: 3,
                      style: const TextStyle(fontSize: 20.0),
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
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
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
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
                        setLoadingTrue();
                        AdsService service = AdsService();
                        _formKey.currentState?.save();
                        await service
                            .createAd(context, toModel)
                            .then((value) => setLoadingFalse());
                      },
                      child: const Text(
                        'Submit Ad',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                  child: const Center(
                    child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Color(0xFFf25723),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
