import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadDownload {
  uploadImage(String fileName) {
    late UploadTask uploadTask;
    Reference ref = FirebaseStorage.instance.ref().child('products');
    uploadImage(String fileName) {
      ref = ref.child("/" + fileName);
      uploadTask = ref.putFile(File(fileName));
      return uploadTask;
    }
  }

  downloadImage() {}
}
