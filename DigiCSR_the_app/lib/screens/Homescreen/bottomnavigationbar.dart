import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List sliderlist = [
    "assets/images/quotes1.jpg",
    "assets/images/quotes2.jpg",
    "assets/images/quotes3.jpg",
    "assets/images/quotes4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 150,
            enlargeCenterPage: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Image.asset(
                sliderlist[index],
                fit: BoxFit.fill,
              )
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .margin(const EdgeInsets.symmetric(horizontal: 8))
                  .make();
            }),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          height: 200,
          color: Colors.amber,
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
               
                
                Row(
                  children: [
                     SizedBox(width: 10,),
                
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blue,
                      
                      child: Image.asset("assets/images/ngopage.png",width: 60,fit: BoxFit.fill,)),
                        SizedBox(width: 20,),
                      Text("Name Of NGO",style: TextStyle(fontSize: 25),),
                  ],
                ),
              ),
              Text("Story Title",style: TextStyle(fontSize: 20),),
            ],
          ),
        )
      ],
    ));
  }
}
