import 'package:ecommerceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateofbirthController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Edit Profile'),
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
                Divider(
                  height: 60,
                  color: Colors.blue,
                ),
                TextFormField(
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _genderController,
                  autofocus: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter your gender");
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Gender",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _dateofbirthController,
                  autofocus: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please enter your dob");
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Date of Birth",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: const Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
