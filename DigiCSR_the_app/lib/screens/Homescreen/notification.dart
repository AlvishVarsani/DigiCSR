import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/services/notificatio_services.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import '../../models/NotificationModel.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Future<List<NotificationModel>> NGOnotifications;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  NGOnotifications = notifyNGO();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',style: TextStyle(color: black,),),
        backgroundColor: white,
        foregroundColor: black,
        shadowColor: black,
      ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: NGOnotifications,
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
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
                          Text(
                            '${snapshot.data![index].content}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data![index].read}',
                            style: TextStyle(color: Colors.red),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  //  width: 50,
                                  //  height: 50,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.black,
                                          backgroundColor: Colors.white,
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      onPressed: () {},
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: black),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  //  width: 50,
                                  //  height: 50,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.black,
                                          backgroundColor: Colors.white,
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      onPressed: () {},
                                      child: Text('Mark as Read',
                                          style: TextStyle(color: black))),
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
                });
          } else if (snapshot.hasData) {
            return Text('${snapshot.error}');
          } else {
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                child: const CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            );
          }
        }),
        bottomNavigationBar: CustomBottomNavBar(ngonav),
        );
  }
}
