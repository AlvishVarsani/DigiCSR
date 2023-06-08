
import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class RFP extends StatefulWidget {
  @override
  State<RFP> createState() => _RFPState();
}

class _RFPState extends State<RFP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Requests',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Montserrat',
                              fontSize: 25)),
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(10, 20, 10, 20)),
                          alignment: Alignment.center,
                          // elevation: MaterialStatePropertyAll(20),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: black,
                                          width: 1.2,
                                          style: BorderStyle.solid)))))),
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Respnses',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Montserrat',
                              fontSize: 25)),
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(10, 20, 10, 20)),
                          alignment: Alignment.center,
                          // elevation: MaterialStatePropertyAll(20),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: black,
                                          width: 1.2,
                                          style: BorderStyle.solid)))))),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                // Scrollable(viewportBuilder: )
                Card(
                  elevation: 20,
                  margin: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: black, width: 1.2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: Text('Title: Children\'s Day'),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text('Amount: 800000')),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text('Timeline: 20 months'))
                        ]),
                  ),
                ),
                Card(
                  elevation: 20,
                  margin: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: black, width: 1.2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Text('Title: Children\'s Day'),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Amount: 800000')),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Timeline: 20 months'))
                    ]),
                  ),
                ),
                Card(
                  elevation: 20,
                  margin: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: black, width: 1.2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Text('Title: Children\'s Day'),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Amount: 800000')),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Timeline: 20 months'))
                    ]),
                  ),
                ),
                Card(
                  elevation: 20,
                  margin: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: black, width: 1.2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Text('Title: Children\'s Day'),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Amount: 800000')),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Timeline: 20 months'))
                    ]),
                  ),
                ),

                Card(
                  elevation: 20,
                  margin: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: black, width: 1.2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Text('Title: Environment Day'),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Amount: 500000')),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text('Timeline: 18 months'))
                    ]),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              // padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.08)),
              backgroundColor: MaterialStatePropertyAll(blue),
            ),
              onPressed: () {},
              child: Text(
                'Raise RFP',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18,color: black),
              ))
        ],
      )),
      bottomNavigationBar: CustomBottomNavBar(companynav),
    );
  }
}
