import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final AuthService auth;

  Provider({required Key key, required Widget child, required this.auth})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider);
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Stream<String> get onAuthStateChanged =>  _firebaseAuth.currentUser!.uid;

  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser!.uid);
  }

  Future getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}

class FirebaseUser {}
