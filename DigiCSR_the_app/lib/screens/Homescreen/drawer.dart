import 'package:digicsr/screens/Homescreen/homescreen.dart';
import 'package:digicsr/screens/Homescreen/notification.dart';
import 'package:digicsr/screens/company/company_details.dart';
import 'package:digicsr/screens/company/company_profile.dart';
import 'package:digicsr/screens/company/rfp.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyDetails()));
            },
          ),
          ListTile(
            leading: Icon(Icons.heart_broken),
            title: Text("Save fundraisers"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RFP()));
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
