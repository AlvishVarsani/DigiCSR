import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/company/rfpreqlist.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget{
  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      onPageChanged: (value) => {
        
      },
      controller: _pageController,
      // reverse: true,
      children: [
        RFPReqList(),
        Container(color: blue,),
      ],
    );
  }
}