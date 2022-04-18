import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepo {
  FirebaseStorage storage = FirebaseStorage(
    storageBucket: "gs://flutter-ecommerce-66c4e.appspot.com",
  );

  AuthRepo _authRepo = locator.get<AuthRepo>();
  Future<String> uploadFile(File file) async {
    uploadFile() {
      var user = _authRepo.getUser();
      var storageRef = storage.ref().child("user/profile/${user.uid}");
      var uploadTask = storageRef.putFile(file);
      var completedTask = uploadTask.onComplete;
      String downloadUrl = completedTask.ref.getDowloadURL();
      return downloadUrl;
    }
  }
}
