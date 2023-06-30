// import 'dart:convert';
// import 'dart:io';

// import 'package:digicsr/screens/company/CompanyProfile.dart';
// import 'package:digicsr/services/company_profile_services.dart';
// import 'package:digicsr/widgets/appbar.dart';
// import 'package:digicsr/widgets/bottomnavigationbar.dart';
// import 'package:digicsr/widgets/multiselect.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';

// import '../../constants/constants.dart';
// import '../../widgets/textformfield.dart';

// class ProfileScreenForCompany extends StatefulWidget {
//   const ProfileScreenForCompany({super.key});

//   @override
//   State<ProfileScreenForCompany> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreenForCompany> {
//   @override
//   void setState(VoidCallback fn) {
//     // TODO: implement setState
//     super.setState(fn);
//   }

//   void save() async {
//     var formdata = FormData.fromMap(
//       {
//         'company_name': company.company_name,
//         'summary': company.summary,
//         'city': company.company_city,
//         'state': company.company_state,
//         'pincode': company.pincode,
//         'establishment_year': company.establishment_year.toString(),
//         'cp_name': company.cp_name,
//         'cp_email': company.cp_email,
//         'cp_designation': company.cp_designation,
//         'cp_phone': company.cp_phone,
//         'tax_comp': company.tax_comp,
//         'sectors': company.sectors
//       },
//     );
//     try {
//       var token = await fetchCompanyToken();
//       print(token.toString());
//       // var resp = await http.post(Uri.parse('http://192.168.114.94:4000/company/add-profile/:id'),
//       var dio = Dio();
//       var response = await dio.post(ipInfo + '/company/add-profile',
//           data: formdata,
//           options: Options(
//             headers: {
//               'Context-Type': 'application/json;charSet=UTF-8',
//               'authorization': token.toString()
//             },
//           ));
//       if (response.statusCode == 200) {
//         print('Upload successful');
//       } else {
//         print('Upload failed');
//       }

//       // var resp = await http.post(
//       //   Uri.parse(ipInfo + '/company/add-profile'),
//       //   headers: {
//       //     'Context-Type': 'application/json;charSet=UTF-8',
//       //     'authorization': token.toString()
//       //   },
//       //   body: {
//       //     'company_name': company.company_name,
//       //     'summary': company.summary,
//       //     'city': company.company_city,
//       //     'state': company.company_state,
//       //     'pincode': company.pincode,
//       //     'establishment_year': company.establishment_year.toString(),
//       //     'cp_name': company.cp_name,
//       //     'cp_email': company.cp_email,
//       //     'cp_designation': company.cp_designation,
//       //     'cp_phone': company.cp_phone,
//       //     'tax_comp': jsonEncode(company.tax_comp!),
//       //     'sectors': jsonEncode(company.sectors!)
//       //   },
//       // );
//       // print(resp.body);
//     } on Exception catch (e) {
//       print(e);
//     }
//   }

//   String countryValue = '';
//   String? stateValue = '';
//   String? cityValue = '';
//   List<String> _selectedOptions = [];
//   final _items = [
//     MultiSelectItem<String>('Rural Development', "Rural Development"),
//     MultiSelectItem<String>('Encouraging Sports', "Encouraging Sports"),
//     MultiSelectItem<String>('Clean Ganga Fund', "Clean Ganga Fund"),
//     MultiSelectItem<String>('Swachh Bharat', "Swachh Bharat"),
//     MultiSelectItem<String>('Health & Sanitation', "Health & Sanitation"),
//     MultiSelectItem<String>('Education, Differently Abled, Livelihood',
//         "Education, Differently Abled, Livelihood"),
//     MultiSelectItem<String>(
//         'Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities',
//         "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
//     MultiSelectItem<String>(
//         'Environment, Animal Welfare, Conservation of Resources',
//         "Environment, Animal Welfare, Conservation of Resources"),
//     MultiSelectItem<String>('Slum Development', "Slum Development"),
//     MultiSelectItem<String>(
//         'Heritage Art And Culture', "Heritage Art And Culture"),
//     MultiSelectItem<String>('Prime Minister National Relief Funds',
//         "Prime Minister National Relief Funds"),
//     MultiSelectItem<String>('others', "others"),
//   ];



//   Future<void> _saveFile() async {
//     // Check if a file is picked
//     if (company.registration_certificate != null) {
//       // Create a file object from picked file path
//       File pickedFile = File(company.registration_certificate!.path!);

//       // Get app's documents directory
//       Directory directory = await getApplicationDocumentsDirectory();

//       // Copy picked file to documents directory with a new name
//       File savedFile =
//           await pickedFile.copy('${directory.path}/${company.registration_certificate!.name}');

