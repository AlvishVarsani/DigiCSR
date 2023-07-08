import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../constants/constants.dart';
import '../../models/Media.dart';
import '../../services/media_services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';

class MediaPosts extends StatefulWidget{
  @override
  State<MediaPosts> createState() => _MediaPostsState();
}

class _MediaPostsState extends State<MediaPosts> {

    String content =
      "In Flutter, if you are wondering is there any way to work with English words or where to find any library that works with English words the search ends here. There is a library named english_words that contains at most 5000 used English words with some utility functions. It’s useful in applications like dictionaries or teaching-related apps. In this article, we will be learning about it and seeing its usage. In the future, the author of this package might add more functionalities to it";

  late Future<List<Media>> posts;
  var imgsrc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts = getMediaPosts();
  }

  String postimage(String htmlcontent){
    var document = parse(htmlcontent);
    var imgElement = document.querySelector('img');
    imgsrc = imgElement!.attributes['src'];
    print(imgsrc);
    return imgsrc;
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: posts,
            builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      shadowColor: blueglass,
                      elevation: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: 
                                Image.network(snapshot.data![index].author_logo!)
                                ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].author_name}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "${snapshot.data![index].createdDate!.substring(0,10)}",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(postimage(snapshot.data![index].content!)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].title}",
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
                              data: snapshot.data![index].content,
                              
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
                  );
                }),
              );
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return Center(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            child: const CircularProgressIndicator(
              strokeWidth: 1,
            ),
          ),
                );
          }),
        ),
      ),
    );
  }
}