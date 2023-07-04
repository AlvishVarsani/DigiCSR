import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/rfp_services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RaiseRfpRequest extends StatefulWidget {
  const RaiseRfpRequest({super.key});

  @override
  State<RaiseRfpRequest> createState() => _RaiseRfpRequestState();
}

class _RaiseRfpRequestState extends State<RaiseRfpRequest> {
  @override
  void initState() {
    super.initState();
    rfp.sectors = [];
    rfp.states = [];
  }
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  // String rfptitle = '';
  // String rfpamount = '';
  // String rfptimeline = '';

  List<dynamic> selectedSectors = [];
  List<dynamic> selectedstates = [];
  final _items = [
    MultiSelectItem('Rural Development', "Rural Development"),
    MultiSelectItem('Encouraging Sports', "Encouraging Sports"),
    MultiSelectItem('Clean Ganga Fund', "Clean Ganga Fund"),
    MultiSelectItem('Swachh Bharat', "Swachh Bharat"),
    MultiSelectItem('Health & Sanitation', "Health & Sanitation"),
    MultiSelectItem('Education, Differently Abled, Livelihood',
        "Education, Differently Abled, Livelihood"),
    MultiSelectItem(
        'Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem('Environment, Animal Welfare, Conservation of Resources',
        "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem('Slum Development', "Slum Development"),
    MultiSelectItem('Heritage Art And Culture', "Heritage Art And Culture"),
    MultiSelectItem('Prime Minister National Relief Funds',
        "Prime Minister National Relief Funds"),
    MultiSelectItem('others', "others"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.arrow_back_ios_new,),
              SizedBox(width: 10,),
              Text(
                        'Back to RFP page',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w500,
                            color: primary),
                      ),
            ],
          ),
        ),
        foregroundColor: primary,
        backgroundColor: white,
        titleSpacing: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: primary,
                        fixedSize: Size(400, 42)),
                    child: Text(
                      'Raise RFP Request',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RFP Title',
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        textDirection: TextDirection.ltr,
                        controller: TextEditingController(text: rfp.title),
                        onChanged: (value) {
                          rfp.title = value;
                        },
                        
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            hintText: 'Enter title',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primary))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RFP Amount',
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        scrollPadding: EdgeInsets.all(8),
                        textDirection: TextDirection.ltr,
                        controller: TextEditingController(text: (rfp.amount == null)?'':rfp.amount.toString()),
                        onChanged: (value) {
                          rfp.amount = int.parse(value);
                        },
                        onEditingComplete: () {
                          
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            hintText: 'Enter amount of RFP',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Timeline',
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        scrollPadding: EdgeInsets.all(8),
                        textDirection: TextDirection.ltr,
                        controller: TextEditingController(text: rfp.timeline),
                        onChanged: (value) {
                          rfp.timeline = value;
                        },
                        onEditingComplete: () {
                          
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            hintText: 'Enter the timeline',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Sector to provide CSR",
                    style: TextStyle(
                        color: primary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MultiSelectDialogField<dynamic>(
                    buttonText: Text('Select Sectors',style: TextStyle(fontSize: 16,color: Colors.black54),),
                    dialogHeight: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38,style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    title: Text('Select Options'),
                    items: _items,
                    selectedColor: primary,
                    // checkColor: primary,
                    initialValue: selectedSectors,
                    onConfirm: (values) {
                      setState(() {
                        selectedSectors = values;
                        rfp.sectors = values;
                      });
                    },
                  ),
                  
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "States",
                    style: TextStyle(
                        color: primary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  MultiSelectDialogField(
                    buttonText: Text('Select States',style: TextStyle(fontSize: 16,color: Colors.black54),),
                    dialogHeight: MediaQuery.of(context).size.height * 0.6,
                    title: Text('Select Options'),
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38,style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                    items: Indianstates,
                    selectedColor: primary,
                    initialValue: selectedstates,
                    onConfirm: (values) {
                      setState(() {
                        selectedstates = values;
                        rfp.states = values;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStatePropertyAll(primary),
                          elevation: MaterialStatePropertyAll(4),
                          backgroundColor: MaterialStatePropertyAll(primary)
                        ),
                          onPressed: () {
                             Map<String, dynamic> rfpbody(){
                              return {
                                'title': rfp.title,
                              'amount': rfp.amount,
                              'timeline': rfp.timeline,
                              'sectors': rfp.sectors,
                              'states': rfp.states,
                              };
                             }
                            // print(formdata['sectors']+formdata['states']);
                            addRFP(rfpbody());
                          },
                          child: Text("Raise Request")))
                ]),
          ),
        ),
      ),
    );
  }
}
