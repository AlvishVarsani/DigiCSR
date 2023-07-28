import 'package:digicsr/screens/ngo/Praposal_Accept.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'package:digicsr/models/RFPModel.dart';

import '../../services/rfp_services.dart';

class PraposalScreen extends StatefulWidget {
  @override
  State<PraposalScreen> createState() => _PraposalScreenState();
}

class _PraposalScreenState extends State<PraposalScreen> {
  late Future<List<Rfp>> futureRfpList;

  @override
  void initState() {
    super.initState();
    futureRfpList = fetchAllRfp();
  }

  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      // appBar: CustomAppBar(context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => 
           Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: constraints.maxWidth,
                  child: FutureBuilder(
                    future: futureRfpList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return RefreshIndicator(
                          onRefresh: ()async{
                            futureRfpList = fetchAllRfp();
                            setState(() {});
                          },
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Card(
                                      // color: Color(0x130CB6F0),
                                      shadowColor: Color(0x130CB6F0),
                                      elevation: 20,
                                      // margin: EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: primary,
                                              width: 1.2,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(6))),
                                      child: Container(
                                        // padding: EdgeInsets.all(0),
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.fromLTRB(10, 13, 10, 10),
                                                child: Text(
                                                    '${snapshot.data![index].title}',style: TextStyle(fontSize: 25,color: black,letterSpacing: 1.1),),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 8, 10, 8),
                                                      child: Text(
                                                          'Amount: ${snapshot.data![index].amount}')),
                                                  Container(
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 8, 10, 8),
                                                      child: Text(
                                                          'Timeline: ${snapshot.data![index].timeline}')),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Container(
                                            width: w,
                                            margin: EdgeInsets.all(0),
                                            padding: EdgeInsets.only(right: 6,left: 6),
                                            child: PraposalAccept(snapshot.data![index])),
                        
                                            SizedBox(
                                              height: 10,
                                            ),
                                            
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
        
                      return Center(
          child: Container(
            height: MediaQuery.of(context).size.width*0.15,
            width: MediaQuery.of(context).size.width*0.15,
            child: const CircularProgressIndicator(
              strokeWidth: 1,
            ),
          ),
              );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
