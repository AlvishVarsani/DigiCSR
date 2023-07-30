import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/NgoModel.dart';

class NgoDetailsToOthers extends StatefulWidget {
  Ngo ngodetail;
  NgoDetailsToOthers(this.ngodetail);
  @override
  State<NgoDetailsToOthers> createState() => _NgoDetailsToOthersState();
}

class _NgoDetailsToOthersState extends State<NgoDetailsToOthers> {
  List<dynamic> selectedoptions = [];

  late Future<Ngo> singlengo;
  void loadngodetails() async {
    singlengo = getNgoDetailsForOthers(widget.ngodetail.id!);
    reviewngodata = getReview(widget.ngodetail.id!);
    print('Ngo Details Loaded');
  }

  bool isvisible = false;
  @override
  void initState() {
    super.initState();
    loadngodetails();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: h,
        width: w,
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
          SafeArea(
            child: Column(
              children: [
                // SizedBox(height: 10,),
                Container(
                    height: 60,
                    width: w,
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
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
                            'Back to Ngos',
                            style: TextStyle(
                                fontSize: 28,
                                color: white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Gotham'),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  child: Container(
                    width: w,
                    child: FutureBuilder(
                        future: singlengo,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              height: h,
                              width: w*0.96,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: SingleChildScrollView(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Card(
                                          margin: EdgeInsets.only(top: 20),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Stack(children: [
                                              Container(
                                                width: w * 0.85,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage: NetworkImage(
                                                          '${snapshot.data!.ngo_logo_path}'),
                                                      radius: 45,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        '${snapshot.data!.ngo_name}',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${snapshot.data!.summmary}',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                      width: w * 0.96,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.transparent)),
                                        elevation: 0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ExpansionTile(
                                              expandedCrossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              title: Text(
                                                "Ngo Summery",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              children: [
                                                Text(
                                                  '${snapshot.data!.summmary}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )
                                              ],
                                            ),

                                            Divider(),
                                            ListTile(
                                                title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Name",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.ngo_name}",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
                                            ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    'Establistment Year',
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.establishment_year}",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            ListTile(
                                                title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Phone no.",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.phone}",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
                                            ListTile(
                                                title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Location",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.city},${snapshot.data!.state},${snapshot.data!.pincode}",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
                                            ListTile(
                                                title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Email",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.email}",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
                                            ListTile(
                                                title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Areas of Operation",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Container(
                                                    // height: h * 0.5,
                                                    child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: snapshot
                                                            .data!
                                                            .operation_areas!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${snapshot.data!.operation_areas![index]}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                  ],
                                                                )),
                                                  )
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
                                            ListTile(
                                                title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Sectors",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Container(
                                                    // height: h * 0.5,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: snapshot
                                                            .data!
                                                            .sectors!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${snapshot.data!.sectors![index]}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                  ],
                                                                )),
                                                  )
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
                                            ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Board Members",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                      width: w * 0.90,
                                                      height: 110,
                                                      child: ListView.builder(
                                                        // shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: snapshot
                                                            .data!
                                                            .boardmemberslist!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Card(
                                                          child: Container(
                                                            height: 90,
                                                            width: 100,
                                                            child: Column(
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 25,
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Container(
                                                                  width: 80,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      new Text(
                                                                    '${snapshot.data!.boardmemberslist![index].bm_name}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        new TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: new Color(
                                                                          0xFF212121),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            ExpansionTile(
                                                expandedCrossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                title: Text(
                                                  "Reviews",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                children: [
                                                  Container(
                                                    height: h * 0.6,
                                                    child: LayoutBuilder(
                                                      builder: (context,
                                                              constraints) =>
                                                          FutureBuilder(
                                                              future:
                                                                  reviewngodata,
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                    .hasData) {
                                                                  return ListView
                                                                      .builder(
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: snapshot
                                                                              .data!
                                                                              .length,
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            return Card(
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                                                              elevation: 8,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(10.0),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    (snapshot.data![index].companyid != null)
                                                                                        ? Text(
                                                                                            'By Company',
                                                                                            style: TextStyle(fontSize: 18),
                                                                                          )
                                                                                        : Text(
                                                                                            'By Benificiary',
                                                                                            style: TextStyle(fontSize: 18),
                                                                                          ),
                                                                                    SizedBox(
                                                                                      height: 8,
                                                                                    ),
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Ratings',
                                                                                          style: TextStyle(fontSize: 14, color: Colors.black45),
                                                                                        ),
                                                                                        RatingBar.builder(
                                                                                          initialRating: double.parse('${snapshot.data![index].rating}'),
                                                                                          minRating: double.parse('${snapshot.data![index].rating}'),
                                                                                          maxRating: double.parse('${snapshot.data![index].rating}'),
                                                                                          ignoreGestures: true,
                                                                                          itemSize: 18,
                                                                                          direction: Axis.horizontal,
                                                                                          allowHalfRating: true,
                                                                                          itemCount: 5,
                                                                                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                                                                          itemBuilder: (context, _) => Icon(
                                                                                            Icons.star,
                                                                                            color: Colors.amber,
                                                                                          ),
                                                                                          onRatingUpdate: (rating) {},
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 8,
                                                                                    ),
                                                                                    Container(width: constraints.maxWidth * 0.8, child: Text('${snapshot.data![index].review}')),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          });
                                                                } else if (snapshot
                                                                    .hasError) {
                                                                  return Text(
                                                                      "${snapshot.error}");
                                                                }
                                                                return Center(
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    child:
                                                                        const CircularProgressIndicator(
                                                                      strokeWidth:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                    ),
                                                  )
                                                ]),

                                            TextButton(
                                                style: ButtonStyle(
                                                    minimumSize:
                                                        MaterialStatePropertyAll(
                                                            Size(w, 20)),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            primary)
                                                    // shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                    //   RoundedRectangleBorder(
                                                    //     borderRadius: BorderRadius.all(Radius.circular(10))
                                                    //   )
                                                    // )
                                                    ),
                                                onPressed: () {
                                                  reviewNgo.ngoid =
                                                      widget.ngodetail.id!;
                                                  print(reviewNgo.ngoid);
                                                  show(context);
                                                },
                                                child: Text(
                                                  'Add Review',
                                                  style:
                                                      TextStyle(color: white),
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

void show(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(20)),
          title: Stack(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: new EdgeInsets.only(right: 15.0, top: 15.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/yashu.jpg",
                        ),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 130,
                        child: new Text(
                          'Asur Ngo dsdf',
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: 15,
                  right: 15,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel)))
            ],
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  itemSize: 35,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    reviewNgo.rating = int.parse('${rating}');
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: TextEditingController(text: reviewNgo.review),
                  onChanged: (value) {
                    reviewNgo.review = value;
                  },
                  style: TextStyle(fontFamily: 'Montserrat'),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 15, bottom: 15, left: 10),
                    hintText: 'Enter Review for Ngo',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primary)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primary)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      Map<String, dynamic> body = {
                        'ngo': reviewNgo.ngoid,
                        'review': reviewNgo.review,
                        'rating': reviewNgo.rating
                      };
                      try {
                        await Review(body);
                        var snackBar = SnackBar(
                            backgroundColor: primary,
                            padding: EdgeInsets.only(bottom: 20, top: 20),
                            content: Text(
                              'Review Submitted!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ));
                        await ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                        Navigator.pop(context);
                      } catch (e) {
                        var snackBar = SnackBar(
                            backgroundColor: primary,
                            padding: EdgeInsets.only(bottom: 20, top: 20),
                            content: Text(
                              'Unable to submit review!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ));
                        await ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        );
      });
}
