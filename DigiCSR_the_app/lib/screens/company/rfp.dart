import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/company/raise_rfp.dart';
import 'package:digicsr/screens/company/rfpreqlist.dart';
import 'package:digicsr/models/RFPModel.dart';
import 'package:flutter/material.dart';

class RFP extends StatefulWidget {
  @override
  State<RFP> createState() => _RFPState();
}

class _RFPState extends State<RFP> {
  late Future<List<Rfp>> futureList;
  final PageController _pageController = PageController();
  // Rfp rfp = Rfp(title: 'Children\'s Day' , amount: 2000, sectors: ['Healthcare','education'], states: ['Gujarat','Delhi'], timeline: '20', company: 'reliance');

  @override
  void initState() {
    super.initState();
    // donationReq();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: CustomAppBar(context),
      body: SafeArea(
          child: Column(
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //         child: TextButton(
          //             onPressed: () {
          //               setState(() {
          //                 index = 1;
          //               });
          //             },
          //             child: Text('Requests',
          //                 style: TextStyle(
          //                   color: white,
          //                   fontFamily: 'Montserrat',
          //                   fontSize: 25,
          //                 )),
          //             style: ButtonStyle(
          //                 backgroundColor: MaterialStatePropertyAll(primary),
          //                 // padding: MaterialStatePropertyAll(
          //                 //     EdgeInsets.only(top: h*)),
          //                 alignment: Alignment.center,
          //                 minimumSize:
          //                     MaterialStatePropertyAll(Size(w * 0.5, h * 0.07)),
          //                 maximumSize: MaterialStatePropertyAll(
          //                     Size(w * 0.5, h * 0.095)),
          //                 // elevation: MaterialStatePropertyAll(20),
          //                 shape:
          //                     MaterialStatePropertyAll<RoundedRectangleBorder>(
          //                         RoundedRectangleBorder(
          //                             side: BorderSide(
          //                                 color: white,
          //                                 width: 1.2,
          //                                 style: BorderStyle.solid)))))),
          //   ],
          // ),
          Expanded(
            child: PageView(
              onPageChanged: (value) => {},
              controller: PageController(initialPage: index),
              // reverse: true,
              children: [
                RFPReqList(),
              ],
            ),
          ),
          TextButton(
              style: ButtonStyle(
                // padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                minimumSize: MaterialStatePropertyAll(Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.08)),
                backgroundColor: MaterialStatePropertyAll(primary),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RaiseRfpRequest()));
                // addRFP('yashuranparia136@gmail.com', rfpbody);
              },
              child: Text(
                'Raise RFP',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 18, color: black),
              ))
        ],
      )),
      // bottomNavigationBar: CustomBottomNavBar(companynav),
    );
  }
}
