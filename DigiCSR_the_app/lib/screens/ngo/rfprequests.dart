<<<<<<< HEAD
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/appbar.dart';
=======
import 'package:digicsr/models/RFPModel.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../services/rfp_services.dart';
>>>>>>> refs/remotes/origin/main

class RFPreq extends StatefulWidget {
  @override
  State<RFPreq> createState() => _RFPreqState();
}

class _RFPreqState extends State<RFPreq> {
  late Future<List<Rfp>> futureRfpList;

  @override
  void initState() {
    super.initState();
    futureRfpList = fetchAllRfp();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Requests',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Montserrat',
                                fontSize: 25)),
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(10, 20, 10, 20)),
                            alignment: Alignment.center,
                            // elevation: MaterialStatePropertyAll(20),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: black,
                                        width: 1.2,
                                        style: BorderStyle.solid)))))),
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Respnses',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Montserrat',
                                fontSize: 25)),
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(10, 20, 10, 20)),
                            alignment: Alignment.center,
                            // elevation: MaterialStatePropertyAll(20),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: black,
                                        width: 1.2,
                                        style: BorderStyle.solid)))))),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: futureRfpList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 20,
                          margin: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: black,
                                  width: 1.2,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(17))),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: Text(
                                        'Company: ${snapshot.data![index].company}'),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 8, 10, 8),
                                          child: Text(
                                              'Amount: ${snapshot.data![index].amount}')),
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 8, 10, 8),
                                          child: Text(
                                              'Timeline: ${snapshot.data![index].timeline}')),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Expanded(child: Container()),
                                        TextButton.icon(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    MaterialStatePropertyAll(
                                                        Size(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.3,
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.08)),
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.all(8)),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.green)),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.done,
                                              color: black,
                                            ),
                                            label: Text(
                                              'Accept',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 20),
                                            )),
                                        Expanded(child: Container()),
                                        TextButton.icon(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    MaterialStatePropertyAll(
                                                        Size(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.3,
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.08)),
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.all(8)),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red)),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.close,
                                              color: black,
                                            ),
                                            label: Text(
                                              'Reject',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 20),
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

                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar((user == 'NGO')?ngonav:companynav),
    );
  }
}
