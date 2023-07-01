import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/BoardMember.dart';
import 'package:digicsr/screens/Homescreen/HelpAndSupport.dart';
import 'package:digicsr/screens/company/CompanyDetails.dart';
import 'package:digicsr/screens/company/ContactPersonDetails.dart';
import 'package:digicsr/screens/login/login_screen.dart';
import 'package:digicsr/screens/ngo/BoardMembers.dart';
import 'package:digicsr/screens/ngo/NGODetails.dart';
import 'package:flutter/material.dart';

class NGOProfile extends StatefulWidget {
  @override
  State<NGOProfile> createState() => _NGOProfileState();
}

class _NGOProfileState extends State<NGOProfile> {
  // Company _company = Company();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getNgoDetails();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      child: Stack(
        children: [
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
            height: h ,
            width: w,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(style: BorderStyle.solid,color: Colors.transparent)
                      ),
                      elevation: 30,
                      child: Container(
                        height: h * 0.3,
                        width: w * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent,style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: w * 0.85,
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/yashu.jpg'),
                                  radius: 45,
                                ),
                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('${ngodata.ngo_name}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                ),
                                Text('${ngodata.summmary}',style: TextStyle(fontSize: 14),),
                              ],
                              ),
                            ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              onPressed: (){
                                // editmode = true;
                                // setState(() {});
                              },
                              icon: Icon(Icons.mode_edit_outline_outlined,color: primary,),
                              )
                            ),
                          ]
                        ),
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
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NgoDetails()));
                        }, 
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8))
                      ),
                      child: Row(
                          children: [
                            Text('NGO Details',style: TextStyle(fontSize: 24,color: black,fontWeight: FontWeight.w400),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,size: 20,color: primary,)
                          ],
                        ),
                      ),
                      Divider(
                    // color: black,
                    // indent: 8,
                    // endIndent: 8,
                  ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BoradMembers()));
                        }, 
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8))
                      ),
                      child: Row(
                          children: [
                            Text('Board Members',style: TextStyle(fontSize: 24,color: black,fontWeight: FontWeight.w400),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,size: 20,color: primary,)
                          ],
                        ),
                      ),
                      Divider(
                    // color: black,
                    // indent: 8,
                    // endIndent: 8,
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpScreen()));
                  }, 
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8))
                      ),
                      child: Row(
                          children: [
                            Text('Help & Support',style: TextStyle(fontSize: 24,color: black,fontWeight: FontWeight.w400),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,size: 20,color: primary,)
                          ],
                        ),
                      ),
                      Divider(
                    // color: black,
                    // indent: 8,
                    // endIndent: 8,
                  ),
                  TextButton(
                    onPressed: (){
                      storage.delete(key: 'ngo');
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                    }, 
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8))
                      ),
                      child: Row(
                          children: [
                            Text('Logout',style: TextStyle(fontSize: 24,color: black,fontWeight: FontWeight.w400),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,size: 20,color: primary,)
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
