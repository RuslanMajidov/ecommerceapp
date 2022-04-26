// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:path/path.dart';
//
// class EditProfile extends StatefulWidget {
//   static const String routeName = '/editprofile';
//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (context) => EditProfile(),
//     );
//   }
//
//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   ImagePicker _imagepicker = ImagePicker();
//   late File _image;
//   File? file;
//
//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? basename(file!.path) : 'No File Selected';
//     Future getImage() async {
//       // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//       var image = _imagepicker.pickImage(source: ImageSource.gallery);
//       setState(() {
//         _image = _image;
//         print('Image Path $_image');
//       });
//     }
//
//
//     Future uploadPic(BuildContext context) async {
//       String fileName = basename(_image.path);
//       FirebaseStorage storage = FirebaseStorage.instance;
//       Reference ref = storage.ref().child(fileName);
//       UploadTask uploadTask = ref.putFile(_image);
//       uploadTask.then((res) {
//         res.ref.getDownloadURL();
//         setState(() {
//           print("Profile Picture uploaded");
//           Scaffold.of(context).showSnackBar(
//               SnackBar(content: Text('Profile Picture Uploaded')));
//         });
//       });
//     }
//   // File _image;
//   // @override
//   // Future uploadPic(BuildContext context) async {}
//   // File? pickedImage;
//   // var imageMap;
//   // var imagePath;
//   // late PickedFile _image;
//   // Future<void> getImage({required ImageSource source}) async {
//   //   _image = (await ImagePicker().getImage(source: source)) as File;
//   //   if (_image != null) {
//   //     pickedImage = File(_image.path);
//   //   }
//   // }
//   //
//   // void _uploadImage({required File image}) async {
//   //   String filename = basename(_image.path);
//   //   FirebaseStorage storage = FirebaseStorage.instance;
//   //   Reference ref = storage.ref().child("image" + DateTime.now().toString());
//   //   UploadTask uploadTask = ref.putFile(_image);
//   //   uploadTask.then((res) {
//   //     res.ref.getDownloadURL();
//   //     setState(() {
//   //       print("Profile Picture uploaded");
//   //       Scaffold.of(context)
//   //           .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//   //     });
//   //   });
//   // }
//
//   void imagePickerOption() {
//     Get.bottomSheet(
//       SingleChildScrollView(
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             height: 250,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const Text(
//                         "Upload Image",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'Please upload a picture from camera or gallery',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pickImage(ImageSource.camera);
//                     },
//                     icon: const Icon(Icons.camera),
//                     label: const Text(
//                       "CAMERA",
//                     ),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pickImage(ImageSource.gallery);
//                     },
//                     icon: const Icon(Icons.image),
//                     label: const Text("GALLERY"),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(Icons.close),
//                     label: const Text(
//                       "CANCEL",
//                     ),
//                   ),
//                   RaisedButton(
//                     color: Colors.grey,
//                     onPressed: () {
//                       uploadPic(context);
//                     },
//                     elevation: 4.0,
//                     splashColor: Colors.blueGrey,
//                     child: Text(
//                       'Submit',
//                       style: TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                   )
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   }
//
//   pickImage(ImageSource imageType) async {
//     try {
//       final photo = await ImagePicker().pickImage(source: imageType);
//       if (photo == null) return;
//       final tempImage = File(photo.path);
//       setState(() {
//         pickedImage = tempImage;
//       });
//
//       Get.back();
//     } catch (error) {
//       debugPrint(error.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//      File pickedImage;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange.shade700,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Edit Profile',
//               style: TextStyle(fontSize: 22),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.indigo, width: 5),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(100),
//                       ),
//                     ),
//                     child: ClipOval(
//                         child: pickedImage != null
//                             ? Image.file(
//                                 pickedImage!,
//                                 width: 170,
//                                 height: 170,
//                                 fit: BoxFit.cover,
//                               )
//                             : Image.network(
//                                 'https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg',
//                                 width: 170,
//                                 height: 170,
//                                 fit: BoxFir,
//                               )),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 5,
//                     child: IconButton(
//              ressed: imagePickerOption,
//                       icon: const Icon(
//                         Icons.add_a_photo_outlined,
//                         color: Colors.blue,
//                         size: 30,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton.icon(
//                   onPressed: imagePickerOption,
//                   icon: const Icon(Icons.add_a_photo_sharp),
//                   label: const Text('UPLOAD IMAGE')),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildTextField("Full name", "Anbesha Thapa", false),
//             buildTextField("Email", "anbesha1@gmail.com", false),
//             buildTextField("Location", "Kathmandu,Nepal", false),
//             buildTextField("Birthday", "21st March,2020", false)
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 30),
//         child: TextField(
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.only(bottom: 5),
//               labelText: labelText,
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               hintStyle: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//               )),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/net/database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/provider.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/editprofile';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => EditProfile(),
    );
  }

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xffFDCF09),
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
            ProfileView()
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
    SizedBox(
      height: 10,
    );
  }
}

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
              future: Provider.of(context).auth.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return displayUserInformation(context, snapshot);
                } else {
                  return CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Name: ${user.displayName ?? ''}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '',
              // "Email: ${user.emai}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '',
              // "Birthday: ${DateFormat('MM/dd/yyyy').format(user.metadata.birthday)}",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
    return Text("${user.displayName}");
  }
}
