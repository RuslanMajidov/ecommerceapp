import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../form_submission_status.dart';

class ProfileState {
  final User user;
  final bool isCurrentUser;
  final String avatarPath;
  final String userDescription;

  String get username => user.displayName ?? '';
  String get email => user.email ?? 'ssdd';

  final FormSubmissionStatus formStatus;

  ProfileState({
    @required User? user,
    @required bool? isCurrentUser,
    String? avatarPath,
    String? userDescription,
    this.formStatus = const InitialFormStatus(),
  })  : this.user = user!,
        this.isCurrentUser = isCurrentUser ?? false,
        this.avatarPath = avatarPath ?? '',
        this.userDescription = userDescription ?? '';

  ProfileState copyWith({
    User? user,
    String? avatarPath,
    String? userDescription,
    FormSubmissionStatus? formStatus,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isCurrentUser: this.isCurrentUser,
      avatarPath: avatarPath ?? this.avatarPath,
      userDescription: userDescription ?? this.userDescription,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
