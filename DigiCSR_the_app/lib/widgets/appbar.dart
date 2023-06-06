import 'package:digicsr/screens/company/company_profile.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

PreferredSize CustomAppBar(context){
  return PreferredSize(
    child:
    AppBar(
        automaticallyImplyLeading: false,
        elevation: 20,
        backgroundColor: black,
        title: Text(
          'Home',
          style: TextStyle(
            color: secondary,
            fontFamily: 'Montserrat',
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton.icon(
              onPressed: () {},
              label: Text(
                'Notification',
                style: TextStyle(
                    color: secondary, fontFamily: 'Montserrat', fontSize: 17),
              ),
              icon: Icon(
                Icons.notifications,
                color: secondary,
              )),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreenForCompany()));
            },
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/app_icon/digicsr_app_icon.png'),
              backgroundColor: secondary,
              radius: 25,
            ),
          )
        ],
      ) 
  , preferredSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height*0.07));
}