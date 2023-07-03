import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/notifications_second_screen.dart';
import 'package:digicsr/services/notificatio_services.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import '../../models/NotificationModel.dart';
import '../ngo/NgoDetailsToOthers.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NGOnotifications = notify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: black,
          ),
        ),
        backgroundColor: white,
        foregroundColor: black,
        shadowColor: black,
      ),
     
      body: FutureBuilder(
          future: NGOnotifications,
          builder: (context, snapshot) {
            // Use MediaQuery to get the screen size
            final screenSize = MediaQuery.of(context).size;
            if (snapshot.hasData) {
              print('has data');
              return ListView.builder(
                
                physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                 
                    return Stack(
                      children:[ InkWell(
                        onTap: 
                        (){  Navigator.push(context, MaterialPageRoute(builder: (context) {return NotificationsSecondScreen(snapshot.data![index]);}));},
                       
                        child: Card(
                          //color: Color.fromARGB(255, 133, 194, 245),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1,color:Colors.grey ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          
                          child: ListTile(
                            
                            leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.blue,
                                    child: Image.asset(
                                      "assets/app_icon/digicsr_app_icon.png",
                                      width: 30,
                                      fit: BoxFit.fill,
                                    )),
                              ],
                            ),
                              
                            title: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      '${snapshot.data![index].content}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Text(
                                  //   '${snapshot.data![index].read}',
                                  //   style: TextStyle(color: Colors.red),
                                  // ),
                                  // Use LayoutBuilder to get the parent widget size
                                  // LayoutBuilder(builder: (context, constraints) {
                                  //   // Use Flexible or Expanded to make the buttons responsive
                                  //   return Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceEvenly,
                                  //     children: [
                                  //       Flexible(
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.all(5.0),
                                  //           child: Container(
                                  //             child: ElevatedButton(
                                  //               style: ElevatedButton.styleFrom(
                                  //                   shadowColor: Colors.black,
                                  //                   backgroundColor: Colors.white,
                                  //                   elevation: 2,
                                  //                   shape:
                                  //                       RoundedRectangleBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(15),
                                  //                   )),
                                  //               onPressed: () {},
                                  //               child: Text('Delete',
                                  //                   style:
                                  //                       TextStyle(color: black)),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       Flexible(
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.all(5.0),
                                  //           child: Container(
                                  //             child: ElevatedButton(
                                  //               style: ElevatedButton.styleFrom(
                                  //                   shadowColor: Colors.black,
                                  //                   backgroundColor: Colors.green,
                                  //                   elevation: 2,
                                  //                   shape:
                                  //                       RoundedRectangleBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(15),
                                  //                   )),
                                  //               onPressed: () {},
                                  //               child: Text('Mark as Read',
                                  //                   style:
                                  //                       TextStyle(color: black)),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   );
                                  // }),
                                
                                  Positioned(child: 
                                  Text("1 min ago",style: TextStyle(color: Colors.grey,fontSize: 14 ),)
                                  ),
                                  SizedBox(height:5 ,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      ]
                     
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Center(
                child: Container(
                  // Use screenSize to adjust the size of the widget
                  height: screenSize.width * 0.15,
                  width: screenSize.width * 0.15,
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              );
            }
          }),

      // bottomNavigationBar: CustomBottomNavBar(ngonav),
    );
  }
}
