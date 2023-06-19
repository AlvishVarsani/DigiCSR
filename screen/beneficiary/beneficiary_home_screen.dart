import 'package:digi_csr/screen/beneficiary/filter_option.dart';
import 'package:digi_csr/views/common_widgets/bg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class BeneficiaryHomeScreen extends StatefulWidget {
  const BeneficiaryHomeScreen({super.key});

  @override
  State<BeneficiaryHomeScreen> createState() => _BeneficiaryHomeScreenState();
}

class _BeneficiaryHomeScreenState extends State<BeneficiaryHomeScreen> {
  String context1 = "swdefr ert  ertggrfedwq 2w3e4rtg";
  bool isvisible10 = false;
  bool isvisible11 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: bgWidget(
        child: Scaffold(
          //backgroundColor: Color.fromARGB(97, 243, 247, 249),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                color: Color.fromARGB(77, 138, 199, 233).withOpacity(0.5),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(onPressed: (){showDialog(context: context, builder: (BuildContext context) {
                      return FiterOption();
                    });}, icon: Icon(Icons.filter_alt)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search Anything",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    child: ListTile(
                                      title: Center(
                                        child: Text(
                                          "Name of Ngo",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  title: Text("Email@gmail.com"),
                                ),
                      
                                ListTile(
                                  leading: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  title: Text("9658544478"),
                                ),
                      
                                ListTile(
                                  leading: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  title: Text("Rajkot,Gujarat,558541"),
                                ),
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("More details"))),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    child: ListTile(
                                      title: Center(
                                        child: Text(
                                          "Name of Ngo",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  title: Text("Email@gmail.com"),
                                ),
                      
                                ListTile(
                                  leading: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  title: Text("9658544478"),
                                ),
                      
                                ListTile(
                                  leading: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  title: Text("Rajkot,Gujarat,558541"),
                                ),
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("More details"))),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    child: ListTile(
                                      title: Center(
                                        child: Text(
                                          "Name of Ngo",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  title: Text("Email@gmail.com"),
                                ),
                      
                                ListTile(
                                  leading: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  title: Text("9658544478"),
                                ),
                      
                                ListTile(
                                  leading: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  title: Text("Rajkot,Gujarat,558541"),
                                ),
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("More details"))),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
