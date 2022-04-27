// import 'dart:async';
// mixin Validators {
//   var emailValidator =
//   StreamTransformer<String, String>.fromHandlers(
//       handleData: (email, sink) {
//         if (email.isEmpty) {
//           return sink.addError("This field cant be empty");
//         }
//         if (email.length > 32) {
//           return sink.addError("Email cant be more than 32 characters");
//         }
//         if (email.length < 6) {
//           return sink.addError("Email cant be less than 6 characters");
//         }
//         if (! RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//             .hasMatch(email)) {
//           return sink.addError("Please enter a a valid email");
//         } else {
//           sink.add(email);
//         }
//       }
//   );
//   var loginPasswordValidator =
//   StreamTransformer<String, String>.fromHandlers(
//       handleData: (password, sink) {
//         if (password.isEmpty) {
//           return sink.addError("This field cant be empty");
//         }
//
//         if (password.length < 8) {
//           return sink.addError("Password cant be less than 8 characters");
//         } else {
//           sink.add(password);
//         }
//       }
//   );
//   var nameValidator =
//   StreamTransformer<String, String>.fromHandlers(
//       handleData: (name, sink) {
//         if (name.isEmpty) {
//           return sink.addError("This field cant be empty");
//         }
//         if (name.length > 32) {
//           return sink.addError("Name cant be more than 32 characters");
//         }
//         if (name.length < 3) {
//           return sink.addError("Name cant be less than 6 characters");
//         }
//         if (! RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
//             .hasMatch(name)) {
//           return sink.addError("Please enter a a valid name");
//         } else {
//           sink.add(name);
//         }
//       }
//   );
//   var phoneValidator =
//   StreamTransformer<String, String>.fromHandlers(
//       handleData: (phone, sink) {
//         if (phone.isEmpty) {
//           return sink.addError("This field cant be empty");
//         }
//         if (phone.length > 10) {
//           return sink.addError("Phone cant be more than 32 characters");
//         }
//         if (phone.length < 6) {
//           return sink.addError("Phone cant be less than 6 characters");
//         }
//         if (! RegExp(r"^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}$")
//             .hasMatch(phone)) {
//           return sink.addError("Please enter a a valid phone");
//         } else {
//           sink.add(phone);
//         }
//       }
//   );
//   var passwordValidator =
//   StreamTransformer<String, String>.fromHandlers(
//       handleData: (pass, sink) {
//         if (pass.isEmpty) {
//           return sink.addError("This field cant be empty");
//         }
//         if (pass.length > 32) {
//           return sink.addError("Password cant be more than 32 characters");
//         }
//         if (pass.length < 8) {
//           return sink.addError("Password cant be less than 6 characters");
//         }
//         if (! RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
//             .hasMatch(pass)) {
//           return sink.addError("Please enter a a valid password");
//         } else {
//           sink.add(pass);
//         }
//       }
//   );
// }
