// import 'package:flutter/material.dart';

// import '../../widgets/textformfield.dart';

// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => _MyDialogState();
// }

// class _MyDialogState extends State<MyDialog> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add member'),
//       content: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             TextFormFieldButton('Name',Text2: 'Enter the name of member'),
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             TextField(
//               controller: phoneController,
//               decoration: InputDecoration(
//                 labelText: 'Phone Number',
//               ),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: Text('Cancel'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: Text('Save'),
//           onPressed: () {
//             String name = nameController.text;
//             String phone = phoneController.text;
//             String email = emailController.text;

//             // Perform further actions with the entered details
//             // For example, you can print the values to the console
//             print('Name: $name');
//             print('Phone Number: $phone');
//             print('Email: $email');

//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/ngo_profile_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/BoardMember.dart';
import '../../widgets/radoi_button.dart';
import 'BoardMemberDetails.dart';

class BoradMembers extends StatelessWidget {
  //Company _company;
  //CompanyDetails(this._company);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
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
                            onPressed: () {
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
                                  'Borad Members Details',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Gotham'),
                                ),
                              ],
                            ),
                          ))),
                  Stack(children: [
                    Container(
                      width: w,
                      height: constraints.maxHeight * 0.88,
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          border: Border.all(color: Colors.transparent)),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                            right: 6, left: 6, top: 5, bottom: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: constraints.maxHeight * 0.6,
                              child: ListView.builder(
                                  itemCount: ngodata.boardmemberslist!.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          child: Icon(Icons.person),
                                        ),
                                        title: Text(
                                            "${ngodata.boardmemberslist![index].bm_name}"),
                                        trailing: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BoardMemberDetails(
                                                              ngodata.boardmemberslist![
                                                                  index])));
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 18,
                                            )),
                                        //trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(primary)),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          insetPadding: EdgeInsets.only(
                                              right: 15, left: 15),
                                          content: Card(
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.transparent),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            elevation: 0.5,
                                            child: Container(
                                              // height: h * 0.6,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            color: primary,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15))),
                                                        child: ListTile(
                                                          title: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Center(
                                                                child: Text(
                                                                  "BoardMember",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                right: 3,
                                                                child:
                                                                    TextButton(
                                                                  child: Icon(
                                                                    Icons
                                                                        .cancel_rounded,
                                                                    color:
                                                                        white,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    // TextFormFieldButton(
                                                    //   "Member Name",
                                                    //   Text2: "Enter  Name Of Board",
                                                    //   controller: board_member.bm_name,
                                                    //   prefixIcons: Icon(Icons.person),
                                                    // ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15,
                                                                  left: 10),
                                                          child: TextFormField(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            // keyboardType: widget.keyboardType,
                                                            // inputFormatters: widget.inputFormatters,
                                                            controller:
                                                                TextEditingController(
                                                                    text: board_member
                                                                        .bm_name),
                                                            onChanged: (value) {
                                                              board_member
                                                                      .bm_name =
                                                                  value;
                                                            },
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            0.9,
                                                                        color: Colors
                                                                            .black54)),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .red)),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(style: BorderStyle.solid, width: 0.9, color: Colors.black54)),
                                                                labelText: 'Enter  Name Of Board',
                                                                prefixIcon: Icon(Icons.person),
                                                                hintStyle: TextStyle(fontSize: 16),
                                                                hintText: 'Enter  Name Of Board',
                                                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.blue))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                        width: w,
                                                        child:
                                                            addRadioButton()),
                                                    // TextFormFieldButton(
                                                    //   "DIN",
                                                    //   Text2: "Enter DIN Number",
                                                    //   controller: board_member.bm_phone,
                                                    //   prefixIcons: Icon(Icons.numbers),
                                                    //   keyboardType: TextInputType.number,
                                                    //   inputFormatters: [
                                                    //     FilteringTextInputFormatter.digitsOnly
                                                    //   ],
                                                    // ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15,
                                                                  left: 10),
                                                          child: TextFormField(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            controller:
                                                                TextEditingController(
                                                                    text: board_member
                                                                        .bm_din),
                                                            onChanged: (value) {
                                                              board_member
                                                                      .bm_din =
                                                                  value;
                                                            },
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            0.9,
                                                                        color: Colors
                                                                            .black54)),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .red)),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(style: BorderStyle.solid, width: 0.9, color: Colors.black54)),
                                                                labelText: 'DIN',
                                                                prefixIcon: Icon(Icons.numbers),
                                                                hintStyle: TextStyle(fontSize: 16),
                                                                hintText: 'Enter DIN Number',
                                                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.blue))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    // TextFormFieldButton(
                                                    //   "Designation",
                                                    //   Text2: 'Enter Designation',
                                                    //   controller: board_member.bm_designation,
                                                    //   prefixIcons: Icon(Icons.work),
                                                    //   inputFormatters: [
                                                    //     LengthLimitingTextInputFormatter(100),
                                                    //   ],
                                                    // ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15,
                                                                  left: 10),
                                                          child: TextFormField(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            // keyboardType: widget.keyboardType,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  100),
                                                            ],
                                                            controller: TextEditingController(
                                                                text: board_member
                                                                    .bm_designation),
                                                            onChanged: (value) {
                                                              board_member
                                                                      .bm_designation =
                                                                  value;
                                                            },
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            0.9,
                                                                        color: Colors
                                                                            .black54)),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .red)),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(style: BorderStyle.solid, width: 0.9, color: Colors.black54)),
                                                                labelText: 'Designation',
                                                                prefixIcon: Icon(Icons.work),
                                                                hintStyle: TextStyle(fontSize: 16),
                                                                hintText: 'Enter Designation',
                                                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.blue))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    // TextFormFieldButton(
                                                    //   "Phone no.",
                                                    //   Text2: "Enter the Phone no.",
                                                    //   controller: board_member.bm_phone,
                                                    //   prefixIcons: Icon(Icons.phone),
                                                    //   keyboardType: TextInputType.number,
                                                    //   inputFormatters: [
                                                    //     LengthLimitingTextInputFormatter(10),
                                                    //     FilteringTextInputFormatter.digitsOnly
                                                    //   ],
                                                    // ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15,
                                                                  left: 10),
                                                          child: TextFormField(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  10),
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            controller:
                                                                TextEditingController(
                                                                    text: board_member
                                                                        .bm_phone),
                                                            onChanged: (value) {
                                                              board_member
                                                                      .bm_phone =
                                                                  value;
                                                            },
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            0.9,
                                                                        color: Colors
                                                                            .black54)),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .red)),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide: BorderSide(style: BorderStyle.solid, width: 0.9, color: Colors.black54)),
                                                                labelText: 'Phone no.',
                                                                prefixIcon: Icon(Icons.phone),
                                                                hintStyle: TextStyle(fontSize: 16),
                                                                hintText: 'Enter the Phone no.',
                                                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.blue))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Center(
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        primary)),
                                                            onPressed: () {
                                                              // ngo.board_members!.add(board_member);
                                                              List<BoardMember>
                                                                  temp = ngo.boardmemberslist!;
                                                              temp.add(
                                                                  board_member);
                                                              ngo.board_members =
                                                                  temp;
                                                              if (ngo.board_members ==
                                                                  null)
                                                                print(
                                                                    'No boardmembers');
                                                                  ngo.updatedata(ngodata);
                                                              AddNgoProfile();
                                                            },
                                                            child: Text(
                                                                "Add")))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Text("Add Member"))))
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
