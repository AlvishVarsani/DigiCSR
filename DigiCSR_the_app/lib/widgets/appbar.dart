import 'package:digicsr/screens/Homescreen/drawer.dart';
import 'package:digicsr/screens/Homescreen/notification.dart';
import 'package:digicsr/screens/company/company_profile.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

PreferredSize CustomAppBar(context){
  return PreferredSize(
    child:
    AppBar(
        automaticallyImplyLeading: false,
        elevation: 20,
        backgroundColor: white,
        title: Text(
          appbartitle,
          style: TextStyle(
            color: black,
            fontFamily: 'Montserrat',
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
              },
              label: Text(
                'Notification',
                style: TextStyle(
                    color: black, fontFamily: 'Montserrat', fontSize: 17),
              ),
              icon: Icon(
                Icons.notifications,
                color: black,
              )),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerScreen()));
            },
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/app_icon/digicsr_app_icon.png'),
              backgroundColor: secondary,
              radius: 20,
            ),
          )
        ],
      ) 
  , preferredSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height*0.07));
}