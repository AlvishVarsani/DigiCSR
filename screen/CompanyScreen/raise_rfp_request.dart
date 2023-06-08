import 'package:csc_picker/csc_picker.dart';
import 'package:digi_csr/views/common_widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RaiseRfpRequest extends StatefulWidget {
  const RaiseRfpRequest({super.key});

  @override
  State<RaiseRfpRequest> createState() => _RaiseRfpRequestState();
}

class _RaiseRfpRequestState extends State<RaiseRfpRequest> {
  String countryValue = '';
  String? stateValue = '';
  String? cityValue='';
 
  List<String> _selectedOptions = [];
  final _items = [
    MultiSelectItem<String>('Option 1', "Rural Development"),
    MultiSelectItem<String>('Option 2',  "Encouraging Sports"),
    MultiSelectItem<String>('Option 3',  "Clean Ganga Fund"),
    MultiSelectItem<String>('Option 4',   "Swachh Bharat"),
    MultiSelectItem<String>('Option 5',   "Health & Sanitation" ),
    MultiSelectItem<String>('Option 6',    "Education, Differently Abled, Livelihood"),
     MultiSelectItem<String>('Option 7',    "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>('Option 8',   "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Option 9',  "Slum Development"),
    MultiSelectItem<String>('Option 10',  "Heritage Art And Culture"),
    MultiSelectItem<String>('Option 11',  "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('Option 12',"others"),

   
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("RFP",style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
              shadowColor: Colors.black,
              elevation: 10,
              
              
              child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue, fixedSize: Size(400, 42)),
                    child: Text(
                      'Raise RFP Request',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10,),
                TextFormFieldButton(Text1: "RFP Title",
                Text2: "Enter tilte of RFP"
                ),
                SizedBox(height: 10,),
                TextFormFieldButton(Text1: "Amount of RFP",
                Text2: "Amount of Rfp"),
                SizedBox(height: 10,),
                Text("Sector to provide CSR",style:
                      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                
                Card(
                  child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: MultiSelectDialogField<String>(
                          title: Text('Select Options'),
                          items: _items,
                          initialValue: _selectedOptions,
                          onConfirm: (values) {
                            setState(() {
                  _selectedOptions = values;
                            });
                          },
                        ),
                      ),
                ),
                TextFormFieldButton(Text1: "Timeline for money utilization",
                Text2: "mm(least value should be of 12 months",
                keyboardType: TextInputType.number,
                inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                SizedBox(height: 10,),
                Text("States",style:
                      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                 CSCPicker(
                showCities: false,
                  onCountryChanged: (country) {
                    setState(() {
                      countryValue = country;
                    });
                  },
                  onStateChanged: (state) {
                    setState(() {
                      stateValue = state;
                    });
                  },
                  onCityChanged: (city) {
                    setState(() {
                      cityValue = city;
                    });
                  },
                 ),
                 SizedBox(height: 10,),
             Center(child: ElevatedButton(onPressed: (){}, child: Text("Raise Request")))
          
                    
                    
                    
              ]),
            )
            
            
            
            
            
            
            
            ,),
          ),
        ),
    
      ),
    );
  }
}