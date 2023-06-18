import 'package:digicsr/screens/ngo/Praposal_Accept.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/appbar.dart';
import 'package:digicsr/models/RFPModel.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
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
      appBar: CustomAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Text('Praposals',
                    style: TextStyle(
                        color: black,
                        fontFamily: 'Montserrat',
                        fontSize: 25)),
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(w, (45 < h*0.09)?45:h*0.09)),
                  backgroundColor: MaterialStatePropertyAll(primary),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.fromLTRB(10,14, 10, 14)),
                    alignment: Alignment.center,
                    // elevation: MaterialStatePropertyAll(20),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(
                                color: primary,
                                width: 1.2,
                                style: BorderStyle.solid))))),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: futureRfpList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Color(0x130CB6F0),
                            shadowColor: Color(0x130CB6F0),
                            elevation: 20,
                            margin: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: primary,
                                    width: 1.2,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17))),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 8, 10, 8),
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
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Expanded(child: Container()),
                                          PraposalAccept(snapshot.data![index]),
                                          Expanded(child: Container()),
                                          TextButton.icon(
                                              style: ButtonStyle(
                                                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(6)
                                                    ),
                                                    side: BorderSide(
                                                      color: Color(0xa8e91010)
                                                    )
                                                  )
                                                ),
                                                  // maximumSize:
                                                  //     MaterialStatePropertyAll(Size(150,
                                                  //         MediaQuery.sizeOf(
                                                  //                     context)
                                                  //                 .height *
                                                  //             0.08)
                                                              // ),
                                                  padding:
                                                      MaterialStatePropertyAll(
                                                          EdgeInsets.all(8)),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Color(0x55e51020))),
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.close,
                                                color: black,
                                              ),
                                              label: Text(
                                                'Dismiss',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Montserrat',
                                                    letterSpacing: 1.2,
                                                    fontSize: 16),
                                              )),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          );
                        },
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
      bottomNavigationBar:
          CustomBottomNavBar((user == 'NGO') ? ngonav : companynav),
    );
  }
}