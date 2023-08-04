import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/MediaPosts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadHomeScreen();
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
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) => 
        Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
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
            
            
            Column(
              children: [
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
              width: MediaQuery.of(context).size.width*0.94,
            
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: primary,width: 0.6),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: 
              (posts!.length != 0)?
              LayoutBuilder(
                builder: (context, constraints) => 
                FutureBuilder(
                    future: Future(() => posts),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (content) => MediaPosts()));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        side: BorderSide(color: black,width: 0.5)),
                                      // elevation: 16,
                                      // color: Color(0x60FF5733),
                                      shadowColor: Colors.transparent,
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        // color: Color(0xFFFF5733),
                                        width: constraints.maxWidth*0.94,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                                              width: constraints.maxWidth*0.94,
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
                                  ),
                                );
                              }),
                        );
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
              ):
                  Center(child: Text('No Blogs Found!',style: TextStyle(color: Colors.black45,fontSize: 20),)),
            ),
              ],
            ),
            
            SizedBox(
              height: 30,
            ),
            // Text('Charts'),
            Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height * 0.36,
                child: 
                (charts.length != 0)?
                FutureBuilder(
                  future: Future(() => charts),
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
                ):
                  Center(child: Text('No Charts Found!',style: TextStyle(color: Colors.black45,fontSize: 20),)),

                ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: 
                (sectorschart.length != 0)?
                FutureBuilder(
                  future: Future(() => sectorschart),
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
                                    value: double.parse(
                                        (snapshot.data![index].totalamount)
                                            .toString()),
                                    showTitle: false,
                                    title: snapshot.data![index].id))),
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
                ):
                  Center(child: Text('No Data Found!',style: TextStyle(color: Colors.black45,fontSize: 20),)),

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
                      child: FutureBuilder(
                          future: couroseldata,
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
          ])),
        ),
      ),
    );
  }
}
