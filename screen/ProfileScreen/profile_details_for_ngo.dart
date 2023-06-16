import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class ProfileDetailsForNGO extends StatefulWidget {
  const ProfileDetailsForNGO({super.key});

  @override
  State<ProfileDetailsForNGO> createState() => _ProfileDetailsForNGOState();
}

class _ProfileDetailsForNGOState extends State<ProfileDetailsForNGO> {
  bool isvisible5 = true;
  bool isvisible6 = true;
  bool isvisible7 = true;
  bool isvisible8 = true;

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
                        "NGO profile",
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
                                    "NGO Name",
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
                                    "NGO Summary:",
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
                                          isvisible5 = !isvisible5;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down)),
                                  title: Text(
                                    "NGO Information",
                                  ),
                                );
                              }),
                          Card(
                            shadowColor: Colors.black,
                            elevation: 5,
                            child: Visibility(
                              visible: isvisible5,
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
                                            leading: Icon(
                                              Icons.currency_rupee,
                                              color: Colors.black,
                                            ),
                                            title: Text("541208745120"));
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
                                          isvisible6 = !isvisible6;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down)),
                                  title: Text(
                                    "Board Member",
                                  ),
                                );
                              }),
                          Card(
                            shadowColor: Colors.black,
                            elevation: 5,
                            child: Visibility(
                              visible: isvisible6,
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
                                            leading: Text(
                                              "Gender :",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            title: Text("Male"));
                                      }),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                            leading: Text(
                                              "DIN :",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            title: Text("98562346874"));
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
                                        ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                            leading: FaIcon(
                                              FontAwesomeIcons.desktop,
                                              color: Colors.black,
                                            ),
                                            title: Text("Consumer protection"));
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
                                        child: Icon(Icons.security),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isvisible7 = !isvisible7;
                                            });
                                          },
                                          icon: Icon(Icons.keyboard_arrow_down)),
                                      title: Text(
                                        "Sector",
                                      ),

                                    );
                                  }),
                           Card(
                             shadowColor: Colors.black,
                             elevation: 5,
                             child: Visibility(
                                 visible: isvisible7,
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
                              ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.blue[50],
                                        child: FaIcon(FontAwesomeIcons.chartArea)
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isvisible8 = !isvisible8;
                                            });
                                          },
                                          icon: Icon(Icons.keyboard_arrow_down)),
                                      title: Text(
                                        "Area of Operation",
                                      ),

                                    ),
                                    Card(
                                      shadowColor: Colors.black,
                                      elevation: 20,
                                      child: Visibility(
                                          visible: isvisible8,
                                          child:  Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("1) Gujarat"),
                                     SizedBox(height: 5,),
                                     Text("2) Haryana"),
                                      SizedBox(height: 5,),
                                     Text("3) Himachal Pradesh"),
                                      SizedBox(height: 5,),
                                     Text("4) Jammu and Kashmir "),
                                        SizedBox(height: 5,),
                                     Text("5) Maharashtra"),
                                   ],
                                 ),),
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
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 40),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 8,
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.blue[50],
                                  child: FaIcon(FontAwesomeIcons.bell)),
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
                                  child: FaIcon(FontAwesomeIcons.bell)),
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
                          ],
                        )),
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
