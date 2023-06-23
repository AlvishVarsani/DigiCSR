import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/drawer.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/notificatio_services.dart';

Widget GivePage(List<Widget> pagelist){
  return pagelist[index];
}

class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NGOnotifications = notifyNGO();
    print(unread_notification);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
    // TODO: implement build
    ScaffoldState scaffoldState = ScaffoldState();
    
    return Container(
      color: white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: white,
          endDrawer: DrawerScreen(),
          // drawer: DrawerScreen(),
          drawerDragStartBehavior: DragStartBehavior.down,
          appBar: CustomAppBar(),
          body: GivePage((user == 'NGO')?ngonav:companynav),
          bottomNavigationBar: CustomBottomNavBar(companynav,setState),
        ),
      ),
    );
  }
}