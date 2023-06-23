import 'package:digicsr/screens/Homescreen/homescreen.dart';
import 'package:digicsr/screens/Homescreen/mainscreen.dart';
import 'package:digicsr/screens/Homescreen/notification.dart';
import 'package:digicsr/screens/company/CompanyProfile.dart';
import 'package:digicsr/screens/company/company_profile.dart';
import 'package:digicsr/screens/company/rfp.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
        side: BorderSide(style: BorderStyle.solid,)
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Alvish varsani"),
            accountEmail: Text("alvishvarsani@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/ngologo.png",
                width: 60,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              index = 0;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            onTap: () {
              // index = 2;
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => MainScreen()));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreenForCompany()));
            },
          ),
          ListTile(
            leading: Icon(Icons.heart_broken),
            title: Text("Save fundraisers"),
            onTap: () {
              index = 1;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text("Notifications"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Contact us"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () async {
              try {
                await storage.deleteAll();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login_Screen()));
              } on Exception catch (e) {
                print(e);
                () {
                  return AlertDialog(
                    title: Text(
                      'Error while logout!\nTry after sometime',
                      style: TextStyle(color: black, fontSize: 20),
                    ),
                  );
                };
              }
            },
          )
        ],
      ),
    );
  }
}
