import 'package:digicsr/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../models/CompanyModel.dart';

class ContactPersonDetails extends StatelessWidget {
  Company _company;
  ContactPersonDetails(this._company);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Material(
      child: Container(
        color: primary,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Contact Person',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Gotham'),
                              ),
                            ],
                          ),
                        ))),
                Container(
                  width: w,
                  height: h * 0.88,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      border: Border.all(color: Colors.transparent)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(
                                  text: '${_company.cp_name}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(
                                  text: '${_company.cp_email}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile No.',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller:
                                  TextEditingController(text: '${_company.cp_phone}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Destination',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(text: '${_company.cp_designation}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
