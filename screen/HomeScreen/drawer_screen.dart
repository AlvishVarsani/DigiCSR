import 'package:digi_csr/screen/CompanyScreen/raise_rfp_request.dart';
import 'package:digi_csr/screen/ProfileScreen/profile_screen_for_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Get.to(()=>ProfileScreenForCompany());
                
              },
            ),
            ListTile(
              leading: Icon(Icons.heart_broken),
              title: Text("Save fundraisers"),
              onTap: () {
                Get.to(()=>RaiseRfpRequest());
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