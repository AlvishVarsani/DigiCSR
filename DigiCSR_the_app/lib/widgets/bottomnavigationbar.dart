import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomBottomNavBar extends StatelessWidget{
  List<Widget> pages;
  CustomBottomNavBar(this.pages);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        elevation: 20,
        selectedItemColor: primary,
        unselectedItemColor: secondary,
        unselectedLabelStyle: TextStyle(color: secondary),
        selectedLabelStyle: TextStyle(color: primary),
        iconSize: 25,
        backgroundColor: black,
        onTap: (value)=>{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[value])),
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