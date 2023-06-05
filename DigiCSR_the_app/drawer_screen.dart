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
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Alvish varsani"), accountEmail: Text("alvishvarsani@gmail.com"),
            currentAccountPicture: CircleAvatar( 
              backgroundColor: Colors.white,
              
               child: Image.asset("assets/images/ngologo.png",width: 60,)

            ,),),

            ListTile(
              leading: Icon(Icons.person),
              title: Text(" Edit Profile"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text(" Edit Profile"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text(" Edit Profile"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text(" Edit Profile"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text(" Edit Profile"),
              onTap: () {
                
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text(" Edit Profile"),
              onTap: () {
                
              },
            )
          ],
        ),
        );
      
  }
}