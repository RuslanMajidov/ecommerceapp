import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? secondname;
  String? phone;

  UserModel(
      {this.uid, this.email, this.firstname, this.secondname, this.phone});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      secondname: map['secondname'],
      phone: map['phone'],
    );
  }

  UserModel.fromSnapshot(DataSnapshot dataSnapshot) {
    uid = dataSnapshot.key!;
    if (dataSnapshot.value != null) {
      Map<dynamic, dynamic> m = dataSnapshot.value! as Map;
      email = m['email'];
      firstname = m['firstname'];
      secondname = m['secondname'];
      phone = m['phone'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'secondname': secondname,
      'phone': phone,
    };
  }
}
