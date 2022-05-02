import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/authentication/login_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(180.0);

  get tagsList => ['Shoes', 'Hand-Bag', 'Ornaments', 'Goggles'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child:
                      Text('IF YOU CANT STOP THINKING\nABOUT IT..\nBUY IT 🛍️',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                ),
                ActionChip(
                    label: Text(""),
                    onPressed: () {
                      logout(context);
                    }),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.orange.withOpacity(1),
                                spreadRadius: 0.1,
                                blurRadius: 0.1,
                                offset: Offset(0, 1))
                          ]),
                      child: Icon(
                        Icons.logout,
                        color: Colors.orange,
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.redAccent, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.redAccent,
                            size: 17,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Search here...',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     tagsList
                //         .map((e) => Container(
                //               child: Text(e),
                //             ))
                //         .toList(),
                //   ],
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = ['Hand Bag', 'Shoes', 'Ornaments', 'Goggles'];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) => Center(
          child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        var product = suggestion;

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}
