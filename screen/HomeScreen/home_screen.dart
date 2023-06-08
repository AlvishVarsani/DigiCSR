
import 'package:digi_csr/screen/HomeScreen/drawer_screen.dart';


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:readmore/readmore.dart';

import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerScreen(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "DigiCSR",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
              shadowColor: Colors.black,
              elevation: 30,
              child: Column(
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
                  Container(
                    child: ReadMoreText(
                      content,
                      trimLines: 2,
                      textAlign: TextAlign.center,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "  read more",
                      trimExpandedText: "  show less",
                      lessStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      moreStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/ngorelated1.jpg",
                    width: 300,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Cleaning the beach...",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                    children: [
                    
                      IconButton(onPressed: (){
                      
                        // setState(() {
                             
                        // });
                      }, icon: Icon(Icons.thumb_up,color: Colors.blue,),),



                      
                       IconButton(onPressed: (){
                        setState(() {
                             
                        });
                      }, icon: Icon(Icons.comment)),
                       IconButton(onPressed: (){
                        setState(() {
                             
                        });
                      }, icon: Icon(Icons.report)),
                       IconButton(onPressed: (){
                        setState(() {
                             
                        });
                      }, icon: Icon(Icons.share)),
                       
                      
                      
             
             
                    
                    ],
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 360,
                  height: 450,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 150, 199, 239),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.blue,
                                child: Image.asset(
                                  "assets/images/ngopage.png",
                                  width: 40,
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "  Name Of NGO",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Story Title",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Sector",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "Data",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/images/ngorelated1.jpg",
                          width: 260,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Description...",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          child: Text(
                            "    NGOs (Non-Governmental Organizations) are vital agents of change, human rights. In this essay, we will explore the significance of NGOs and their impact on society.rth rth",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 360,
                  height: 450,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 150, 199, 239),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.blue,
                                child: Image.asset(
                                  "assets/images/ngopage.png",
                                  width: 40,
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "  Name Of NGO",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Story Title",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Sector",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "Data",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/images/ngorelated1.jpg",
                          width: 260,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Description...",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          child: Text(
                            "    NGOs (Non-Governmental Organizations) are vital agents of change, human rights. In this essay, we will explore the significance of NGOs and their impact on society.rth rth",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 360,
                  height: 450,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 150, 199, 239),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.blue,
                                child: Image.asset(
                                  "assets/images/ngopage.png",
                                  width: 40,
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "  Name Of NGO",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Story Title",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Sector",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "Data",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/images/ngorelated1.jpg",
                          width: 260,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Description...",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          child: Text(
                            "    NGOs (Non-Governmental Organizations) are vital agents of change, human rights. In this essay, we will explore the significance of NGOs and their impact on society.rth rth",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Our Impact",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 50,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Image.asset(
                                  "assets/images/bargraph.png",
                                  width: 80,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      " \n1+ Cr*",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                    Text(
                                      "Fastest fund raised",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                "--------------------------------------------------------------------------"),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/earth.png",
                                  width: 150,
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      " 30 Lakh+",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                    Text(
                                      "Donor community",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                "--------------------------------------------------------------------------"),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/population.png",
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "25,000+",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                    Text(
                                      "Patients Funded",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                "\n--------------------------------------------------------------------------"),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
