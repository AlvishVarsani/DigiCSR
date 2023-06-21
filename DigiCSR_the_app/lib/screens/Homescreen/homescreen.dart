import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:readmore/readmore.dart';

import 'package:velocity_x/velocity_x.dart';

import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const sliderlist = [
    "assets/images/quotes1.jpg",
    "assets/images/quotes2.jpg",
    "assets/images/quotes3.jpg",
    "assets/images/quotes4.jpg"
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _favIconColor = Colors.grey;
  String content =
      "In Flutter, if you are wondering is there any way to work with English words or where to find any library that works with English words the search ends here. There is a library named english_words that contains at most 5000 used English words with some utility functions. It’s useful in applications like dictionaries or teaching-related apps. In this article, we will be learning about it and seeing its usage. In the future, the author of this package might add more functionalities to it";

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 10,
        ),
        VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 150,
            enlargeCenterPage: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Image.asset(
                HomeScreen.sliderlist[index],
                fit: BoxFit.fill,
              )
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .margin(const EdgeInsets.symmetric(horizontal: 8))
                  .make();
            }),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  
                  children: [
                    Card(
                      shadowColor: blueglass,
                      elevation: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  "assets/images/earth.png",
                                  width: 60,
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Internauts Infotech",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Location",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ]),
                            
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "assets/images/ngorelated1.jpg",
                                //  height: 150.0,
                                width: 280.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cleaning the beach...",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 280,
                              child: ReadMoreText(
                                content,
                                trimLines: 3,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  "assets/images/earth.png",
                                  width: 60,
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Internauts Infotech",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Location",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ]),
                            
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "assets/images/ngorelated1.jpg",
                                //  height: 150.0,
                                width: 280.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cleaning the beach...",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 280,
                              child: ReadMoreText(
                                content,
                                trimLines: 3,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  "assets/images/earth.png",
                                  width: 60,
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Internauts Infotech",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Location",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ]),
                            
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "assets/images/ngorelated1.jpg",
                                //  height: 150.0,
                                width: 280.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cleaning the beach...",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 280,
                              child: ReadMoreText(
                                content,
                                trimLines: 3,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  ]
                   
                      
                  
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(
                            255,
                            224,
                            128,
                            80,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            "Our Impact",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 247, 243, 243),
                    child: FaIcon(
                      FontAwesomeIcons.building,
                    ),
                  ),
                  title: Center(
                      child: Text(
                    "20802",
                    style: TextStyle(fontSize: 18),
                  )),
                  subtitle: Center(child: Text("Total no. of companies")),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 247, 243, 243),
                    child: Icon(Icons.currency_rupee)
                  ),
                  title: Center(
                      child: Text(
                    "255802",
                    style: TextStyle(fontSize: 18),
                  )),
                  subtitle: Center(child: Text("Total amount spent on CSR")),
                ),
                
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 247, 243, 243),
                    child: FaIcon(
                      FontAwesomeIcons.earthAsia,
                    ),
                  ),
                  title: Center(
                      child: Text(
                    "20802",
                    style: TextStyle(fontSize: 18),
                  )),
                  subtitle: Center(child: Text("States and UT's covered")),
                )
                ,ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 247, 243, 243),
                    child: FaIcon(
                      FontAwesomeIcons.building,
                    ),
                  ),
                  title: Center(
                      child: Text(
                    "20802",
                    style: TextStyle(fontSize: 18),
                  )),
                  subtitle: Center(child: Text("Total no. of CSR Projects")),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 247, 243, 243),
                    child: Icon(Icons.security)
                  ),
                  title: Center(
                      child: Text(
                    "20802",
                    style: TextStyle(fontSize: 18),
                  )),
                  subtitle: Center(child: Text("Devlopment Sectors")),
                )
              ],
            ),
          ),
        ), 
      ]));
    
  }
}
