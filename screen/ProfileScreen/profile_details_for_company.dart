import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class ProfileDetailsForCompany extends StatefulWidget {
  const ProfileDetailsForCompany({super.key});

  @override
  State<ProfileDetailsForCompany> createState() =>
      _ProfileDetailsForCompanyState();
}

class _ProfileDetailsForCompanyState extends State<ProfileDetailsForCompany> {
  bool isvisible1 = true;
  bool isvisible2 = true;
  bool isvisible3 = true;
  bool isvisible4 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 155, 199, 235),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: Center(
                          child: Text(
                        " Company Profile",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                    child: Card(
                        shadowColor: Colors.blue,
                        elevation: 10,
                        color: Colors.orangeAccent,
                        child: Column(
                          children: [
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 40),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/earth.png",
                                  ),
                                  radius:
                                      MediaQuery.of(context).size.height * .055,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Company Name",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "alvishvarsani@gmail.com",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(Icons.edit),
                            ]),
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width * .8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Company Summary:",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReadMoreText(
                                    "To change the CircleAvatar border size, first, create a border around CircleAvatar by wrapping it inside another CircleAvatar. Set the parent CircleAvatar radius to higher than the inner CircleAvatar.",
                                    trimLines: 2,
                                    textAlign: TextAlign.justify,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: "  read more",
                                    trimExpandedText: "  show less",
                                    lessStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                    moreStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                            // child: Text("To change the CircleAvatar border size, first, create a border around CircleAvatar by wrapping it inside another CircleAvatar. Set the parent CircleAvatar radius to higher than the inner CircleAvatar.",textAlign: TextAlign.justify,))
                          ],
                        )),
                  ),










                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 40),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 8,
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.blue[50],
                                    child: Image.asset(
                                   "assets/images/establishment.png",
                                    color: Colors.blue[700],
                                  ),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isvisible1 = !isvisible1;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down)),
                                  title: Text(
                                    "Company Information",
                                  ),
                                 
                                );
                              }),
                               Card(
                            shadowColor: Colors.black,
                            elevation: 5,
                            child: Visibility(
                              visible: isvisible1,
                              child: Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                            leading: Icon(
                                              Icons.mail,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                                "Email : alvishvarsani2003@gmail.com"));
                                      }),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                            leading: FaIcon(
                                              FontAwesomeIcons.locationDot,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                                "Gandhigram, Civil Aerodrome, Gujarat 360006"));
                                      }),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                            leading: FaIcon(
                                              FontAwesomeIcons.building,
                                              color: Colors.black,
                                            ),
                                            title:
                                                Text("Establistment : 2000"));
                                      }),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                            leading: FaIcon(
                                              FontAwesomeIcons.fileCode,
                                              color: Colors.black,
                                            ),
                                            title: Text("Tax : 80 G"));
                                      }),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.blue[50],
                                    child: Icon(Icons.person),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isvisible2 = !isvisible2;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down)),
                                  title: Text(
                                    "Communication Person",
                                  ),
                                  
                                );
                              }),
                              Visibility(
                            visible: isvisible2,
                            child: Card(
                              shadowColor: Colors.black,
                              elevation: 5,
                              child: Visibility(
                                visible: isvisible2,
                                child: Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                              leading: Icon(
                                                Icons.person,
                                                color: Colors.black,
                                              ),
                                              title: Text("Alvish Varsani"));
                                        }),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                              leading: Icon(
                                                Icons.email,
                                                color: Colors.black,
                                              ),
                                              title: Text(
                                                  "alvishvarsani2003@gmail"));
                                        }),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                              leading: FaIcon(
                                                FontAwesomeIcons.phone,
                                                color: Colors.black,
                                              ),
                                              title: Text("6356114742"));
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.blue[50],
                                    child: Icon(Icons.security),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isvisible3 = !isvisible3;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down)),
                                  title: Text(
                                    "Sector",
                                  ),
                                
                                );
                              }),
                       Visibility(
                            visible: isvisible3,
                            child: Card(
                              shadowColor: Colors.black,
                              elevation: 5,
                              child: Visibility(
                                  visible: isvisible3,
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("1) Rural Development"),
                                      SizedBox(height: 3,),
                                      Text("2) Encouraging Sports"),
                                       SizedBox(height: 3,),
                                      Text("3) Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
                                       SizedBox(height: 3,),
                                      Text("4) Sport Development"),
                                         SizedBox(height: 3,),
                                      Text("5) Environment, Animal Welfare, Conservation of Resources"),
                                    ],
                                  ),

                              )
                            ),
                          ),
                          ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.blue[50],
                                    child: FaIcon(FontAwesomeIcons.pager)
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isvisible4 = !isvisible4;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down)),
                                  title: Text(
                                    "Company Certificate",
                                  ),
                                 
                                ),
                                Card(
                             child: Visibility(
                              visible: isvisible4,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 20,
                                child: Visibility(
                                    visible: isvisible4,
                                    child: Container(child: Image.asset("assets/images/certificate.png"))),
                              ),
                                                     ),
                           ),

                              
                        ],
                      ),

                     
                    ),
                  ),
                  Text(
                    "   More",
                    style: TextStyle(fontSize: 20),
                  ),
                   Padding(
                     padding:  EdgeInsets.all(MediaQuery.of(context).size.width / 40),
                     child: Card(
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 8,
                     
                       child: 
                       Column(children: [
                         ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.blue[50],
                                        child: FaIcon(FontAwesomeIcons.bell)
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              // isvisible4 = !isvisible4;
                                            });
                                          },
                                          icon: Icon(Icons.keyboard_arrow_down)),
                                      title: Text(
                                        'Help & Support',
                                      ),
                                     
                                    ),
                                    ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.blue[50],
                                      child: FaIcon(FontAwesomeIcons.bell)
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            // isvisible4 = !isvisible4;
                                          });
                                        },
                                        icon: Icon(Icons.keyboard_arrow_down)),
                                    title: Text(
                                      'About App',
                                    ),
                                   
                                  ),
                   
                       ],)
                      
                     ),
                   ),
                                 
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
