// ignore_for_file: non_constant_identifier_names

import 'package:ecommerceapp/model/user_model.dart';
import 'package:ecommerceapp/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileState {
  final UserModel currentUser;

  final String uploadFile;
  final String TextFormField;

  String? get username => currentUser.uid;
  String? get email => currentUser.email;
  String? get uid => currentUser.uid;

  ProfileState(
    this.uploadFile,
    this.currentUser,
    this.TextFormField, {
    required avatarPath,
  });

  copyWith(
      {required UserModel userModel,
      required avatarPath,
      required String textFormField}) {
    return ProfileState(
      uploadFile,
      currentUser,
      TextFormField,
      avatarPath: avatarPath,
    );
  }
}
