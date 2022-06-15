import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/user_model.dart';
import 'package:ecommerceapp/screens/profile/EditProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../blocs/profile/profile_bloc.dart';
import '../../blocs/profile/profile_state.dart';
import '../../models/menu_item.dart';
import '../authentication/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProfileScreen(),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel usermodel;
  File? pickedImage;
  User? currentUser;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
  //       value: item,
  //       child: Row(
  //         children: [
  //           Icon(
  //             item.icon,
  //             color: Colors.black,
  //             size: 20,
  //           ),
  //           const SizedBox(width: 12),
  //           Text(item.text),
  //         ],
  //       ),
  //     );
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    currentUser = FirebaseAuth.instance.currentUser;
    return BlocProvider(
      create: (context) => ProfileBloc(
        user: currentUser,
        isCurrentUser: true,
      ),
      child: Scaffold(
        // actions: [
        //   PopupMenuButton<MenuItem>(
        //       onSelected: (item) => onSelected(context, item),
        //       itemBuilder: (context) => [
        //             ...MenuItems.itemsFirst.map(buildItem).toList(),
        //             const PopupMenuDivider(),
        //             ...MenuItems.itemsSecond.map(buildItem).toList(),
        //           ])
        // ],

        backgroundColor: const Color(0xffdee2fe),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                        height: 120,
                        width: 120,
                        margin: const EdgeInsets.only(
                          top: 100,
                          bottom: 8,
                        ),
                        child: ClipOval(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 170,
                                  height: 170,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg',
                                  width: 170,
                                  height: 170,
                                  fit: BoxFit.cover,
                                ),
                        )),
                    const Text(
                      "Anbesha",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      currentUser?.email ?? '',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, left: 24, right: 24, bottom: 80),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "PROFILE",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFF616161),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()));
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.grey.shade700,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey.shade700,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Shopping address',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.grey.shade700,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Wishlist',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  color: Colors.grey.shade700,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Order History',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.grey.shade700,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Notification',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   void onSelected(BuildContext context, MenuItem item) {
//     switch (item) {
//       case MenuItems.itemLogout:
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//           (route) => false,
//         );
//     }
//   }
// }
//
// class MenuItems {
//   static const List<MenuItem> itemsFirst = [
//     itemSettings,
//     itemShare,
//   ];
//   static const List<MenuItem> itemsSecond = [
//     itemLogout,
//   ];
//   static const itemSettings = MenuItem(text: 'Settings', icon: Icons.settings);
//   static const itemShare = MenuItem(text: 'Share', icon: Icons.share);
//   static const itemLogout = MenuItem(text: 'Logout', icon: Icons.logout);
}
