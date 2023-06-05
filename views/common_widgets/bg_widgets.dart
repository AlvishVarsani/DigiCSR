


import 'package:flutter/cupertino.dart';

Widget bgWidget({ Widget? child})
{
  return Container(
    decoration: const BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/donting_images.avif'),fit: BoxFit.fill )),
    child: child,
  );
  
}