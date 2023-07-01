import 'package:digicsr/models/RFPModel.dart';
import 'package:flutter/material.dart';

class RfpDetailsForCompany extends StatelessWidget {
  Rfp rfpdata;

  RfpDetailsForCompany(this.rfpdata, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              '${rfpdata.title}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: Text('${rfpdata.date}')),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 3,
                          child: Container(
                              height: 60,
                              width: 150,
                              child: Column(
                                children: [
                                  Text(
                                    '${rfpdata.amount}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  )
                                ],
                              )),
                        ),
                        Card(
                          elevation: 3,
                          child: Container(
                              height: 60,
                              width: 150,
                              child: Column(
                                children: [
                                  Text(
                                    '${rfpdata.remaining_amount}',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.red),
                                  ),
                                  Text(
                                    "Remaining Amount",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 80, right: 80),
                      child: ListTile(
                        title: Center(
                            child: Text(
                          '${rfpdata.timeline}',
                          style: TextStyle(fontSize: 20),
                        )),
                        subtitle: Center(child: Text("Timeline")),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "Sectors :",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: Card(
                          elevation: 0,
                          shadowColor: Colors.black,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: ListView.builder(
                                itemCount: rfpdata.sectors!.length,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        Text(
                                          '${rfpdata.sectors![index]}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                      ],
                                    )),
                          )),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
