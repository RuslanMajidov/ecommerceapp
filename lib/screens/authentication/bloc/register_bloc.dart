// import 'package:ecommerceapp/screens/authentication/bloc/validators.dart';
// import 'package:rxdart/rxdart.dart';
//
// class RegisterBloc with Validators {
//   final _name = BehaviorSubject<String>();
//   final _email = BehaviorSubject<String>();
//   final _phonenumber = BehaviorSubject<String>();
//   final _password = BehaviorSubject<String>();
//   final _confirmpassword = BehaviorSubject<String>();
//
//   //getters
//   Stream<String> get name => _name.stream.transform(nameValidator);
//   Stream<String> get email => _email.stream.transform(emailValidator);
//   Stream<String> get phonenumber =>
//       _phonenumber.stream.transform(phoneValidator);
//   Stream<String> get password => _password.stream.transform(passwordValidator);
//   Stream<String> get confirmpassword =>
//       _confirmpassword.stream.transform(passwordValidator);
//
//   Stream<bool> get isValid => Rx.combineLatest5(name, email, phonenumber,
//       password, confirmpassword, (name, email, phone, pass, confPass) => true);
//
//   Stream<bool> get isPasswordMatched =>
//       Rx.combineLatest2(password, confirmpassword, (a, b) {
//         if (a != b) {
//           return false;
//         } else {
//           return true;
//         }
//       });
//   //setters
//   Function(String) get changeName => _name.sink.add;
//   Function(String) get changeEmail => _email.sink.add;
//   Function(String) get changePhonenumber => _phonenumber.sink.add;
//   Function(String) get changepassword => _password.sink.add;
//   Function(String) get changeconfirmpassword => _confirmpassword.sink.add;
//
//   void submit() {
//     if (_password != confirmpassword) {
//       _confirmpassword.sink.addError("Password doesn't match");
//     } else {
//       print("Register");
//     }
//   }
//
//   void dispose() {
//     _name.close();
//     _email.close();
//     _phonenumber.close();
//     _password.close();
//     _confirmpassword.close();
//   }
// }
