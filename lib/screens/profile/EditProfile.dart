import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/editprofile';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => EditProfile(),
    );
  }

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ImagePicker _imagepicker = ImagePicker();
  File? _image;

  bool isObscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      _imagepicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = _image as File;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image!.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("image" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(_image!);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
        setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Profile Picture Uploaded')));
        });
      });
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Builder(
            builder: (context) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image == null)
                                  ? Image.network(
                                      "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      _image!,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  buildTextField("Full name", "Anbesha", false),
                  buildTextField("Email", "anbeshathapa@gmail.com", false),
                  buildTextField("Password", "******", true),
                  buildTextField("Location", "Kathmandu", false),
                  buildTextField("Birthday", "21st March,2020", false)
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: TextField(
          obscureText: isPasswordTextField ? isObscurePassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ))
                  : null,
              contentPadding: EdgeInsets.only(bottom: 5),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )),
        ),
      ),
    );
  }
}
