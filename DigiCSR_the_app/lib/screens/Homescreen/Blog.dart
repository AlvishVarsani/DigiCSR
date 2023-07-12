import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/Media.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Blog extends StatelessWidget{
  Media blog;
  Blog(this.blog);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: white,
      child: SafeArea(
        child: Padding(
                        padding: const EdgeInsets.only(top: 6,bottom: 6),
                        child: Card(
                          // shadowColor: blueglass,
                          elevation: 20,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                    CircleAvatar(
                                        radius: 25,
                                        // backgroundColor: Colors.white,
                                        backgroundImage: AssetImage('assets/app_icon/digicsr_app_icon.png'),
                                        // child: 
                                        // Image.asset('assets/app_icondigicsr_app_icon.png'),
                                        // Image.network(snapshot.data![index].author_logo!)
                                        ),
                                        SizedBox(
                                        width: 20,
                                      ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${blog.author_name}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "${blog.createdDate!.substring(0,10)}",
                                            style: TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${blog.title}",
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 280,
                                    child: 
                                    Html(
                                      shrinkWrap: true,
                                      data: blog.content,
                                       customImageRenders: {
                                       
                                       },
                                      ),
                                    // ReadMoreText(
                                    //   content,
                                    //   trimLines: 3,
                                    //   textAlign: TextAlign.justify,
                                    //   trimMode: TrimMode.Line,
                                    //   trimCollapsedText: "  read more",
                                    //   trimExpandedText: "  show less",
                                    //   lessStyle: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.blue),
                                    //   moreStyle: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.blue),
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
      ),
    );
  }
}