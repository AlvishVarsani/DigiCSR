import 'package:digicsr/models/NotificationModel.dart';
import 'package:digicsr/services/notificatio_services.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class NotificationsSecondScreen extends StatelessWidget {
  NotificationModel notification;
  NotificationsSecondScreen(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    notification.read = true;

    void readnotification()async{
      await updateNotification(notification.notificationID!);
    }

    readnotification();
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 1,color:Colors.grey ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Image.asset(
                  "assets/app_icon/digicsr_app_icon.png",
                  width: 30,
                  fit: BoxFit.fill,
                )),
            title: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '${notification.content}',
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 3,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${notification.read}',
                    style: TextStyle(color: Colors.red),
                  ),
                  // Use LayoutBuilder to get the parent widget size
                  LayoutBuilder(builder: (context, constraints) {
                    // Use Flexible or Expanded to make the buttons responsive
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: () async{
                                  
                                  try {
                              await deleteNotification('${notification.notificationID}');
                              var snackBar = SnackBar(
                                backgroundColor: primary,
                                padding: EdgeInsets.only(bottom: 20,top: 20),content: Text('Notification deleted!',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),));
                               await ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               Allnotifications = await notify();
                               Navigator.pop(context);
                               
                            } catch (e) {
                              var snackBar = SnackBar(
                                backgroundColor: secondary,
                                padding: EdgeInsets.only(bottom: 20,top: 20),content: Text('${e}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                                },
                                child: Text('Delete',
                                    style: TextStyle(color: black)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: () {},
                                child: Text('Mark as Read',
                                    style: TextStyle(color: black)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),

                  Text(
                    "1 min ago",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
      // body: FutureBuilder(
      //     future: NGOnotifications,
      //     builder: (context, snapshot) {
      //       // Use MediaQuery to get the screen size
      //       final screenSize = MediaQuery.of(context).size;
      //       if (snapshot.hasData) {
      //         print('has data');

      //       } else if (snapshot.hasError) {
      //         return Text('${snapshot.error}');
      //       } else {
      //         return Center(
      //           child: Container(
      //             // Use screenSize to adjust the size of the widget
      //             height: screenSize.width * 0.15,
      //             width: screenSize.width * 0.15,
      //             child: const CircularProgressIndicator(
      //               strokeWidth: 1,
      //             ),
      //           ),
      //         );
      //       }
      //     }),

      // bottomNavigationBar: CustomBottomNavBar(ngonav),
    );
  }
}
