import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadDownload {
  Reference ref = FirebaseStorage.instance.ref().child('products');
  late UploadTask uploadTask;
  UploadTask uploadImage(String fileName) {
    String cloudFileName = fileName.split("/").last;
    print(cloudFileName);
    ref = ref.child("/" + cloudFileName);
    uploadTask = ref.putFile(File(fileName));
    return uploadTask;
  }

  downloadImage() {}
}
