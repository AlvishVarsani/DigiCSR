import 'dart:io';

import 'package:digicsr/constants/DataLoaders.dart';
import 'package:digicsr/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../services/ngo_profile_services.dart';

class NgoDetails extends StatefulWidget {
  @override
  State<NgoDetails> createState() => _NgoDetailsState();
}

class _NgoDetailsState extends State<NgoDetails> {
  //Company _company;
  @override
  Widget build(BuildContext context) {
      Future<void> pick_ngo_logo() async {
    // Clear previous files
    setState(() {
      ngo.ngo_logo = null;
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
        ngo.ngo_logo = File(result.files.single.path!);
        print('Logo Picked');
      });
    }
  }
    // TODO: implement build
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints){
          double h = constraints.maxHeight;
          double w = constraints.maxWidth;
          return Container(
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
                                  'Ngo Details',
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
                      padding: EdgeInsets.only(right: 6,left: 6,top: 5,bottom: 5),
                      child: LayoutBuilder(
                        builder: (context, constraints) => 
                        Column(
                          children: [
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
                                SizedBox(height: 10,),
                                Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: 
                                    (!editmode)?
                                    Container(
                                      // width: (100 < w*0.35)?100:w*0.35,
                                      height: (180 < constraints.maxHeight*0.18)?180:constraints.maxHeight*0.18,
                                      // child: Image.asset('assets/images/yashu.jpg',fit: BoxFit.fill),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage('${ngodata.ngo_logo_path}'),
                                          alignment: Alignment.center
                                          ),
                                        border: Border.all(color: Colors.transparent),
                                        borderRadius: BorderRadius.all(Radius.circular(6))
                                      ),
                                    ):
                                    TextButton(
                                      onPressed: ()async{
                                        await pick_ngo_logo();
                                      },
                                      style: ButtonStyle(
                                        maximumSize: MaterialStatePropertyAll(Size(constraints.maxWidth*0.48,constraints.maxHeight*0.12)),
                                      ),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage('${ngodata.ngo_logo_path}'),
                                        // foregroundColor: Color(0x30FFFFFF),
                                        child: Center(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Color(0x80a0a0a0),
                                            ),
                                            
                                            
                                            child: Icon(Icons.person,color: black,size: 40,)),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 25,),
                                  
                                  Container(
                                    // width: w*0.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Text('Summary',style: TextStyle(fontSize: 14),),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text('${ngodata.summmary}',style: TextStyle(fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              child: Divider(color: Colors.black45,thickness: 0.8,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ngo Name',
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
                                      text: '${ngodata.ngo_name}'),
                                      onChanged: (value){
                                        ngodata.ngo_name = value;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.only(bottom: 0,left: 4,right: 4,top: 0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: (editmode)?
                                          BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black26
                                          ):BorderSide(color: Colors.transparent),
                                        )
                                      ),
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
                              child: (editmode)?null:Center(child: Divider(color: Colors.black45,thickness: 0.8,)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ngo Email',
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
                                      text: '${ngodata.email}'),
                                      onChanged: (value){
                                        ngodata.email = value;
                                      },
                                      decoration: InputDecoration(
                                         contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.only(bottom: 0,left: 4,right: 4,top: 0),
                                        //contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.all(4),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: (editmode)?
                                          BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black26
                                          ):BorderSide(color: Colors.transparent),
                                        )
                                      ),
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
                              child: (editmode)?null:Center(child: Divider(color: Colors.black45,thickness: 0.8,)),
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
                                SizedBox(height: 6,),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(text:'${ngodata.establishment_year}'),
                                  onChanged: (value){
                                        ngodata.establishment_year = int.parse(value);
                                      },
                                  decoration: InputDecoration(
                                     contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.only(bottom: 0,left: 4,right: 4,top: 0),
                                   // contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.all(4),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: (editmode)?
                                          BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black26
                                          ):BorderSide(color: Colors.transparent),
                                        )
                                      ),
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
                              child: (editmode)?null:Divider(color: Colors.black45,thickness: 0.8,),
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
                                SizedBox(height: 6,),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller:
                                      TextEditingController(text: '${ngodata.state}'),
                                      onChanged: (value){
                                        ngodata.state = value;
                                      },
                                      decoration: InputDecoration(
                                         contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.only(bottom: 0,left: 4,right: 4,top: 0),
                                       // contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.all(4),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: (editmode)?
                                          BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black26
                                          ):BorderSide(color: Colors.transparent),
                                        )
                                      ),
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
                              child: (editmode)?null:Divider(color: Colors.black45,thickness: 0.8,),
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
                                SizedBox(height: 6,),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller:
                                      TextEditingController(text: '${ngodata.city}'),
                                      onChanged: (value){
                                        ngodata.city = value;
                                      },
                                      decoration: InputDecoration(
                                         contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.only(bottom: 0,left: 4,right: 4,top: 0),
                                       // contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.all(4),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: (editmode)?
                                          BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black26
                                          ):BorderSide(color: Colors.transparent),
                                        )
                                      ),
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
                              child: (editmode)?null:Divider(color: Colors.black45,thickness: 0.8,),
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
                                SizedBox(height: 6,),
                                TextField(
                                  readOnly: !editmode,
                                  scrollPadding: EdgeInsets.all(0),
                                  controller: TextEditingController(text: '${ngodata.pincode}'),
                                  onChanged: (value){
                                        ngodata.pincode = value;
                                      },
                                  decoration: InputDecoration(
                                     contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.only(bottom: 0,left: 4,right: 4,top: 0),
                                    //contentPadding: (editmode)?EdgeInsets.all(12):EdgeInsets.all(4),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: (editmode)?
                                          BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black26
                                          ):BorderSide(color: Colors.transparent),
                                        )
                                      ),
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
                              child: (editmode)?null:Divider(color: Colors.black45,thickness: 0.8,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Area of Operation',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Myriad Pro'),
                                ),
                                SizedBox(height: 6,),
                                Container(
                                  // height: h * 0.5,
                                  width: w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: 
                                  (!editmode)?
                                  ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: ngodata.operation_areas!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${ngodata.operation_areas![index]}',
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
                            child: MultiSelectDialogField(
                              buttonText: Text(
                                'Areas of Operation',
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
                              items: Indianstates,
                              checkColor: primary,
                              initialValue: ngodata.operation_areas!,
                              onConfirm: (values) {
                                setState(() {
                                   ngodata.operation_areas = values;
                                });
                              },
                            ),
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
                                SizedBox(height: 6,),
                                Container(
                                  // height: h * 0.5,
                                  width: w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: 
                                  (!editmode)?
                                  ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: ngodata.sectors!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                       '${ngodata.sectors![index]}',
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
                              initialValue: ngodata.sectors!,
                              onConfirm: (values) {
                                setState(() {
                                  ngodata.sectors = values;
                                });
                              },
                            ),
                          ),
                                ),
                              ],
                            ),
                            (editmode)?
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextButton(
                                onPressed: ()async{
                                  editmode = false;
                                  ngo.updatedata(ngodata);
                                  ngo.operation_areas = ["Gujarat"];
                                  ngo.sectors = ["Swachh Bharat"];
                                  try {
                                    await AddNgoProfile();
                                    if (ngo.ngo_logo != null) postNgoLogo();
                                    var snackBar = SnackBar(
                                    backgroundColor: primary,
                                    padding: EdgeInsets.only(bottom: 20,top: 20),content: Text('Profile Updated!',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),));
                                   await getNgoDetails();
                                   await ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                   Navigator.pop(context);
                                  } catch (e) {
                                    var snackBar = SnackBar(
                                    backgroundColor: primary,
                                    padding: EdgeInsets.only(bottom: 20,top: 20),content: Text('Can not update profile!',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),));
                                   await getNgoDetails();
                                   await ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                   Navigator.pop(context);
                                  }
                                }, 
                                child: Text('Save',style: TextStyle(color: white,fontSize: 20),),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(primary),
                                  minimumSize: MaterialStatePropertyAll(Size(100, 15)),
                                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10
                                      )),
                                      side: BorderSide(color: primary,width: 1.1)
                                    )
                                  )
                                ),
                                ),
                            )
                              :
                              SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
  }
      ),
    );
  }
}