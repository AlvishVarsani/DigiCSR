import 'package:digicsr/screens/company/rfp.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/RFPModel.dart';

class DonationReqList extends StatefulWidget {
  @override
  State<DonationReqList> createState() => _DonationReqListState();
}

class _DonationReqListState extends State<DonationReqList> {
  late Future<Rfp> futureRfp;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    try {
  futureRfp = donationReq();
} on Exception catch (e) {
  // TODO
  print(e);
}
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Card(
        child: Column(
          children: [
            Text('$futureRfp.'),
          ],
        ),
      ),
    );
  }
}
