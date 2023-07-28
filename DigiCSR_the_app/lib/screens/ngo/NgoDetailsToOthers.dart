import 'package:digicsr/constants/constants.dart';
import 'package:flutter/material.dart';

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
    print('Ngo Details Loaded');
  }

  bool isvisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadngodetails();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
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
                    padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: (){
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
                              width: w,
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
                                              borderRadius:
                                                  BorderRadius.all(Radius.circular(20)),
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
                                                      
                                                      backgroundImage:
                                                       NetworkImage('${snapshot.data!.ngo_logo_path}'),
                                                      radius: 45,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: Text(
                                                        '${snapshot.data!.ngo_name}',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${snapshot.data!.summmary}',
                                                      style: TextStyle(fontSize: 14),
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
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(20)),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.transparent)),
                                        elevation: 0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 10,),
                                                ExpansionTile(
                                                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                                  title: Text(
                                                      "Ngo Summery",
                                                      style:
                                                          TextStyle(color: Colors.black),
                                                    ),
                                                    children: [
                                                      Text('${snapshot.data!.summmary}',style: TextStyle(fontSize: 16),)
                                                    ],
                                                    ),
                                                    
                                            Card(
                                                shadowColor: Colors.black,
                                                elevation: 0,
                                                child: Visibility(
                                                    visible: isvisible,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Summmrtyujhklhgfd fdghjuhkiokjhgf   need to add a shadow in my items listTiluld not do that with BoxShadow because it is only possible in Containe",
                                                          style: TextStyle(fontSize: 16),
                                                          textAlign: TextAlign.justify,
                                                        ),
                                                      ],
                                                    ))),
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
                                                    "Name",
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.ngo_name}",
                                                    style: TextStyle(fontSize: 24),
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
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.establishment_year}",
                                                    style: TextStyle(fontSize: 24),
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
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Phone no.",
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.phone}",
                                                    style: TextStyle(fontSize: 24),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
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
                                                    "Location",
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.city},${snapshot.data!.state},${snapshot.data!.pincode}",
                                                    style: TextStyle(fontSize: 24),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                ])
                                                // leading: Text('Name'),
                                                // title: Text('Username'),
                                                ),
                                            Divider(),
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
                                                    "Email",
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${snapshot.data!.email}",
                                                    style: TextStyle(fontSize: 20),
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
                                                    "Areas of Operation",
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Container(
                                                    // height: h * 0.5,
                                                    child: ListView.builder(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                        itemCount: snapshot.data!
                                                            .operation_areas!.length,
                                                        itemBuilder: (context, index) =>
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "${snapshot.data!.operation_areas![index]}",
                                                                  style: TextStyle(
                                                                      fontSize: 20),
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
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Sectors",
                                                    style:
                                                        TextStyle(color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Container(
                                                    // height: h * 0.5,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemCount: snapshot.data!.sectors!.length,
                                                        itemBuilder: (context, index) =>
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "${snapshot.data!.sectors![index]}",
                                                                  style: TextStyle(
                                                                      fontSize: 20),
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
                                            Container(
                                                width: w * 0.90,
                                                height: 110,
                                                child: ListView.builder(
                                                  // shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: snapshot
                                                      .data!.boardmemberslist!.length,
                                                  itemBuilder: (context, index) => Card(
                                                    child: Container(
                                                      height: 90,
                                                      width: 100,
                                                      child: Column(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 25,
                                                            child: Icon(
                                                              Icons.person,
                                                              size: 30,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                           Container(
                                                            width: 80,
                                                            alignment: Alignment.center,
                                                            child: new Text(
                                                              '${snapshot.data!.boardmemberslist![index].bm_name}',
                                                              overflow:
                                                                  TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                              style: new TextStyle(
                                                                fontSize: 13.0,
                                                                fontFamily: 'Roboto',
                                                                color: new Color(
                                                                    0xFF212121),
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
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
