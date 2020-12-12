import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
//  DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String imagePath = data['imagePath'];
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Picture",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.account_circle),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ),
    );
  }
}