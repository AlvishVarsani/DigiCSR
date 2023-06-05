import 'package:csc_picker/csc_picker.dart';
import 'package:digi_csr/views/common_widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ProfileScreenForNGO extends StatefulWidget {
  const ProfileScreenForNGO({super.key});

  @override
  State<ProfileScreenForNGO> createState() => _ProfileScreenForNGOState();
}

class _ProfileScreenForNGOState extends State<ProfileScreenForNGO> {
  
 List<String> _selectedOptions1 = [];
final _items1 = [
    MultiSelectItem<String>('Option 1', "Male"),
    MultiSelectItem<String>('Option 2',  "Female"),
    MultiSelectItem<String>('Option 3',"others"),

   
  ];
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, fixedSize: Size(550, 42)),
                child: Text(
                  'NGO INFORMATION',
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
                  Text1: "Ngo Name", Text2: "Enter ngo full name"),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                Text1: "Ngo Summary",
                Text2: "Enter Text...",
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],

              ),
              SizedBox(height: 10,),
               TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, fixedSize: Size(550, 42)),
                child: Text(
                  'ADD BOARD MEMBER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 10,),
              TextFormFieldButton(Text1: "Member Name",
              Text2: "Enter Member Name"),
              SizedBox( height: 10,),
              Text("Select Gender",style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
               Card(
                child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: MultiSelectDialogField<String>(
                        title: Text('Select Options'),
                        items: _items1,
                        initialValue: _selectedOptions1,
                        onConfirm: (values) {
                          setState(() {
                _selectedOptions1 = values;
                          });
                        },
                      ),
                    ),
              ),
              TextFormFieldButton(Text1: "DIN",
              Text2: "Enter DIN "),
              SizedBox(height: 10,),
              TextFormFieldButton(Text1: "Phone no.",
              Text2: "Enter phone no",
              keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: 10,),
              TextFormFieldButton(Text1: "Designation",
              Text2: "Enter Designation"),
              SizedBox(height: 10,),
              TextFormFieldButton(Text1: "CSR Budget of this year",
              Text2: "CSR Budget"
              ),
              SizedBox(height: 10,),
              Text("Area of operation",style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
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
               Text(
                "Sector  to provide CSR",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(height:5,),
             
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
               SizedBox(height: 10,),
   Center(child: ElevatedButton(onPressed: (){}, child: Text("Save")))


           


          ],
        ),
        ),),);
    
  }
}
