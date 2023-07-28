import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/drawer.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/gestures.dart';
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
  void initState() {
    super.initState();
    print(unread_notification);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
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
          body: GivePage((user == 'NGO')?ngonav:(user == 'Company')?companynav:benificiarynav),
          bottomNavigationBar: CustomBottomNavBar(companynav,setState),
        ),
      ),
    );
  }
}