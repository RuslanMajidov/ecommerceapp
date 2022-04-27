// import 'dart:async';
// import 'package:ecommerceapp/screens/authentication/bloc/validators.dart';
// import 'package:rxdart/rxdart.dart';
//
// class LoginBloc with Validators {
//   final _loginEmail = BehaviorSubject<String>();
//   final _loginPassword = BehaviorSubject<String>();
//
//   Stream<String> get LoginEmail => _loginEmail.stream.transform(emailValidator);
//
//   Stream<String> get LoginPassword =>
//       _loginPassword.stream.transform(loginPasswordValidator);
//
//   Stream<bool> get isValid =>
//       Rx.combineLatest2(LoginEmail, LoginPassword, (loginEmail, pass) => true);
//
//   Function(String) get changeLoginEmail => _loginEmail.sink.add;
//
//   Function(String) get changeLoginPassword => _loginPassword.sink.add;
//
//   void submit() {
//     print("LoginEmail.value");
//     print("LoginPassword.value");
//   }
//
//   void dispose() {
//     _loginEmail.close();
//     _loginPassword.close();
//   }
// }
