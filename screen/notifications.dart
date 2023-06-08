import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        
        ListView.builder(
           itemCount: 2,
           itemBuilder: (BuildContext context, int index) {
             return ListTile(
               leading: CircleAvatar(
                   radius: 20,
                   backgroundColor: Colors.blue,
                   child: Image.asset(
                     "assets/images/ngopage.png",
                     width: 30,
                     fit: BoxFit.fill,
                   )),
               title: Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       "A new RFP is avilable in your operation area . Title:Clean india .Amount:100000000,Sector:Helath and Sanitization",
                       style: TextStyle(
                         fontSize: 18,
                       ),
                       textAlign: TextAlign.justify,
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       "Status :Not Readed",
                       style: TextStyle(color: Colors.red),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Container(
                             width: 50,
                             height: 50,
                             child: ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                     shadowColor: Colors.black,
                                     backgroundColor: Colors.white,
                                     elevation: 20,
                                     shape: RoundedRectangleBorder(
                                         borderRadius:
                                             BorderRadius.circular(15))),
                                 onPressed: () {},
                                 child:
                                     Image.asset("assets/images/delete.png")),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Container(
                             width: 50,
                             height: 50,
                             child: ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                     shadowColor: Colors.black,
                                     backgroundColor: Colors.white,
                                     elevation: 20,
                                     shape: RoundedRectangleBorder(
                                         borderRadius:
                                             BorderRadius.circular(15))),
                                 onPressed: () {},
                                 child: Image.asset(
                                   "assets/images/right.png",
                                   width: 80,
                                   height: 60,
                                 )),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 15,
                     )
                   ],
                 ),
               ),
             );
           })
        
        
        
      ),
    );
  }
}
