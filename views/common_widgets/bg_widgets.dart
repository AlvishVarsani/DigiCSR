

import 'package:flutter/material.dart';

Widget bgWidget({ Widget? child})
{
  return Container(
    decoration: const BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/background.png"),fit: BoxFit.fill )),
    child: child,
  );
  
}