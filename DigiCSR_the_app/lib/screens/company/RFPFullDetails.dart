import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/RFPModel.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RfpDetailsForCompany extends StatefulWidget {
  String? rfpid;

  RfpDetailsForCompany(this.rfpid, {super.key});

  @override
  State<RfpDetailsForCompany> createState() => _RfpDetailsForCompanyState();
}

class _RfpDetailsForCompanyState extends State<RfpDetailsForCompany> {
  late Future<Rfp> rfpdata;
  void loadrfpdata() {
    print('LoadRfp function called');
    rfpdata = loadCompanyRfp(widget.rfpid!);
  }
  
  Map<String,dynamic> data = Map();

  @override
  void initState() {
    // TODO: implement initState
    print('Page called');
    super.initState();
    loadrfpdata();
    print('Rfp data Loaded!');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
              future: rfpdata,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Card(
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      '${snapshot.data!.title}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Center(child: Text('${snapshot.data!.date!.substring(0, 10)}')),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          elevation: 3,
                                          child: Container(
                                              height: 60,
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${snapshot.data!.amount}',
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Amount",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              )),
                                        ),
                                        Card(
                                          elevation: 3,
                                          child: Container(
                                              height: 60,
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${snapshot.data!.remaining_amount}',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    "Remaining Amount",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Card(
                                      margin:
                                          EdgeInsets.only(left: 80, right: 80),
                                      child: ListTile(
                                        title: Center(
                                            child: Text(
                                          '${snapshot.data!.timeline}',
                                          style: TextStyle(fontSize: 20),
                                        )),
                                        subtitle:
                                            Center(child: Text("Timeline")),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Sectors :",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Card(
                                        elevation: 0,
                                        shadowColor: Colors.black,
                                        child: Container(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: snapshot
                                                  .data!.sectors!.length,
                                              itemBuilder: (context, index) =>
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data!.sectors![index]}',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                    ],
                                                  )),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "States :",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Card(
                                        elevation: 0,
                                        shadowColor: Colors.black,
                                        child: Container(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  snapshot.data!.states!.length,
                                              itemBuilder: (context, index) =>
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data!.states![index]}',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                    ],
                                                  )),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Donation Requests',
                                            style: TextStyle(fontSize: 25)),
                                        Container(
                                          color: blueglass,
                                          padding: EdgeInsets.all(10),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: snapshot
                                                  .data!.donations!.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                    elevation: 10,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${snapshot.data!.donations![index].requested_ngo_name}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 6,
                                                                  ),
                                                                  Text(
                                                                    "Requested amount : ${snapshot.data!.donations![index].requested_amount}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        '${snapshot.data!.donations![index].requested_date!.substring(0, 10)}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        '${snapshot.data!.donations![index].status}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color: (snapshot.data!.donations![index].status == 'Pending')
                                                                                ? secondary
                                                                                : (snapshot.data!.donations![index].status == 'approve')?Colors.green:Colors.redAccent.shade400),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          (snapshot.data!.donations![index].status == 'Pending')?
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: TextButton(
                                                                  onPressed: ()async{
                                                                    snapshot.data!.donations![index].status = 'approve';
                                                                    data['rfpID'] = snapshot.data!.id;
                                                                    data['donationId'] = snapshot.data!.donations![index].donation_id;
                                                                    data['action'] = snapshot.data!.donations![index].status;
                                                                    int statusCode = await manage_donations(data);
                                                                      if(statusCode != 200){
                                                                        snapshot.data!.donations![index].status = 'Pending';
                                                                      }else{
                                                                        setState(() {});
                                                                      }
                                                                  }, 
                                                                  child: Text('Accept',style: TextStyle(fontSize: 14,color: Colors.green),),
                                                                  style: ButtonStyle(
                                                                    padding: MaterialStatePropertyAll(EdgeInsets.all(1)),
                                                                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                          color: Colors.green,
                                                                          style: BorderStyle.solid
                                                                        ),
                                                                        borderRadius: BorderRadius.all(Radius.circular(6))
                                                                      )
                                                                    ),
                                                                  ),
                                                                  ),
                                                              ),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Expanded(
                                                                child: TextButton(
                                                                  onPressed: ()async{
                                                                    snapshot.data!.donations![index].status = 'reject';
                                                                    data['rfpID'] = snapshot.data!.id;
                                                                    data['donationId'] = snapshot.data!.donations![index].donation_id;
                                                                    data['action'] = snapshot.data!.donations![index].status;
                                                                      int statusCode = await manage_donations(data);
                                                                      if(statusCode != 200){
                                                                        snapshot.data!.donations![index].status = 'Pending';
                                                                      }else{
                                                                        setState(() {});
                                                                      }
                                                                  }, 
                                                                  child: Text('Reject',style: TextStyle(fontSize: 14,color: Colors.redAccent.shade400),),
                                                                  style: ButtonStyle(
                                                                    padding: MaterialStatePropertyAll(EdgeInsets.all(1)),
                                                                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                          color: Colors.red,
                                                                          style: BorderStyle.solid
                                                                        ),
                                                                        borderRadius: BorderRadius.all(Radius.circular(6))
                                                                      )
                                                                    ),
                                                                  ),
                                                                  ),
                                                              ),
                                                            ],
                                                          ):SizedBox.shrink()
                                                        ],
                                                      ),
                                                    )
                                                    // ListTile(
                                                    //   title: Text('${snapshot.data!.donations![index].requested_ngo_name}',style: TextStyle(fontSize: 18),),
                                                    //   subtitle: Text("Requested amount : ${snapshot.data!.donations![index].requested_amount}3"),
                                                    //   // trailing: Text('Requested amount : ${snapshot.data!.donations![index].requested_amount}'),
                                                    //   trailing: Text('${snapshot.data!.donations![index].requested_date!.substring(0,10)}'),
                                                    // ),
                                                    );
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  Text('${snapshot.error}');
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
              })),
    );
  }
}
