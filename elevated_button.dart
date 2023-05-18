

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/styles.dart';


Widget ourButton({onPress,color,textColor,String ?title,icons,textStyle})
{
  return ElevatedButton.icon(onPressed: onPress, icon: icons, label: title!.text.color(textColor).fontFamily(bold).make(),
    style:
    
     ElevatedButton.styleFrom(
      
      
      backgroundColor: color,
      padding: const EdgeInsets.all(10),
      
    
      fixedSize: Size(250,50),
      
    ),
    
       );
}