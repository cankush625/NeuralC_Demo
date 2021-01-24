import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

// ignore: missing_return
Future<void> storeImageInFirebaseStorage(File image) async {
  String downloadUrl;
  Reference ref = storage.ref().child("image" + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(image);
  uploadTask.whenComplete(() async {
    downloadUrl = ref.getDownloadURL().toString();
  }).catchError((onError) {
    print(onError);
  });
  print("Download URL " + downloadUrl.toString());
}