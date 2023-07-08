import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/RFPModel.dart';

class PraposalAccept extends StatefulWidget {
  Rfp rfp;
  PraposalAccept(this.rfp);
  @override
  State<PraposalAccept> createState() => _PraposalAcceptState();
}

class _PraposalAcceptState extends State<PraposalAccept> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requested_amount = '';

  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  


  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      builder: (context) => 
         AlertDialog(
          scrollable: true,
            title: Container(
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/app_icon/digicsr_app_icon.png'),
                        radius: 15,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.rfp.company!,
                          style: TextStyle(
                              color: black, fontSize: 20, letterSpacing: 1.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    widget.rfp.title!,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Amount: ${widget.rfp.amount}',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Montserrat')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Timeline: ${widget.rfp.timeline}',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Montserrat')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('States: ${widget.rfp.states}',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Montserrat')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sectors: ${widget.rfp.sectors}',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Montserrat')),
                      ),
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
      enabled: true,
      textInputAction: TextInputAction.next,
                      controller: TextEditingController(text: requested_amount),
                      textDirection: TextDirection.ltr,
                      // keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                      onChanged: (value){
                        requested_amount = value;
                      },
                      decoration: InputDecoration(
                          label: Text('Required Amount'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: primary,
                                  width: 1.1,
                                  style: BorderStyle.solid)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.1,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: primary,
                                  width: 1.1,
                                  style: BorderStyle.solid)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.1,
                                  style: BorderStyle.solid)),
                                  
                                  
                                  ),
                    ),
                  ),
                    ],
                  ),
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextButton(
                  onPressed: () {
                    print(data());
                    acceptPraposal(data());
                  },
                  child: Text(
                    'Raise Request',
                    style: TextStyle(color: black, fontSize: 18),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primary),
                      elevation: MaterialStatePropertyAll(20),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: primary, width: 1.1)))),
                ),
              ),
            ]),
    );
  }


  Map<dynamic, dynamic> data() =>
      {'rfpID': widget.rfp.id, 'amount': int.parse(requested_amount)};
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      child: Text('Request',style: TextStyle(fontSize: 16,color: black),),
        style: ButtonStyle(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    side: BorderSide(color: primary))),
            // maximumSize:
            //     MaterialStatePropertyAll(
            //       Size(150,60)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(8)),),
        onPressed: () {
          _showDialog();
        },
        );
  }
}

