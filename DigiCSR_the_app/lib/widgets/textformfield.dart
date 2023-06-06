import 'package:flutter/material.dart';
import 'package:digicsr/users/companyuser.dart';

Widget TextFormFieldButton ({String ?Text1 ,String ? Text2,setState,keyboardType,inputFormatters,controller})
{
  return
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(
                Text1!,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                controller: TextEditingController(text: controller),
                onChanged: (value) {
                  setState(() {
                    // Update the variable when the input changes
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: Text2,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),

    ],
  );
    

}
