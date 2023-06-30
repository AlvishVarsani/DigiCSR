import 'package:flutter/material.dart';

class RfpDetailsFoeCompany extends StatefulWidget {
  const RfpDetailsFoeCompany({super.key});

  @override
  State<RfpDetailsFoeCompany> createState() => _RfpDetailsFoeCompanyState();
}

class _RfpDetailsFoeCompanyState extends State<RfpDetailsFoeCompany> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Card(
            child: Column(
              children: [
                Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: ListTile(
                          title: Center(
                            child: Text(
                              "RFP Details",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        )),
                        Text("20/12/2023"),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 150,
                              child: Column(
                                children: [
                                  Text("25207410",style: TextStyle(fontSize: 20,color: Colors.green),),
                                  Text("Amount",style: TextStyle(fontSize: 15,color: Colors.grey),)

                                ],
                              )
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              child: Column(
                                children: [
                                  Text("25207410",style: TextStyle(fontSize: 20,color: Colors.red),),
                                  Text("Remaining Amount",style: TextStyle(fontSize: 15,color: Colors.grey),)

                                ],
                              )
                            )
                          ],
                        )
              ],
            ),
          )
        ],
        )
      ),
    );
  }
}