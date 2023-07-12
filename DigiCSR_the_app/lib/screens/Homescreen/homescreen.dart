import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CouroselData.dart';
import 'package:digicsr/screens/Homescreen/MediaPosts.dart';
import 'package:digicsr/services/charts_services.dart';
import 'package:digicsr/services/courosel_services.dart';
import 'package:digicsr/services/media_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../models/Charts.dart';
import '../../models/Media.dart';

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
  late Future<List<Chart>> charts;
  late Future<List<SectorsChart>> sectorschart;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    couroselData = getCouroselData();
    posts = getMediaPosts();
    (user == 'Company') ? (charts = getCharts()) : (charts = getNgoCharts());
    (user == 'Company') ? (sectorschart = getCompanySectorsChart()) : (sectorschart = getNgoSectorsChart());
  }

  var imgsrc;
  String postimage(String htmlcontent) {
    var document = parse(htmlcontent);
    var imgElement = document.querySelector('img');
    imgsrc = imgElement!.attributes['src'];
    print(imgsrc);
    return imgsrc;
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MediaPosts()));
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Let\'s see the Blogs',
                style: TextStyle(fontSize: 22, color: black),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: primary,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          style: ButtonStyle(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid, color: primary, width: 0.6),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: FutureBuilder(
            future: posts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (content) => MediaPosts()));
                          },
                          child: Card(
                            elevation: 16,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].author_name}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "${snapshot.data![index].createdDate!.substring(0, 10)}",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 180,
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(
                                        parent: BouncingScrollPhysics()),
                                    child: Html(
                                        data: snapshot.data![index].content),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
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
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: FutureBuilder(
            future: charts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BarChart(BarChartData(
                    // maxY: 100000000,
                    barGroups: List.generate(
                        snapshot.data!.length,
                        (index) => BarChartGroupData(
                                x: snapshot.data![index].id!,
                                barRods: [
                                  BarChartRodData(
                                      color: primary,
                                      toY: double.parse(snapshot
                                          .data![index].totalamount!
                                          .toString()))
                                ]))));
              } else if (snapshot.hasError) {
                print(snapshot.error);
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
            },
          )),
      SizedBox(
        height: 20,
      ),
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          child: FutureBuilder(
            future: sectorschart,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
      enabled: true,
    ),
                    sections: List.generate(
                      snapshot.data!.length, 
                      (index) => PieChartSectionData(
                        color: primary,
                        radius: 140,
                        // titlePositionPercentageOffset: 0.0,
                        value: double.parse((snapshot.data![index].totalamount).toString()),
                        showTitle: false,
                        title: snapshot.data![index].id
                      ))
                  ),
                  swapAnimationCurve: Curves.bounceOut,
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
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
            },
          )),
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
