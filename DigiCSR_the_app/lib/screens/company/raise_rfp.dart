import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/rfp_services.dart';
import 'package:digicsr/widgets/multiselect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../widgets/textformfield.dart';

class RaiseRfpRequest extends StatefulWidget {
  const RaiseRfpRequest({super.key});

  @override
  State<RaiseRfpRequest> createState() => _RaiseRfpRequestState();
}

class _RaiseRfpRequestState extends State<RaiseRfpRequest> {
  final String rfptitle = '';
  final String rfpamount = '';
  final String rfptimeline = '';


Map<String,String> rfpbody(){
  print(rfptitle);
  return {
  'title': rfptitle,
  'amount': rfptitle,
  'timeline': rfptimeline,
  'sectors': selectedSectors.toString(),
  'states': selectedstates.toString(),
};
}

  List<String> selectedSectors = [];
  List<String> selectedstates = [];
  final _items = [
    MultiSelectItem<String>('Option 1', "Rural Development"),
    MultiSelectItem<String>('Option 2', "Encouraging Sports"),
    MultiSelectItem<String>('Option 3', "Clean Ganga Fund"),
    MultiSelectItem<String>('Option 4', "Swachh Bharat"),
    MultiSelectItem<String>('Option 5', "Health & Sanitation"),
    MultiSelectItem<String>(
        'Option 6', "Education, Differently Abled, Livelihood"),
    MultiSelectItem<String>('Option 7',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>(
        'Option 8', "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Option 9', "Slum Development"),
    MultiSelectItem<String>('Option 10', "Heritage Art And Culture"),
    MultiSelectItem<String>(
        'Option 11', "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('Option 12', "others"),
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
                      TextFormFieldButton(
                        "RFP Title",
                        Text2: "Enter tilte of RFP",
                        controller: rfptitle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormFieldButton(
                        "Amount of RFP",
                        Text2: "Amount of Rfp",
                        controller: rfpamount,
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
                          child: MultiSelect(_items, selectedSectors),
                        ),
                      ),
                      TextFormFieldButton(
                        "Timeline for money utilization",
                        Text2: "mm(least value should be of 12 months",
                        controller: rfptimeline,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly
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
                          child: MultiSelect(Indianstates, selectedstates),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                print(rfpbody());
                                addRFP('yashuranparia136@gmail.com', rfpbody());
                              }, child: Text("Raise Request")))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
