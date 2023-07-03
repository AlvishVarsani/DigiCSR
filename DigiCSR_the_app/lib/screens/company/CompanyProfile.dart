import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CompanyModel.dart';
import 'package:digicsr/screens/Homescreen/HelpAndSupport.dart';
import 'package:digicsr/screens/company/CompanyDetails.dart';
import 'package:digicsr/screens/company/ContactPersonDetails.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:digicsr/services/company_profile_services.dart';
import 'package:flutter/material.dart';

class CompanyProfile extends StatefulWidget {
  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  // Company _company = Company();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompanyDetails();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      child: Stack(children: [
        Column(
          children: [
            Container(
              height: h * 0.25,
              color: primary,
            ),
            Expanded(
                child: Container(
              color: white,
            ))
          ],
        ),
        Positioned(
          top: h * 0.05,
          child: Container(
            height: h,
            width: w,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.transparent)),
                      elevation: 30,
                      child: Container(
                        height: h * 0.3,
                        width: w * 0.85,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.transparent,
                                style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Stack(children: [
                          Container(
                            width: w * 0.85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future: getCmpLogo(),
                                  builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CircleAvatar(
                                      backgroundImage:
                                          NetworkImage('${snapshot.data}'),
                                      radius: 45,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }
                                  return Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 1,
                                      ),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    '${companydata.company_name}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '${companydata.summary}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                onPressed: () {
                                  // editmode = true;
                                  // setState(() {});
                                },
                                icon: Icon(
                                  Icons.mode_edit_outline_outlined,
                                  color: primary,
                                ),
                              )),
                        ]),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  width: w * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                          // color: black, DividerThemeData.color
                          // indent: 8,
                          // endIndent: 8,
                          ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompanyDetails(companydata)));
                        },
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8))),
                        child: Row(
                          children: [
                            Text(
                              'Company Details',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: primary,
                            )
                          ],
                        ),
                      ),
                      Divider(
                          // color: black,
                          // indent: 8,
                          // endIndent: 8,
                          ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ContactPersonDetails(companydata)));
                        },
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8))),
                        child: Row(
                          children: [
                            Text(
                              'Contact Person',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: primary,
                            )
                          ],
                        ),
                      ),
                      Divider(
                          // color: black,
                          // indent: 8,
                          // endIndent: 8,
                          ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpScreen()));
                        },
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8))),
                        child: Row(
                          children: [
                            Text(
                              'Help & Support',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: primary,
                            )
                          ],
                        ),
                      ),
                      Divider(
                          // color: black,
                          // indent: 8,
                          // endIndent: 8,
                          ),
                      TextButton(
                        onPressed: () {
                          storage.delete(key: 'ngo');
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Screen()));
                        },
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8))),
                        child: Row(
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: primary,
                            )
                          ],
                        ),
                      ),
                      Divider(
                          // color: black,
                          // indent: 8,
                          // endIndent: 8,
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
