import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

Widget GivePage(List<Widget> pagelist){
  return pagelist[index];
}

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      appBar: CustomAppBar(context),
      body: GivePage(companynav),
      bottomNavigationBar: CustomBottomNavBar(companynav),
    );
  }
}