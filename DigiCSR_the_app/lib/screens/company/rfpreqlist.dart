import 'package:digicsr/screens/company/RFPFullDetails.dart';
import 'package:digicsr/screens/company/rfp.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/RFPModel.dart';

class RFPReqList extends StatefulWidget {
  @override
  State<RFPReqList> createState() => _RFPReqListState();
}

class _RFPReqListState extends State<RFPReqList> {
  late Future<List<Rfp>> futureRfpList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      futureRfpList = fetchCompanyRfp();
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<void> _showDialog1(String rfpid) async {
    return showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Text("Alert"),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ))
                ],
              ),
              content: Container(
                height: 75,
                child: Column(
                  children: [
                    Text(
                      "Do you really want to delete this Rfp?",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Once the Rfp deleted it can not be recovered",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: primary),
                        )),
                    TextButton(
                        onPressed: () async {
                          try {
                            await deleteRfp(rfpid);
                            var snackBar = SnackBar(
                                backgroundColor: Colors.green.shade400,
                                padding: EdgeInsets.only(bottom: 20, top: 20),
                                content: Text(
                                  'Rfp is deleted successfully!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ));
                            await ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pop(context);
                          } on Exception catch (e) {
                            var snackBar = SnackBar(
                                backgroundColor: secondary,
                                padding: EdgeInsets.only(bottom: 20, top: 20),
                                content: Text(
                                  '${e}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: futureRfpList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            color: primary,
            onRefresh: () async {
              try {
                futureRfpList = fetchCompanyRfp();
              } on Exception catch (e) {
                // TODO
                print(e);
              }
              setState(() {});
            },
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print('${snapshot.data![index].company}');
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RfpDetailsForCompany(snapshot.data![index].id))),
                  child: Card(
                    color: Color(0x130CB6F0),
                    shadowColor: Color(0x130CB6F0),
                    elevation: 15,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: primary,
                            width: 1.2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Text(
                                    '${snapshot.data![index].title}',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 1, 10, 5),
                                    child: Text(
                                        'Date: ${snapshot.data![index].date!.substring(0, 10)}')),
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: Text(
                                      'Amount funded: ${snapshot.data![index].amount}',
                                      style:
                                          TextStyle(color: black, fontSize: 18),
                                    )),

                                // Container(
                                //     padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                //     child: Text(
                                //         'States: ${snapshot.data![index].states}')),
                                // Container(
                                //     padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                //     child: Text(
                                //         'Sectors: ${snapshot.data![index].sectors.toString()}')),
                              ]),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: IconButton(
                                        onPressed: () async {
                                          _showDialog1(
                                              snapshot.data![index].id!);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            child: const CircularProgressIndicator(
              strokeWidth: 1,
            ),
          ),
        );
      },
    );
  }
}
