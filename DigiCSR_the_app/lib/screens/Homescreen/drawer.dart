import 'package:digicsr/screens/company/company_profile.dart';
import 'package:digicsr/screens/company/rfp.dart';
import 'package:flutter/material.dart';

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
            UserAccountsDrawerHeader(accountName: Text("Alvish varsani"), accountEmail: Text("alvishvarsani@gmail.com"),
            currentAccountPicture: CircleAvatar( 
              backgroundColor: Colors.white,
              
               child: Image.asset("assets/images/ngologo.png",width: 60,)

            ,),),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Edit Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreenForCompany()));
                
              },
            ),
            ListTile(
              leading: Icon(Icons.heart_broken),
              title: Text("Save fundraisers"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RFP()));
              },
            ),
             ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text("Notifications"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.phone),
              title: Text("Contact us"),
              onTap: () {
                
              },
            ),
             
            
             ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () {
                
              },
            )
          ],
        ),
        );
      
  }
}