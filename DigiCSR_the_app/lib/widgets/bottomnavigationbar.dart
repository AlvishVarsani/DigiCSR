

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomBottomNavBar extends StatefulWidget{
  List<Widget> pages;
  var MainScreenSetState;
  CustomBottomNavBar(this.pages,this.MainScreenSetState);

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
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
        iconSize: 25,
        backgroundColor: white,
        onTap: (value)=>{
          index = value,
            appbartitle = pagetitle[value],
            setState(() {}),
            widget.MainScreenSetState((){})
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