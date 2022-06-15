import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? secondname;
  String? phone;
  String? imageUrl;

  UserModel(
      {this.uid,
      this.email,
      this.firstname,
      this.secondname,
      this.phone,
      this.imageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        email: json['email'],
        firstname: json['firstname'],
        secondname: json['secondname'],
        phone: json['phone'],
        imageUrl: json['imageUrl']);
  }

  UserModel.fromSnapshot(DataSnapshot dataSnapshot) {
    uid = dataSnapshot.key!;
    if (dataSnapshot.value != null) {
      Map<dynamic, dynamic> m = dataSnapshot.value! as Map;
      email = m['email'];
      firstname = m['firstname'];
      secondname = m['secondname'];
      phone = m['phone'];
      imageUrl = m['imageUrl'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'secondname': secondname,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
