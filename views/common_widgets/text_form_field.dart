import 'package:flutter/material.dart';


Widget TextFormFieldButton ({String ?Text1 ,String ? Text2,setState,keyboardType,inputFormatters,prefixIcons})
{
  return
Column(    children: [
  Padding(
    padding: const EdgeInsets.only(right: 15,left: 10),
    child: TextFormField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                      
                          labelText: Text1,
                          hintText: Text2, //hint text
                          prefixIcon: prefixIcons,//prefix iocn
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ), //hint text style
                          labelStyle: TextStyle(
                              fontSize: 16, color: Colors.grey), //label style
                        ),
                        keyboardType: keyboardType,
                        inputFormatters: inputFormatters,
                        
                        ),
  )
],

);
}
