// import 'package:ecommerceapp/screens/home/home_screen.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'bloc/register_bloc.dart';
// import 'login_screen.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool isVisible = true;
//   final TextEditingController _nametext = TextEditingController();
//   final TextEditingController _emailtext = TextEditingController();
//   final TextEditingController _phonenum = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   final TextEditingController _confirmpass = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<RegisterBloc>(context, listen: false);
//
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Container(
//           color: Color(0xffc2e0f9),
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Register",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 StreamBuilder<Object>(
//                     stream: bloc.name,
//                     builder: (context, snapshot) {
//                       return TextField(
//                         controller: _nametext,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           hintText: "Enter Name",
//                           labelText: "Name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         onChanged: (value) => bloc.changeName(value),
//                       );
//                     }),
//                 SizedBox(height: 30),
//                 StreamBuilder<Object>(
//                     stream: bloc.email,
//                     builder: (context, snapshot) {
//                       return TextField(
//                         controller: _emailtext,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           hintText: "Enter Email",
//                           labelText: "Email",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         onChanged: bloc.changeEmail,
//                       );
//                     }),
//                 SizedBox(height: 30),
//                 StreamBuilder<Object>(
//                     stream: bloc.phonenumber,
//                     builder: (context, snapshot) {
//                       return TextField(
//                         controller: _phonenum,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           hintText: "Enter Phone number",
//                           labelText: "phone number",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         onChanged: bloc.changePhonenumber,
//                       );
//                     }),
//                 SizedBox(height: 30),
//                 StreamBuilder<Object>(
//                     stream: bloc.password,
//                     builder: (context, snapshot) {
//                       return TextField(
//                         controller: _password,
//                         keyboardType: TextInputType.emailAddress,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           labelText: "password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         onChanged: bloc.changepassword,
//                       );
//                     }),
//                 SizedBox(height: 30),
//                 StreamBuilder<Object>(
//                     stream: bloc.confirmpassword,
//                     builder: (context, snapshot) {
//                       return TextField(
//                         controller: _confirmpass,
//                         keyboardType: TextInputType.emailAddress,
//                         obscureText: isVisible,
//                         decoration: InputDecoration(
//                           hintText: "Confirm Password",
//                           labelText: "confirm password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           suffixIcon: IconButton(
//                             icon: isVisible
//                                 ? const Icon(Icons.visibility_off)
//                                 : const Icon(Icons.visibility),
//                             onPressed: () {
//                               setState(() {
//                                 isVisible = !isVisible;
//                               });
//                             },
//                           ),
//                         ),
//                         onChanged: bloc.changeconfirmpassword,
//                       );
//                     }),
//                 SizedBox(height: 30),
//                 _buildButton(),
//                 SizedBox(height: 30),
//                 RichText(
//                   text: TextSpan(children: [
//                     TextSpan(
//                       text: "Already have an account?",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(
//                         text: "Login here",
//                         style: TextStyle(color: Colors.black),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.of(context)
//                                 .pushReplacement(MaterialPageRoute(
//                               builder: (context) => LoginScreen(),
//                             ));
//                           })
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButton() {
//     final bloc = Provider.of<RegisterBloc>(context, listen: false);
//
//     return StreamBuilder<Object>(
//         stream: bloc.isValid,
//         builder: (context, snapshot) {
//           return GestureDetector(
//             onTap: snapshot.hasError || !snapshot.hasData
//                 ? null
//                 : () {
//                     bloc.submit();
//                   },
//             child: Container(
//               height: 40,
//               width: 120,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: snapshot.hasError || !snapshot.hasData
//                     ? Colors.grey
//                     : Color(0xffff69b4),
//               ),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomeScreen()),
//                   );
//                 },
//                 child: Text(
//                   "Register",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 23,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/config/app_router.dart';
import 'package:ecommerceapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailNameEditingController = new TextEditingController();
  final passwordNameEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First NAme cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Email cant be less than 3 charaters");
        }
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Second name cannot be empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailNameEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Plase enter your email");
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordNameEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        if (!regex.hasMatch(value)) {
          return ("Password cant be less than 6 charaters");
        }
      },
      onSaved: (value) {
        passwordNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordNameEditingController.text) {
          return ("Password dont match");
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailNameEditingController.text,
              passwordNameEditingController.text);
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: Image.asset(
                        "asset/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    firstNameField,
                    SizedBox(
                      height: 20,
                    ),
                    secondNameField,
                    SizedBox(
                      height: 20,
                    ),
                    emailField,
                    SizedBox(
                      height: 20,
                    ),
                    passwordField,
                    SizedBox(
                      height: 20,
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height: 20,
                    ),
                    signUpButton,
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
