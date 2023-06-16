import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:digicsr/widgets/multiselect.dart';
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
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  String rfptitle = '';
  String rfpamount = '';
  String rfptimeline = '';

  Map<String, dynamic> rfpbody() {
    return {
      'title': rfptitle,
      'amount': rfpamount,
      'timeline': rfptimeline,
      'sectors': selectedSectors,
      'states': selectedstates,
    };
  }
  

  List<String> selectedSectors = [];
  List<String> selectedstates = [];
  final _items = [
    MultiSelectItem<String>('Rural Development', "Rural Development"),
    MultiSelectItem<String>('Encouraging Sports', "Encouraging Sports"),
    MultiSelectItem<String>('Clean Ganga Fund', "Clean Ganga Fund"),
    MultiSelectItem<String>('Swachh Bharat', "Swachh Bharat"),
    MultiSelectItem<String>('Health & Sanitation', "Health & Sanitation"),
    MultiSelectItem<String>('Education, Differently Abled, Livelihood',
        "Education, Differently Abled, Livelihood"),
    MultiSelectItem<String>(
        'Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>(
        'Environment, Animal Welfare, Conservation of Resources',
        "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Slum Development', "Slum Development"),
    MultiSelectItem<String>(
        'Heritage Art And Culture', "Heritage Art And Culture"),
    MultiSelectItem<String>('Prime Minister National Relief Funds',
        "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('others', "others"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "RFP",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
              shadowColor: Colors.black,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textDirection: TextDirection.ltr,
                            controller: TextEditingController(text: rfptitle),
                            onChanged: (value) {
                              rfptitle = value;
                            },
                            onEditingComplete: () => {
                              setState(() {
                                print(rfptitle);
                              })
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter title',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RFP Amount',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textDirection: TextDirection.ltr,
                            controller: TextEditingController(text: rfpamount),
                            onChanged: (value) {
                              rfpamount = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter amount of RFP',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sector to provide CSR",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: MultiSelectDialogField<String>(
                            title: Text('Select Options'),
                            items: _items,
                            initialValue: selectedSectors,
                            onConfirm: (values) {
                              setState(() {
                                selectedSectors = values;
                              });
                            },
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Timeline',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller:
                                TextEditingController(text: rfptimeline),
                            onChanged: (value) {
                              rfptimeline = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    'Enter the timeline for amount utility.',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "States",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: MultiSelectDialogField<String>(
                            title: Text('Select Options'),
                            items: Indianstates,
                            initialValue: selectedstates,
                            onConfirm: (values) {
                              setState(() {
                                selectedstates = values;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                print(rfpbody());
                                addRFP(rfpbody());
                              },
                              child: Text("Raise Request")))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
