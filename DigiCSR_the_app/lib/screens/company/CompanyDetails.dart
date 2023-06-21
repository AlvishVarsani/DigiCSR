import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/CompanyModel.dart';
import 'package:digicsr/widgets/multiselect.dart';
import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  Company _company;
  CompanyDetails(this._company);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Material(
      child: Container(
        color: primary,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: (){
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(
                                  text: '${_company.company_name}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Email',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(
                                  text: '${_company.email}'),
                              style: TextStyle(
                                  fontSize: 24,
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
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Establichment Year',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(text: '${_company.establishment_year}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'State',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller:
                                  TextEditingController(text: '${_company.state}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller:
                                  TextEditingController(text: '${_company.city}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pincode',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            TextField(
                              readOnly: true,
                              scrollPadding: EdgeInsets.all(0),
                              controller: TextEditingController(text: '${_company.pincode}'),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Taxes',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              // height: h * 0.5,
                              width: w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: ListView.builder(
                                itemCount: _company.tax_comp!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _company.tax_comp![index],
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
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sectors',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myriad Pro'),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              // height: h * 0.5,
                              width: w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: ListView.builder(
                                itemCount: _company.sectors!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${_company.sectors![index]}',
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
