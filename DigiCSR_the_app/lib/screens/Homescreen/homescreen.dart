import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CouroselData.dart';
import 'package:digicsr/screens/Homescreen/MediaPosts.dart';
import 'package:digicsr/services/courosel_services.dart';
import 'package:digicsr/services/media_services.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:readmore/readmore.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../models/Media.dart';
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

  late Future<List<Media>> posts;
  late Future<CouroselData> couroselData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    couroselData = getCouroselData();
    posts = getMediaPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MediaPosts()));
          }, 
          child: Row(
            children: [
              SizedBox(width: 20,),
              Text('Let\'s see the Blogs',style: TextStyle(fontSize: 22,color: black),),
              Expanded(child: Container()),
              Icon(Icons.arrow_forward_ios_sharp,color: primary,),
              SizedBox(width: 10,)
            ],
          ),
          style: ButtonStyle(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(style: BorderStyle.solid,color: primary,width: 0.6),
                borderRadius: BorderRadius.all(Radius.circular(8))
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
                        color: primary,
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
              Container(
                child: FutureBuilder<CouroselData>(
                    future: couroselData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 247, 243, 243),
                                child: FaIcon(
                                  FontAwesomeIcons.solidBuilding,
                                ),
                              ),
                              title: Center(
                                  child: Text(
                                "${snapshot.data!.totalcompanies}",
                                style: TextStyle(fontSize: 18),
                              )),
                              subtitle:
                                  Center(child: Text("Total no. of companies")),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 247, 243, 243),
                                child: FaIcon(FontAwesomeIcons.buildingNgo),
                              ),
                              title: Center(
                                  child: Text(
                                "${snapshot.data!.totalngos}",
                                style: TextStyle(fontSize: 18),
                              )),
                              subtitle: Center(child: Text("Total NGOs")),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 247, 243, 243),
                                  child: FaIcon(
                                    FontAwesomeIcons.pager,
                                  )),
                              title: Center(
                                  child: Text(
                                "${snapshot.data!.totalrfps}",
                                style: TextStyle(fontSize: 18),
                              )),
                              subtitle: Center(child: Text("Total RFPs")),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        throw Exception('Can not load the Courosel data!');
                      }
                      return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.15,
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: const CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ]));
  }
}
