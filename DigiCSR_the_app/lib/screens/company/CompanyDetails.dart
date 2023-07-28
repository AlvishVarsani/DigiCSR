import 'dart:io';

import 'package:digicsr/constants/DataLoaders.dart';
import 'package:digicsr/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../services/company_profile_services.dart';

class CompanyDetails extends StatefulWidget {
  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
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
  
    // TODO: implement build
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
            double h = constraints.maxHeight;
    double w = constraints.maxWidth;
        return Container(
          color: primary,
          child: Stack(
            children: [
              Column(children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            editmode = false;
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Company Details',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Gotham'),
                              ),
                            ],
                          ),
                        ))),
                Container(
                  width: w,
                  height: h * 0.88,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      border: Border.all(color: Colors.transparent)),
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.only(right: 6, left: 6, top: 5, bottom: 5),
                    child: LayoutBuilder(
                      builder: (context, constraints) => Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Info',
                            //   style: TextStyle(
                            //       fontSize: 20,
                            //       color: black,
                            //       fontWeight: FontWeight.w400,
                            //       fontFamily: 'Myriad Pro'),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: (!editmode)
                                        ? Container(
                                            width: w*0.6,
                                            height: (180 <
                                                    constraints.maxHeight * 0.18)
                                                ? 180
                                                : constraints.maxHeight * 0.18,
                                            // child: Image.asset('assets/images/yashu.jpg',fit: BoxFit.fill),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                    image: NetworkImage(
                                                        '${companydata.cmp_logo_path}'),
                                                    alignment: Alignment.center),
                                                border: Border.all(
                                                    color: Colors.transparent),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          )
                                        : TextButton(
                                            onPressed: () async {
                                              await pick_company_logo();
                                            },
                                            style: ButtonStyle(
                                              maximumSize:
                                                  MaterialStatePropertyAll(Size(
                                                      constraints.maxWidth * 0.48,
                                                      constraints.maxHeight *
                                                          0.12)),
                                            ),
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundImage: NetworkImage(
                                                  '${companydata.cmp_logo_path}'),
                                              // foregroundColor: Color(0x30FFFFFF),
                                              child: Center(
                                                child: Container(
                                                    width: 120,
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color: Color(0x80a0a0a0),
                                                    ),
                                                    child: Icon(
                                                      Icons.camera_alt_rounded,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 60,
                                                          color:
                                                              Color(0xFa404040),
                                                          // offset: Offset(15, 15)
                                                        )
                                                      ],
                                                      color: white,
                                                      size: 40,
                                                    )),
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    // width: w*0.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text('Summary',style: TextStyle(fontSize: 14),),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            '${companydata.summary}',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: Divider(
                                color: Colors.black45,
                                thickness: 0.8,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Company Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                // SizedBox(height: 6,),
                                TextField(
                                  textAlignVertical: TextAlignVertical.top,
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(
                                      text: '${companydata.company_name}'),
                                  onChanged: (value) {
                                    companydata.company_name = value;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: (editmode)
                                          ? EdgeInsets.all(12)
                                          : EdgeInsets.only(
                                              bottom: 0,
                                              left: 4,
                                              right: 4,
                                              top: 0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (editmode)
                                            ? BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.black26)
                                            : BorderSide(
                                                color: Colors.transparent),
                                      )),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: (editmode)
                                  ? null
                                  : Center(
                                      child: Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Company Email',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                // SizedBox(height: 6,),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(
                                      text: '${companydata.email}'),
                                  onChanged: (value) {
                                    companydata.email = value;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: (editmode)
                                          ? EdgeInsets.all(12)
                                          : EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (editmode)
                                            ? BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.black26)
                                            : BorderSide(
                                                color: Colors.transparent),
                                      )),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       'Company Contact No.',
                            //       style: TextStyle(
                            //           fontSize: 20,
                            //           color: black,
                            //           fontWeight: FontWeight.w400,
                            //           fontFamily: 'Myriad Pro'),
                            //     ),
                            //     TextField(
                            //       readOnly: true,
                            //       scrollPadding: EdgeInsets.all(0),
                            //       controller:
                            //           TextEditingController(text: '9999008787'),
                            //       style: TextStyle(
                            //           fontSize: 24,
                            //           color: black,
                            //           fontWeight: FontWeight.w400,
                            //           fontFamily: 'Myriad Pro'),
                            //     )
                            //   ],
                            // ),
                            SizedBox(
                              height: 20,
                              child: (editmode)
                                  ? null
                                  : Center(
                                      child: Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Establichment Year',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(
                                      text: '${companydata.establishment_year}'),
                                  onChanged: (value) {
                                    companydata.establishment_year =
                                        int.parse(value);
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: (editmode)
                                          ? EdgeInsets.all(12)
                                          : EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (editmode)
                                            ? BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.black26)
                                            : BorderSide(
                                                color: Colors.transparent),
                                      )),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: (editmode)
                                  ? null
                                  : Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(
                                      text: '${companydata.state}'),
                                  onChanged: (value) {
                                    companydata.state = value;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: (editmode)
                                          ? EdgeInsets.all(12)
                                          : EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (editmode)
                                            ? BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.black26)
                                            : BorderSide(
                                                color: Colors.transparent),
                                      )),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: (editmode)
                                  ? null
                                  : Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'City',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(
                                      text: '${companydata.city}'),
                                  onChanged: (value) {
                                    companydata.city = value;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: (editmode)
                                          ? EdgeInsets.all(12)
                                          : EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (editmode)
                                            ? BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.black26)
                                            : BorderSide(
                                                color: Colors.transparent),
                                      )),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: (editmode)
                                  ? null
                                  : Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pincode',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(
                                      text: '${companydata.pincode}'),
                                  onChanged: (value) {
                                    companydata.pincode = value;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: (editmode)
                                          ? EdgeInsets.all(0)
                                          : EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: (editmode)
                                            ? BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.black26)
                                            : BorderSide(
                                                color: Colors.transparent),
                                      )),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: (editmode)
                                  ? null
                                  : Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Taxes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  // height: h * 0.5,
                                  width: w,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: 
                                  (!editmode)?
                                  ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: companydata.tax_comp!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          companydata.tax_comp![index],
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22,
                                              fontFamily: 'Myriad Pro'),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                  ):
                                  Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Checkbox(
                                              value: (companydata.tax_comp!.contains(
                                                    '80 G (for 50% tax benefits)'))?
                                                    firstcheck=true : firstcheck=false,
                                              onChanged: (value) {
                                                if (value == true) {
                                                  companydata.tax_comp!.add(
                                                      '80 G (for 50% tax benefits)');
                                                } else if (companydata.tax_comp!.contains(
                                                    '80 G (for 50% tax benefits)')) {
                                                  companydata.tax_comp!.remove(
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
                                              value: (companydata.tax_comp!.contains(
                                                    '35 AC (for 100% tax benefits)'))?
                                                    secondcheck=true : secondcheck=false,
                                              onChanged: (value) {
                                                if (value == true) {
                                                  companydata.tax_comp!.add(
                                                      '35 AC (for 100% tax benefits)');
                                                } else if (companydata.tax_comp!.contains(
                                                    '35 AC (for 100% tax benefits)')) {
                                                  companydata.tax_comp!.remove(
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
                                              value: (companydata.tax_comp!.contains(
                                                    '12 AA (Tax exemption for Ngo income)'))?
                                                    thirdcheck=true:thirdcheck=false,
                                              onChanged: (value) {
                                                if (value == true) {
                                                  companydata.tax_comp!.add(
                                                      '12 AA (Tax exemption for Ngo income)');
                                                } else if (companydata.tax_comp!.contains(
                                                    '12 AA (Tax exemption for Ngo income)')) {
                                                  companydata.tax_comp!.remove(
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
                                              value: (companydata.tax_comp!.contains(
                                                    'FCRA(Eligible for international funding)'))?
                                                    fourthcheck=true:fourthcheck=false,
                                              onChanged: (value) {
                                                setState(() {
                                                  fourthcheck = value;
                                                });
                                                if (value == true) {
                                                  companydata.tax_comp!.add(
                                                      'FCRA(Eligible for international funding)');
                                                } else if (companydata.tax_comp!.contains(
                                                    'FCRA(Eligible for international funding)')) {
                                                  companydata.tax_comp!.remove(
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
                                  )
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sectors',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  // height: h * 0.5,
                                  alignment: Alignment.center,
                                  width: w,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: 
                                  (!editmode)?
                                  ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: companydata.sectors!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${companydata.sectors![index]}',
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22,
                                              fontFamily: 'Myriad Pro'),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                  ):
                                  Padding(
                            padding: const EdgeInsets.all(20),
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
                              items: sectoroptions,
                              checkColor: primary,
                              initialValue: companydata.sectors!,
                              onConfirm: (values) {
                                setState(() {
                                  companydata.sectors = values;
                                });
                              },
                            ),
                          )
                                ),
                              ],
                            ),
                            (editmode)
                                ? Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () async {
                                          editmode = false;
                                          company.updatedata(companydata);
                                          try {
                                            await AddCompanayProfile();
                                            if (company.company_logo != null)
                                              await postCompanyLogo();
                                            var snackBar = SnackBar(
                                                backgroundColor: primary,
                                                padding: EdgeInsets.only(
                                                    bottom: 20, top: 20),
                                                content: Text(
                                                  'Profile Updated!',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ));
                                            await getCompanyDetails();
                                            await ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            Navigator.pop(context);
                                          } catch (e) {
                                            await getCompanyDetails();
                                            var snackBar = SnackBar(
                                                backgroundColor: primary,
                                                padding: EdgeInsets.only(
                                                    bottom: 20, top: 20),
                                                content: Text(
                                                  'Can not update profile!',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ));
                                            await ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              color: white, fontSize: 20),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(primary),
                                            minimumSize: MaterialStatePropertyAll(
                                                Size(100, 15)),
                                            shape: MaterialStatePropertyAll<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(10)),
                                                    side: BorderSide(
                                                        color: primary,
                                                        width: 1.1)))),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ]),
                    ),
                  ),
                )
              ]),
            ],
          ),
        );
   } ),
    );
  }
}
