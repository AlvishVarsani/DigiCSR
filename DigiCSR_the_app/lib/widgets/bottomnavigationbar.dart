import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomBottomNavBar extends StatefulWidget{
  List<Widget> pages;
  CustomBottomNavBar(this.pages);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

List<String> pagetitle = [
  'Home',
  'RFP',
  'Profile'
];

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    int index = 0;
    // TODO: implement build
    return BottomNavigationBar(
        elevation: 20,
        currentIndex: index,
        selectedItemColor: primary,
        unselectedItemColor: black,
        // unselectedLabelStyle: TextStyle(color: secondary),
        // selectedLabelStyle: TextStyle(color: primary),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 30,
        backgroundColor: white,
        onTap: (value)=>{
            index = value,
            appbartitle = pagetitle[value],
            Navigator.push(context, MaterialPageRoute(builder: (context)=>widget.pages[value])),
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: 'RFP'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      );
  }
}