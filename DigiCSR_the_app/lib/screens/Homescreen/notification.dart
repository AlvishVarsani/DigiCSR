import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/notifications_second_screen.dart';
import 'package:digicsr/services/notificatio_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/DataLoaders.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Color readed = Colors.amber;
  Color unreaded = Colors.grey;
  bool ColorUnreaded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNotifications();
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
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Mark "),
              ),
              PopupMenuItem(
                child: Text("Delete all"),
                onTap: () async {
                  await deleteAll(await Allnotifications!);
                  setState(() {});
                },
              ),
              PopupMenuItem(
                onTap: () async {
                  await markAllRead(await Allnotifications!);
                  setState(() {});
                },
                child: Text("Mark all read"),
              ),
            ],
          ),
        ],
        backgroundColor: white,
        foregroundColor: black,
        shadowColor: black,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) => (Allnotifications == null)
            ? Center(
                child: Text(
                'No Notifications!',
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ))
            : FutureBuilder(
                future: Future(() => Allnotifications),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RefreshIndicator(
                      color: primary,
                      onRefresh: () async {
                        try {
                          Allnotifications = await notify();
                        } on Exception catch (e) {
                          // TODO
                          print(e);
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: constraints.maxHeight,
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              DateTime originalDateTime = DateTime.parse(
                                  snapshot.data![index].timestamp!);

                              DateTime currentDateTime = DateTime.now();

                              Duration difference =
                                  currentDateTime.difference(originalDateTime);
                              String differenceString;
                              if (difference.inDays >= 1) {
                                differenceString =
                                    '${difference.inDays} day(s) ago';
                              } else {
                                differenceString =
                                    '${difference.inHours}h ${difference.inMinutes.remainder(60)}m ago';
                              }

                              DateTime updatedDateTime = originalDateTime
                                  .add(Duration(hours: 5, minutes: 30));
                              String updatedTimestampString =
                                  DateFormat("yyyy-MM-dd HH:mm:ss")
                                      .format(updatedDateTime);

                              return InkWell(
                                onLongPress: () {
                                  snapshot.data![index].read = true;
                                  setState(() {});
                                },
                                onTap: () async {
                                 await Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return NotificationsSecondScreen(
                                        snapshot.data![index]);
                                  }));
                                  setState(() {});
                                },
                                child: Card(
                                  color:  white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    title: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              '${snapshot.data![index].content}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontWeight: 
                                                (snapshot.data![index].read == false)?
                                                FontWeight.bold:
                                                FontWeight.normal
                                                ,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            differenceString,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return Center(
                      child: Container(
                        // Use screenSize to adjust the size of the widget
                        height: constraints.maxHeight * 0.06,
                        width: constraints.maxWidth * 0.1,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  }
                }),
      ),

      // bottomNavigationBar: CustomBottomNavBar(ngonav),
    );
  }
}
