import 'package:csc_picker/csc_picker.dart';
import 'package:digicsr/users/companyuser.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../widgets/textformfield.dart';



class ProfileScreenForCompany extends StatefulWidget {
  const ProfileScreenForCompany({super.key});

  @override
  State<ProfileScreenForCompany> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenForCompany> {

  void save()async{
    var token = await storage.read(key: company.cin);
    var res = await http.post(Uri.parse('http://localhost:4000/company/add-profile/:id'),
      headers: {
        'authorization': token.toString()
      }
    );
  }

  String countryValue = '';
  String? stateValue = '';
  String? cityValue = '';
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

  CompanyUser company = CompanyUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, fixedSize: Size(300, 42)),
                child: Text(
                  'COMPANY INFORMATION',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              TextFormFieldButton(
                  Text1: "Company Name", Text2: "Enter Full Name Of Company",controller: company.company_name),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                Text1: "Year Of Establishment",
                Text2: "yyyy",
                controller: company.establishment_year.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                Text1: "Company Summery",
                Text2: 'Enter text',
                controller: company.summary,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Location of the Company',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              CSCPicker(
                onCountryChanged: (country) {
                  company.company_country = country;
                  setState(() {
                    countryValue = country;
                  });
                },
                onStateChanged: (state) {
                  company.company_state = state;
                  setState(() {
                    stateValue = state;
                  });
                },
                onCityChanged: (city) {
                  company.company_city = city;
                  setState(() {
                    cityValue = city;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, fixedSize: Size(550, 42)),
                child: Text(
                  'Communication Person of the Company',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              TextFormFieldButton(
                Text1: "Name",
                Text2: 'Enter Name of the communication person',
                controller: company.cp_name
              ),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                Text1: "Email",
                Text2: 'Enter email of communicatoin person',
                controller: company.cp_email
              ),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                Text1: 'Phone No.',
                Text2: 'Phone Number',
                controller: company.cp_phone,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                Text1: 'Designation of the communication person',
                Text2: 'Enter Designation of the communication person',
                controller: company.cp_designation
              ),
              SizedBox(
                height: 10,
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
                          company.sectors = values;
                          setState(() {
                _selectedOptions = values;
                          });
                        },
                      ),
                    ),
              ),
               SizedBox(
                height: 10,
              ),
              Text(
                "Company Registration Certificate",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
          ElevatedButton(
                
      child: Text('Upload file'),
      
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();
        company.registration_certificate = picked;

        if (picked != null) {
          print(picked.files.first.name);
        }
      },
    ),
    SizedBox(height: 10,),
   Center(child: ElevatedButton(onPressed: (){}, child: Text("Save")))
              

            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(pages),
    );
  }
}
