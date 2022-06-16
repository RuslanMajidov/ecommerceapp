// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'profile_event.dart';
// import 'profile_state.dart';
//
// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBloc({required bool currentUser})
//       : super(ProfileState(
//           avatarPath: avatarPath,
//         ));
//
//   @override
//   Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
//     if (event is uploadFile) {
//       // show action sheet
//     } else if (event is imageFromCamera) {
//       yield state.copyWith(
//           avatarPath: null, userModel: null, textFormField: '');
//     } else if (event is TextFormField) {
//       yield state.copyWith(userModel: null, avatarPath: null);
//     } else if (event is SaveProfileChanges) {
//       // handle save changes
//     }
//   }
// }
