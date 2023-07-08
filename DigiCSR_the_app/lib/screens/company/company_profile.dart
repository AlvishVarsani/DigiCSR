import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:digicsr/services/company_profile_services.dart';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../constants/constants.dart';
import '../../widgets/textformfield.dart';

class ProfileScreenForCompany extends StatefulWidget {
  const ProfileScreenForCompany({super.key});

  @override
  State<ProfileScreenForCompany> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenForCompany> {
  String countryValue = '';
  String? stateValue = '';
  String? cityValue = '';
  List<dynamic> _sectors = [];
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
  bool? firstcheck = false;
  bool? secondcheck = false;
  bool? thirdcheck = false;
  bool? fourthcheck = false;

  Future<void> pick_company_certificate() async {
    // Clear previous files
    setState(() {
      company.registration_certificate = null;
    });

    // Pick files using file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
      allowMultiple: false,
    );

    // If files are picked, update state
    if (result != null) {
      setState(() {
        company.registration_certificate = File(result.files.single.path!);
      });
    }
  }

  Future<void> pick_company_logo() async {
    // Clear previous files
    setState(() {
      company.company_logo = null;
    });

    // Pick files using file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );

    // If files are picked, update state
    if (result != null) {
      setState(() {
        company.company_logo = File(result.files.single.path!);
        print('Logo Picked');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: primary,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  "Company Information",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    await pick_company_logo();
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black38,
                                              width: 1.1),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.black38,
                                        size: 60,
                                      )),
                                ),
                                Text(
                                  'Profile Logo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Gotham',
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: TextEditingController(
                                  text: company.company_name,
                                ),
                                onChanged: (value) {
                                  company.company_name = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Company Name',
                                    prefixIcon: Icon(Icons.group_outlined),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: 'Enter the full name of Company',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: TextEditingController(
                                  text: company.email,
                                ),
                                onChanged: (value) {
                                  company.email = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: 'Enter the email of Company',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: TextEditingController(
                                  text: (company.establishment_year == null)? '' : company.establishment_year.toString(),
                                ),
                                onChanged: (value) {
                                  company.establishment_year = int.parse(value);
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Establistment Year',
                                    prefixIcon: Icon(Icons.date_range),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: 'yyyy',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100),
                                ],
                                controller: TextEditingController(
                                  text: company.summary,
                                ),
                                onChanged: (value) {
                                  company.summary = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Company Summerry',
                                    prefixIcon: Icon(Icons.picture_in_picture),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: 'Enter text',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'Location of the Company',
                            style: TextStyle(
                                color: primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: CSCPicker(
                            onCountryChanged: (country) {
                              // company.company_country = country;
                              setState(() {
                                countryValue = country;
                              });
                            },
                            onStateChanged: (state) {
                              company.state = state;
                              setState(() {
                                stateValue = state;
                              });
                            },
                            onCityChanged: (city) {
                              company.city = city;
                              setState(() {
                                cityValue = city;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: TextEditingController(
                                  text: company.pincode,
                                ),
                                onChanged: (value) {
                                  company.pincode = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Pincode',
                                    prefixIcon:
                                        Icon(Icons.picture_in_picture_rounded),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: 'Enter Pincode',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Sector  to provide CSR",
                            style: TextStyle(
                                color: primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: MultiSelectDialogField<dynamic>(
                            buttonText: Text(
                              'Select Sectors',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            dialogHeight:
                                MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black38,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            title: Text('Select Options'),
                            items: _items,
                            checkColor: primary,
                            initialValue: _sectors,
                            onConfirm: (values) {
                              setState(() {
                                _sectors = values;
                                company.sectors = values;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            " Tax Compliance Eligibility",
                            style: TextStyle(
                                color: primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black54),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        value: firstcheck,
                                        onChanged: (value) {
                                          if (value == true) {
                                            company.tax_comp!.add(
                                                '80 G (for 50% tax benefits)');
                                          } else if (company.tax_comp!.contains(
                                              '80 G (for 50% tax benefits)')) {
                                            company.tax_comp!.remove(
                                                '80 G (for 50% tax benefits)');
                                          }
                                          setState(() {
                                            firstcheck = value;
                                          });
                                        }),
                                    Text(
                                      '80 G (for 50% tax benefits)',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        value: secondcheck,
                                        onChanged: (value) {
                                          if (value == true) {
                                            company.tax_comp!.add(
                                                '35 AC (for 100% tax benefits)');
                                          } else if (company.tax_comp!.contains(
                                              '35 AC (for 100% tax benefits)')) {
                                            company.tax_comp!.remove(
                                                '35 AC (for 100% tax benefits)');
                                          }
                                          setState(() {
                                            secondcheck = value;
                                          });
                                        }),
                                    Text(
                                      '35 AC (for 100% tax benefits)',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        value: thirdcheck,
                                        onChanged: (value) {
                                          if (value == true) {
                                            company.tax_comp!.add(
                                                '12 AA (Tax exemption for Ngo income)');
                                          } else if (company.tax_comp!.contains(
                                              '12 AA (Tax exemption for Ngo income)')) {
                                            company.tax_comp!.remove(
                                                '12 AA (Tax exemption for Ngo income)');
                                          }
                                          setState(() {
                                            thirdcheck = value;
                                          });
                                        }),
                                    Container(
                                      width: 250,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          '12 AA (Tax exemption for Ngo income)',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        value: fourthcheck,
                                        onChanged: (value) {
                                          setState(() {
                                            fourthcheck = value;
                                          });
                                          if (value == true) {
                                            company.tax_comp!.add(
                                                'FCRA(Eligible for international funding)');
                                          } else if (company.tax_comp!.contains(
                                              'FCRA(Eligible for international funding)')) {
                                            company.tax_comp!.remove(
                                                'FCRA(Eligible for international funding)');
                                          }
                                        }),
                                    Container(
                                      width: 250,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'FCRA(Eligible for international funding)',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Company Registration Certificate",
                            style: TextStyle(
                                color: primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        if (company.registration_certificate != null)
                          ListTile(
                            title: Text(
                                '${company.registration_certificate!.path.split('/').last}'),
                            subtitle: Text(
                                '${company.registration_certificate!.lengthSync()} bytes, ${company.registration_certificate!.path.split('/').last.split('.').last} format'),
                            trailing: Icon(Icons.file_present),
                            onTap: () {
                              // Open or read the file using its path
                              // File pickedFile = File();
                              // Do something with pickedFile
                            },
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(primary)),
                            child: Text('Upload file'),
                            onPressed: () async {
                              pick_company_certificate();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  'Communication Person of the Company',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: TextEditingController(
                                  text: company.cp_name,
                                ),
                                onChanged: (value) {
                                  company.cp_name = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText:
                                        'Enter Name of the communication person',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: TextEditingController(
                                  text: company.cp_email,
                                ),
                                onChanged: (value) {
                                  company.cp_email = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Email ',
                                    prefixIcon: Icon(Icons.email),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText:
                                        'Enter email of communicatoin person',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: TextEditingController(
                                  text: company.cp_phone,
                                ),
                                onChanged: (value) {
                                  company.cp_phone = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText: 'Phone no.',
                                    prefixIcon: Icon(Icons.phone),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: 'Phone Number',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: TextFormField(
                                textDirection: TextDirection.ltr,
                                // keyboardType: widget.keyboardType,
                                // inputFormatters: widget.inputFormatters,
                                controller: TextEditingController(
                                  text: company.cp_designation,
                                ),
                                onChanged: (value) {
                                  company.cp_designation = value;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.9,
                                            color: Colors.black54)),
                                    labelText:
                                        'Designation of the communication person',
                                    prefixIcon: Icon(Icons.picture_in_picture),
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText:
                                        'Enter Designation of the communication person',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Card(
                elevation: 0.5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(primary)),
                      onPressed: () {
                        print(company.company_name);
                        AddCompanayProfile();
                        if (company.company_logo != null) postCompanyLogo();
                        if (company.registration_certificate != null) postCompanyCertificate();
                      },
                      child: Text("Save"))),
            ],
          ),
        ),
      ),
    );
  }
}
