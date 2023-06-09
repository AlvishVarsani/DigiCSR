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
    futureRfpList = fetchCompanyRfp();
    print(futureRfpList);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    width: MediaQuery.of(context).size.width,
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
                      color: black, width: 1.2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(17))),
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
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text(
                                  'Amount: ${snapshot.data![index].amount}')),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text(
                                  'Timeline: ${snapshot.data![index].timeline}')),
                        ],
                      ),
                    ]),
              ),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return const CircularProgressIndicator(
        strokeWidth: 3,
      );
    },
    ),
    );
  }
}
