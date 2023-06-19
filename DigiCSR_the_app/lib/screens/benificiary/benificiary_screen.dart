import 'package:flutter/material.dart';

class BeneficiaryHomeScreen extends StatefulWidget {
  const BeneficiaryHomeScreen({super.key});

  @override
  State<BeneficiaryHomeScreen> createState() => _BeneficiaryHomeScreenState();
}

class _BeneficiaryHomeScreenState extends State<BeneficiaryHomeScreen> {
String  context1 ="swdefr ert  ertggrfedwq 2w3e4rtg";
bool isvisible10=false;
bool isvisible11=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(//backgroundColor: Color.fromARGB(97, 243, 247, 249),
          body:Column(
            children: [
Container(
                  alignment: Alignment.center,
                  height: 60,
                  color:Color.fromARGB(77, 138, 199, 233).withOpacity(0.5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      filled: true,
                      fillColor:Colors.white,
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
                    
                    //   Color.fromARGB(98, 145, 200, 231),
                     
                    Padding(
                      
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                        
                          shadowColor: Colors.blue,
                          color: Color.fromARGB(77, 138, 199, 233).withOpacity(0.5),
                          elevation: 5,
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        "assets/images/earth.png",
                                        width: 60,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                    SizedBox(width: 10,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Internauts Infotech",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "Location",
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                          
                              ListTile(
                                leading: Icon(Icons.location_city,color: Colors.black,),
                                title: Text("Area of Operation :",style: TextStyle(fontSize: 18),),
                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isvisible10 = !isvisible10;
                                                    });
                                                  },
                                                  icon: Icon(Icons.keyboard_arrow_down)),
                              ),
                        
                              Visibility(
                                visible: isvisible10,
                                child: Card(
                                  color: Color.fromARGB(77, 232, 234, 235).withOpacity(0.6),
                                  
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                          
                                      // Text("Area Of Opration:",style: TextStyle(fontSize: 18),),
                                      SizedBox(height: 5,),
                                       Text("1) Gujarat",style: TextStyle(color: Colors.black),),
                                                   SizedBox(height: 5,),
                                                   Text("2) Haryana"),
                                                    SizedBox(height: 5,),
                                                   Text("3) Himachal Pradesh"),
                                                    SizedBox(height: 5,),
                                                   Text("4) Jammu and Kashmir "),
                                                      SizedBox(height: 5,),
                                                   Text("5) Maharashtra"),
                                    ],),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.security,color: Colors.black,),
                                title: Text("Sector :",style: TextStyle(fontSize: 18),),
                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isvisible11 = !isvisible11;
                                                    });
                                                  },
                                                  icon: Icon(Icons.keyboard_arrow_down)),
                              ),
                        
                              Visibility(
                                visible: isvisible11,
                                child: Card(
                                  color: Color.fromARGB(77, 232, 234, 235).withOpacity(0.6),
                                  
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          
                                    Text("1) Rural Development"),
                                     SizedBox(height: 3,),
                                     Text("2) Encouraging Sports"),
                                      SizedBox(height: 3,),
                                     Text("3) Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
                                      SizedBox(height: 3,),
                                     Text("4) Sport Development"),
                                        SizedBox(height: 3,),
                                     Text("5) Environment, Animal Welfare, Conservation of Resources"),
                                    ],),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.currency_rupee,color: Colors.black,),
                                title: Text("Money : 10510505410.00",style: TextStyle(fontSize: 18),),
                               
                              ),
                             
                         
                            ],
                          ),
                        ),
                      ),
                       Padding(
                      
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                        
                          shadowColor: Colors.blue,
                          color: Color.fromARGB(77, 138, 199, 233).withOpacity(0.5),
                          elevation: 5,
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        "assets/images/earth.png",
                                        width: 60,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                    SizedBox(width: 10,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Internauts Infotech",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "Location",
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                          
                              ListTile(
                                leading: Icon(Icons.location_city,color: Colors.black,),
                                title: Text("Area of Operation :",style: TextStyle(fontSize: 18),),
                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isvisible10 = !isvisible10;
                                                    });
                                                  },
                                                  icon: Icon(Icons.keyboard_arrow_down)),
                              ),
                        
                              Visibility(
                                visible: isvisible10,
                                child: Card(
                                  color: Color.fromARGB(77, 232, 234, 235).withOpacity(0.6),
                                  
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                          
                                      // Text("Area Of Opration:",style: TextStyle(fontSize: 18),),
                                      SizedBox(height: 5,),
                                       Text("1) Gujarat",style: TextStyle(color: Colors.black),),
                                                   SizedBox(height: 5,),
                                                   Text("2) Haryana"),
                                                    SizedBox(height: 5,),
                                                   Text("3) Himachal Pradesh"),
                                                    SizedBox(height: 5,),
                                                   Text("4) Jammu and Kashmir "),
                                                      SizedBox(height: 5,),
                                                   Text("5) Maharashtra"),
                                    ],),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.security,color: Colors.black,),
                                title: Text("Sector :",style: TextStyle(fontSize: 18),),
                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isvisible11 = !isvisible11;
                                                    });
                                                  },
                                                  icon: Icon(Icons.keyboard_arrow_down)),
                              ),
                        
                              Visibility(
                                visible: isvisible11,
                                child: Card(
                                  color: Color.fromARGB(77, 232, 234, 235).withOpacity(0.6),
                                  
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          
                                    Text("1) Rural Development"),
                                     SizedBox(height: 3,),
                                     Text("2) Encouraging Sports"),
                                      SizedBox(height: 3,),
                                     Text("3) Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
                                      SizedBox(height: 3,),
                                     Text("4) Sport Development"),
                                        SizedBox(height: 3,),
                                     Text("5) Environment, Animal Welfare, Conservation of Resources"),
                                    ],),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.currency_rupee,color: Colors.black,),
                                title: Text("Money : 10510505410.00",style: TextStyle(fontSize: 18),),
                               
                              ),
                             
                         
                            ],
                          ),
                        ),
                      ),
                       Padding(
                      
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                        
                          shadowColor: Colors.blue,
                          color: Color.fromARGB(77, 138, 199, 233).withOpacity(0.5),
                          elevation: 5,
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        "assets/images/earth.png",
                                        width: 60,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                    SizedBox(width: 10,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Internauts Infotech",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "Location",
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                          
                              ListTile(
                                leading: Icon(Icons.location_city,color: Colors.black,),
                                title: Text("Area of Operation :",style: TextStyle(fontSize: 18),),
                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isvisible10 = !isvisible10;
                                                    });
                                                  },
                                                  icon: Icon(Icons.keyboard_arrow_down)),
                              ),
                        
                              Visibility(
                                visible: isvisible10,
                                child: Card(
                                  color: Color.fromARGB(77, 232, 234, 235).withOpacity(0.6),
                                  
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                          
                                      // Text("Area Of Opration:",style: TextStyle(fontSize: 18),),
                                      SizedBox(height: 5,),
                                       Text("1) Gujarat",style: TextStyle(color: Colors.black),),
                                                   SizedBox(height: 5,),
                                                   Text("2) Haryana"),
                                                    SizedBox(height: 5,),
                                                   Text("3) Himachal Pradesh"),
                                                    SizedBox(height: 5,),
                                                   Text("4) Jammu and Kashmir "),
                                                      SizedBox(height: 5,),
                                                   Text("5) Maharashtra"),
                                    ],),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.security,color: Colors.black,),
                                title: Text("Sector :",style: TextStyle(fontSize: 18),),
                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isvisible11 = !isvisible11;
                                                    });
                                                  },
                                                  icon: Icon(Icons.keyboard_arrow_down)),
                              ),
                        
                              Visibility(
                                visible: isvisible11,
                                child: Card(
                                  color: Color.fromARGB(77, 232, 234, 235).withOpacity(0.6),
                                  
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          
                                    Text("1) Rural Development"),
                                     SizedBox(height: 3,),
                                     Text("2) Encouraging Sports"),
                                      SizedBox(height: 3,),
                                     Text("3) Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
                                      SizedBox(height: 3,),
                                     Text("4) Sport Development"),
                                        SizedBox(height: 3,),
                                     Text("5) Environment, Animal Welfare, Conservation of Resources"),
                                    ],),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.currency_rupee,color: Colors.black,),
                                title: Text("Money : 10510505410.00",style: TextStyle(fontSize: 18),),
                               
                              ),
                             
                         
                            ],
                          ),
                        ),
                      ),
                       
                      
                    ],
                  ),
                ),
              ),
            ],
          ),



         
          ),
    );

    
  }
}