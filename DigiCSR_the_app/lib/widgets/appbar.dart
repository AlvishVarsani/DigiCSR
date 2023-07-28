import 'package:digicsr/screens/Homescreen/notification.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  // final ScaffoldState scaffoldState;

  CustomAppBar();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 8,
        backgroundColor: white,
        title: Text(
          appbartitle,
          style: TextStyle(
            color: black,
            fontFamily: 'Gotham',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
              },
              child: (!unread_notification)
              ?
              Icon(
                Icons.notifications,
                color: black,
              )
              :
              Icon(
                Icons.notifications_active,
                color: black,
              )
              // Animated_Notification_Icon()
              ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
            ),
            onPressed: (){
              Scaffold.of(context).openEndDrawer();
              // drawer();
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerScreen()));
            },
            child: 
            (user == "Benificiary")?
            Icon(Icons.person,color: black,):
            CircleAvatar(
              backgroundImage:
                  (user == 'NGO')?NetworkImage('${ngodata.ngo_logo_path}'):NetworkImage('${companydata.cmp_logo_path}'),
              backgroundColor: Colors.transparent,
              radius: 20,
            ),
          )
        ],
      ); 
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
