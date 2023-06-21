import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/drawer.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

Widget GivePage(List<Widget> pagelist){
  return pagelist[index];
}

class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScaffoldState scaffoldState = ScaffoldState();
    
    return Scaffold(
      backgroundColor: white,
      drawer: DrawerScreen(),
      appBar: CustomAppBar(context,scaffoldState.openDrawer),
      body: GivePage((user == 'NGO')?ngonav:companynav),
      bottomNavigationBar: CustomBottomNavBar(companynav,setState),
    );
  }
}