import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/RFPModel.dart';
import '../../services/rfp_services.dart';

class PraposalCard extends StatefulWidget {
  @override
  State<PraposalCard> createState() => _PraposalCardState();
}

class _PraposalCardState extends State<PraposalCard> {
  late Future<List<Rfp>> futureRfpList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
  futureRfpList = fetchAllRfp();
} on Exception catch (e) {
  // TODO
  print(e);
}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
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
                        color: primary, width: 1.2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(17))),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    // onTap: ()=>PraposalAccept('${snapshot.data![index].id}', double.parse/('${snapshot.data![index].amount}'), '${snapshot.data![index].timeline}'),
                    title: Text(
                      '${snapshot.data![index].title}',
                      style: TextStyle(
                          fontSize: 25, color: black, letterSpacing: 1.1),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/app_icon/digicsr_app_icon.png'),
                          radius: 10,
                    ),
                    subtitle: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text(
                                  'Amount: ${snapshot.data![index].amount}')),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text(
                                  'Timeline: ${snapshot.data![index].timeline}')),
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8),
                      child: TextButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6)),
                                      side: BorderSide(
                                          color: Color(0xe500c300)))),
                              // maximumSize:
                              //     MaterialStatePropertyAll(
                              //       Size(150,60)),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.all(8)),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color(0x5533d520))),
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
                                letterSpacing: 1.2,
                                fontSize: 16),
                          )),
                    ),
                  ),
                ),
              );
            },
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
