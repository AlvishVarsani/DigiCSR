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
  void initState(){
    // TODO: implement initState
    super.initState();
    try {
  futureRfpList = fetchCompanyRfp();
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
            print('${snapshot.data![index].company}');
            return InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RfpDetailsForCompany(snapshot.data![index]))),
              child: Card(
                color: Color(0x130CB6F0),
                shadowColor: Color(0x130CB6F0),
                elevation: 15,
                margin: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: primary, width: 1.2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Text(
                              '${snapshot.data![index].title}',style: TextStyle(color: black,fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 1, 10, 5),
                            child: Text(
                                'Date: ${snapshot.data![index].date}')),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: Text(
                                'Amount funded: ${snapshot.data![index].amount}',style: TextStyle(color: black,fontSize: 18),)),
                        
                        // Container(
                        //     padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        //     child: Text(
                        //         'States: ${snapshot.data![index].states}')),
                        // Container(
                        //     padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        //     child: Text(
                        //         'Sectors: ${snapshot.data![index].sectors.toString()}')),
                      ]),
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
          height: MediaQuery.of(context).size.width*0.15,
          width: MediaQuery.of(context).size.width*0.15,
          child: const CircularProgressIndicator(
            strokeWidth: 1,
          ),
        ),
      );
    },
    );
  }
}
