import 'package:digicsr/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../services/reviews.dart';




class ReviewNGO extends StatefulWidget{
  @override
  State<ReviewNGO> createState() => _ReviewNGOState();
}

class _ReviewNGOState extends State<ReviewNGO> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    itemSize: 35,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      reviewNgo.rating = int.parse("${rating}");
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: TextEditingController(text: reviewNgo.review),
                    onChanged: (value) {
                      reviewNgo.review = value;
                    },
                    style: TextStyle(fontFamily: 'Montserrat'),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 15, bottom: 15, left: 10),
                      hintText: 'Enter Review for Ngo',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        try {
                          // await Review();
                          var snackBar = SnackBar(
                              backgroundColor: primary,
                              padding: EdgeInsets.only(bottom: 20, top: 20),
                              content: Text(
                                'Review Submitted!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ));
                          await ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                          // Navigator.pop(context);
                        } catch (e) {
                          print(e);
                          var snackBar = SnackBar(
                              backgroundColor: primary,
                              padding: EdgeInsets.only(bottom: 20, top: 20),
                              content: Text(
                                'Unable to submit review!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ));
                          await ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                          // Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'))
                ],
              ),
            ),
        ),);
  }
}