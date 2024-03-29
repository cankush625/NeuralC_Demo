import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:neuralc/Camera/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:neuralc/Camera/display_image.dart';
import 'package:neuralc/Home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "camera": (context) => CameraScreen(),
        "show_image": (context) => DisplayPictureScreen(),
      },
    );
  }
}