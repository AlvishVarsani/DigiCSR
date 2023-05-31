

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/styles.dart';


Widget ourButton({onPress,color,textColor,String ?title,icons,textStyle})
{
  return ElevatedButton.icon(onPressed: onPress, icon: icons, label: title!.text.color(textColor).fontFamily(bold).make(),
    style:
    
     ElevatedButton.styleFrom(
    shadowColor: Colors.black,elevation: 20,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      
      backgroundColor: color,
      padding: const EdgeInsets.all(10),
      
    
      fixedSize: Size(250,50),
      
    ),
    
       );
}