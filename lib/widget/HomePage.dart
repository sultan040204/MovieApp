import 'package:flutter/material.dart';
import 'package:text_field_test1/movie_list/movie_list_widget.dart';

import '../movie_list/favoriteList.dart';
import '../movie_list/homeList.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  int _selectedTap = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    gridViewHome(),
    MovieList(),
    FavoriteList(),
    Text('4'),

  ];

  void onSelectedTap(int index){
    if (_selectedTap == index) return;
   setState(() {
     _selectedTap = index;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: IconButton(
            icon: const Icon(Icons.search, size: 30.0),
            onPressed: (){},
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, size: 30.0),
              onPressed: (){},
            ),
          ],
        ),
      body: Center(
        child: _widgetOptions[_selectedTap],
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedTap,
        items: const [
          BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label: "home"),
          BottomNavigationBarItem(
              icon:  Icon(Icons.favorite),
              label: "favorite"),
          BottomNavigationBarItem(
              icon:  Icon(Icons.add_circle_outline),
              label: "add"),
          BottomNavigationBarItem(
             icon:  Icon(Icons.person),
              label: "profile")
        ],
        onTap: onSelectedTap,
      ),

    );
  }
}