//       // Update state with saved file
//       setState(() {
//         company.certificate = savedFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: CustomAppBar(context),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                     backgroundColor: Colors.blue, fixedSize: Size(300, 42)),
//                 child: Text(
//                   'COMPANY INFORMATION',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.white),
//                 ),
//               ),
//               TextFormFieldButton("Company Name",
//                   Text2: "Enter Full Name Of Company",
//                   controller: company.company_name),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormFieldButton(
//                 "Year Of Establishment",
//                 Text2: "yyyy",
//                 controller: company.establishment_year,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(4),
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//               ),
//               TextFormFieldButton(
//                 "Pincode",
//                 Text2: "Enter Pincode",
//                 controller: company.pincode,
//                 inputFormatters: [
//                   // LengthLimitingTextInputFormatter(4),
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormFieldButton(
//                 "Company Summery",
//                 Text2: 'Enter text',
//                 controller: company.summary,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(100),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Location of the Company',
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               // CSCPicker(
//               //   onCountryChanged: (country) {
//               //     company.company_country = country;
//               //     setState(() {
//               //       countryValue = country;
//               //     });
//               //   },
//               //   onStateChanged: (state) {
//               //     company.company_state = state;
//               //     setState(() {
//               //       stateValue = state;
//               //     });
//               //   },
//               //   onCityChanged: (city) {
//               //     company.company_city = city;
//               //     setState(() {
//               //       cityValue = city;
//               //     });
//               //   },
//               // ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                     backgroundColor: Colors.blue, fixedSize: Size(550, 42)),
//                 child: Text(
//                   'Communication Person of the Company',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.white),
//                 ),
//               ),
//               TextFormFieldButton("Name",
//                   Text2: 'Enter Name of the communication person',
//                   controller: company.cp_name),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormFieldButton("Email",
//                   Text2: 'Enter email of communicatoin person',
//                   controller: company.cp_email),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormFieldButton(
//                 'Phone No.',
//                 Text2: 'Phone Number',
//                 controller: company.cp_phone,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(10),
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormFieldButton('Designation of the communication person',
//                   Text2: 'Enter Designation of the communication person',
//                   controller: company.cp_designation),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Sector  to provide CSR",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 5,
//               ),

//               Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(1.0),
//                   child: MultiSelect(_items,'sectors')
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Taxes included for RFP",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(1.0),
//                   child: MultiSelect(_items,'tax_comp'),
//                 ),
//               ),

//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Company Registration Certificate",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               if (company.registration_certificate != null)
//               ListTile(
//                 title: Text(company.registration_certificate!.name),
//                 subtitle:
//                     Text('${company.registration_certificate!.size} bytes, ${company.registration_certificate!.extension} format'),
//                 trailing: Icon(Icons.file_present),
//                 onTap: () {
//                   // Open or read the file using its path
//                   // File pickedFile = File();
//                   // Do something with pickedFile
//                 },
//               ),
//               ElevatedButton(
//                 child: Text('Upload file'),
//                 onPressed: pick_company_certificate,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Center(
//                   child: ElevatedButton(
//                       onPressed: () {
//                         // print(company.sectors);
//                         AddCompanayProfile();
//                       },
//                       child: Text("Save")))
//             ],
//           ),
//         ),
//       ),
//       // bottomNavigationBar: CustomBottomNavBar(companynav),
//     );
//   }
// }

import 'package:csc_picker/csc_picker.dart';
import 'package:digicsr/services/company_profile_services.dart';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  // List<String> _selectedOptions = [];
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
        company.registration_certificate = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue,
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
                                color: Colors.blue,
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
                          height: 15,
                        ),
                        TextFormFieldButton(
                          "Company Name",
                          Text2: "Enter Full Name Of Company",
                          controller: company.company_name,
                          prefixIcons: Icon(Icons.group_outlined),

                          // icons: FaIcon(FontAwesomeIcons.buildingCircleCheck)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldButton(
                          " Email ",
                          Text2: 'Enter email of company',
                          controller: company.company_email,
                          prefixIcons: Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldButton(
                          "Year Of Establishment",
                          Text2: "yyyy",
                          controller: company.establishment_year,
                          prefixIcons: Icon(Icons.date_range),
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
                          "Company Summery",
                          Text2: 'Enter text',
                          controller: company.summary,
                          prefixIcons: Icon(Icons.picture_in_picture_rounded),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(100),
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: CSCPicker(
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldButton(
                          "Pincode",
                          Text2: 'Enter Pincode',
                          controller: company.pincode,
                          prefixIcons: Icon(Icons.picture_in_picture_rounded),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(100),
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: MultiSelectDialogField<String>(
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
                            initialValue: company.sectors!,
                            onConfirm: (values) {
                              setState(() {
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
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
                                        onChanged: (bool? value) {
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
                                        onChanged: (bool? value) {
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
                                        onChanged: (bool? value) {
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
                                        onChanged: (bool? value) {
                                          if (value == true) {
                                            company.tax_comp!.add(
                                                'FCRA(Eligible for international funding)');
                                          } else if (company.tax_comp!.contains(
                                              'FCRA(Eligible for international funding)')) {
                                            company.tax_comp!.remove(
                                                'FCRA(Eligible for international funding)');
                                          }
                                          setState(() {
                                            fourthcheck = value;
                                          });
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        if (company.registration_certificate != null)
                          ListTile(
                            title: Text(company.registration_certificate!.name),
                            subtitle: Text(
                                '${company.registration_certificate!.size} bytes, ${company.registration_certificate!.extension} format'),
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
                                color: Colors.blue,
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
                        TextFormFieldButton(
                          "Name",
                          Text2: 'Enter Name of the communication person',
                          controller: company.cp_name,
                          prefixIcons: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldButton(
                          "Email",
                          Text2: 'Enter email of communicatoin person',
                          controller: company.cp_email,
                          prefixIcons: Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldButton(
                          'Phone No.',
                          Text2: 'Phone Number',
                          controller: company.cp_phone,
                          prefixIcons: Icon(Icons.phone),
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
                          'Designation of the communication person',
                          Text2:
                              'Enter Designation of the communication person',
                          controller: company.cp_designation,
                          prefixIcons: Icon(Icons.picture_in_picture),
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
                      onPressed: () {
                        print(company.company_name);
                        AddCompanayProfile();
                      },
                      child: Text("Save"))),
            ],
          ),
        ),
      ),
    );
  }
}
