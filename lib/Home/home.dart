import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:neuralc/Firebase/FirebaseStorage/firebase_storage_services.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final imagePicker = ImagePicker();
  var fsconnect = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.account_circle),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.indigoAccent[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'NeuralC',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigoAccent[700],
              ),
            ),
            ListTile(
              title: Text(
                'Features',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  height: screenSize.height * 0.276,
                  color: Colors.indigoAccent[700],
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 9, 12, 9),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'NeuralC',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenSize.height * 0.0301,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  "Understand your surrounding",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 200,
                color: Colors.red,
                child: FlatButton(
                  child: Text(
                    "Camera",
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'camera');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                color: Colors.red,
                child: FlatButton(
                  child: Text(
                    "Gallery",
                  ),
                  onPressed: () async {
                    final PickedFile pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
                    File image = File(pickedFile.path);
                    await storeImageInFirebaseStorage(image);
                    // todo: show the image using downloadUrl from firebase storage
                    Navigator.pushNamed(context, 'show_image', arguments: {"imagePath": pickedFile.path});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}