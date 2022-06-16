// ignore_for_file: deprecated_member_use, avoid_print, file_names

import 'dart:convert';

import 'package:ecommerceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;

import '../../blocs/profile/profile_bloc.dart';

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
  void getData() async {
    String name = "";
    String email = "";
    final user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("UserModel")
        .doc(user?.uid)
        .get();
    setState(() {
      name = vari.data()!['name'];
      email = vari.data()!['email'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  final _auth = FirebaseAuth.instance;

  late UserModel userModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final RegExp emailRegExpression = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  FirebaseStorage storage = FirebaseStorage.instance;
  File? file;
  File? _photo;
  String imageName = "";
  final ImagePicker _picker = ImagePicker();
  var descriptionController = new TextEditingController();
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = "UserModel";
  bool _isLoading = false;

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
    var uniqueKey = firestoreRef.collection(collectionName);
    String uploadFileName =
        DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
    Reference reference =
        storageRef.ref().child(collectionName).child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(_photo!.path));
    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          "\t" +
          event.totalBytes.toString());
    });
    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if (uploadPath.isNotEmpty) {
        firestoreRef.collection(collectionName).doc(uniqueKey.id).set({
          "desciption": descriptionController.text,
          "image": uploadPath
        }).then((value) => _showMessage("Record Inserted"));
      } else {
        _showMessage("Something went wrog");
      }
    });
  }

  _showMessage(String msg) {
    ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
    ));
  }

  static Future<UserModel> getUserProfile() async {
    UserModel model = UserModel();

    var currentUID = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection('UserModel')
        .doc('$currentUID')
        .get();
    if (data.exists) {
      return model;
    } else if (data.data()?.length == 1) {
      return model;
    }
    model = model.toJson() as UserModel;
    return model;
  }

  late String userUid;
  void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser!.uid;
  }

  // @override
  // void initState() {
  //   fetchUsers();
  //   super.initState();
  // }
  //
  // List<UserModel> totalUsers = [];
  // List
  // Future<http.Response> fetchUsers() {
  //   return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  // }

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
            padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
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
                SizedBox(
                  height: 60,
                ),
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
                        Navigator.of(context).pop();
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

late String studentName, studentID, studyProgramID;
late double studentGPA;
getStudentName(name) {
  studentName = name;
}

getStudentID(id) {
  studentID = id;
}

getStudyProgramID(programID) {
  studyProgramID = programID;
}

getStudentGPA(gpa) {
  studentGPA = double.parse(gpa);
}

createData() {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
  Map<String, dynamic> students = {
    "studentName": studentName,
    "studentID": studentID,
    "studyProgramID": studyProgramID,
    "studentGPA": studentGPA
  };
  documentReference.set(students).whenComplete(() {
    print("$studentName created");
  });
}

readData() {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("My Students").doc(studentName);
  Map<String, dynamic> students = {
    "studentName": studentName,
    "studentID": studentID,
    "studyProgramID": studyProgramID,
    "studentGPA": studentGPA
  };
  documentReference.get().then((students) {
    print("$studentName read");
  });
}

updateData() {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
  Map<String, dynamic> students = {
    "studentName": studentName,
    "studentID": studentID,
    "studyProgramID": studyProgramID,
    "studentGPA": studentGPA
  };
  documentReference.set(students).whenComplete(() {
    print("$studentName updated");
  });
}

deleteData() {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
  documentReference.delete().whenComplete(() {
    print("$studentName deleted");
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("My Flutter College"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (String name) {
                getStudentName(name);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Student ID",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (String id) {
                getStudentID(id);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Study Program ID",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (String programID) {
                getStudyProgramID(programID);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "GPA",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (String gpa) {
                getStudentGPA(gpa);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text("Create"),
                textColor: Colors.white,
                onPressed: () {
                  createData();
                },
              ),
              RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text("Read"),
                textColor: Colors.white,
                onPressed: () {
                  readData();
                },
              ),
              RaisedButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text("Update"),
                textColor: Colors.white,
                onPressed: () {
                  updateData();
                },
              ),
              RaisedButton(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text("Delete"),
                textColor: Colors.white,
                onPressed: () {
                  deleteData();
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.ltr,
              children: const <Widget>[
                Expanded(
                  child: Text("Name"),
                ),
                Expanded(
                  child: Text("Student ID"),
                ),
                Expanded(
                  child: Text("Program ID"),
                ),
                Expanded(
                  child: Text(" GPA"),
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("MyStudents")
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(documentSnapshot["studentName"]),
                          ),
                          Expanded(
                            child: Text(documentSnapshot["studentID"]),
                          ),
                          Expanded(
                            child: Text(documentSnapshot["studyProgramID"]),
                          ),
                          Expanded(
                            child:
                                Text(documentSnapshot["studentGPA"].toString()),
                          )
                        ],
                      );
                    });
              })
        ],
      ),
    ),
  );
}
