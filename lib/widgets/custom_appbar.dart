import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child:  Text( title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
               icon: const Icon(Icons.favorite),
              onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {
              showSearch(
                  context: context, 
                  delegate: MySearchDelegate(),
              );
            },
          ),
        ],
      );
  }
  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults =[
    'Hand Bag',
    'Shoes',
    'Ornaments',
    'Goggles',
  ];


  @override
  Widget? buildLeading(BuildContext context)=> IconButton (
    icon:  const Icon(Icons.arrow_back),
    onPressed: () =>close(context, null),
  );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
        if(query.isEmpty){
          close(context, null);
        } else {
          query='';
        }
      },

      )];
  }

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(
          fontSize: 64, fontWeight: FontWeight.bold),
    )
  );

  @override
  Widget buildSuggestions(BuildContext context) {
   List<String> suggestions = searchResults.where((searchResult){
     final result = searchResult.toLowerCase();
     final input = query.toLowerCase();
     return result.contains(input);
   }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
        itemBuilder: (context, index) {
        final suggestion= suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query= suggestion;

            showResults(context);
          },
        );
        },
    );
  }
}