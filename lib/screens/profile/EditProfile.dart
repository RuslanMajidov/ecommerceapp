import 'dart:convert';

import 'package:ecommerceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  static const String routeName = '/editprofile';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => EditProfile(),
    );
  }

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final user = FirebaseAuth.instance.currentUser;
  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  // getUserModel() async {
  //   var response =
  //       await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
  //   var jsonData = jsonDecode(response.body);
  //   List<User> users = [];
  //   for (var u in jsonData) {
  //     User user = UserModel() as User;
  //     users.add(user);
  //   }
  //   print(users.length);
  //   return users;
  // }
  late UserModel userModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _usernameController = TextEditingController()
    ..text = 'Anbesha';
  final TextEditingController _emailController = TextEditingController()
    ..text = 'anbeshathap@gmail.com';
  final TextEditingController _phonenumberController = TextEditingController()
    ..text = '9862329874';
  final RegExp emailRegExpression = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  FirebaseStorage storage = FirebaseStorage.instance;
  File? file;
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = storage.ref(destination).child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occur');
    }
  }

  static Future<UserModel> getUserProfile() async {
    UserModel model = UserModel();

    var currentUID = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc('${currentUID}')
        .get();
    if (data.exists) {
      return model;
    } else if (data.data()?.length == 1) {
      return model;
    }
    model = model.toMap() as UserModel;
    return model;
  }

  late String userUid;
  void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Edit Profile'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
            child: Column(
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: const Color(0xffFDCF09),
                      child: _photo != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                _photo!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                ),
                // ProfileView()
                // Divider(
                //   height: 60,
                //   color: Colors.blue,
                // ),
                // Expanded(child: ListView.builder(itemBuilder :(context,index){
                //   return ListTile(title: Text('name'),
                //   );
                // }))
                TextFormField(
                  obscureText: false,
                  controller: _usernameController,
                  autofocus: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter your username");
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: false,
                  controller: _emailController,
                  autofocus: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter your email");
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _phonenumberController,
                  autofocus: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter your phone number");
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                // Expanded(
                //   child: FutureBuilder(
                //     future: getDocId(),
                //     builder: (context, snapshot) {
                //       return ListView.builder(
                //           itemCount: docIDs.length,
                //           itemBuilder: (context, index) {
                //             return ListTile(
                //               title: GetUserName(documentId:docIDs[index]),
                //             );
                //           });
                //     },
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        // fnSaveProfile(
                        //   username: _usernameController,
                        //   email: _emailController,
                        //   phonenumber: _phonenumberController,
                        // );
                      },
                      child: const Text(
                        'Proceed',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // fnSaveProfile({
  //   required TextEditingController username,
  //   required TextEditingController email,
  //   required TextEditingController phonenumber,
  // }) {
  //   FirebaseFirestore.instance.collection('users').doc().set({
  //     'email': email,
  //     'username': username,
  //     'phonenumber': phonenumber,
  //   }).then((value) {
  //     scaffoldKey.currentState?.showSnackBar(SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text('Register $email profile completed')));
  //   }).catchError((error) {
  //     scaffoldKey.currentState?.showSnackBar(SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text('Register $email profile error')));
  //   });
  // }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
    const SizedBox(
      height: 10,
    );
  }
}
