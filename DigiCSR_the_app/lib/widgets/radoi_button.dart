import 'package:flutter/material.dart';

import '../constants/constants.dart';

// List gender=["Male","Female","Other"];

  // String select='';

 class addRadioButton extends StatefulWidget{
  @override
  State<addRadioButton> createState() => _addRadioButtonState();
}

class _addRadioButtonState extends State<addRadioButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    male = 'unselected';
    female = 'unselected';
    other = 'unselected';
  }
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Row(
        children: [
          Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Radio(
           // activeColor: Theme.of(context).primaryColor,
           activeColor: Colors.blue,
           
            value: male,
            groupValue: 'male',
            onChanged: (value){
              setState(() {
                print(value);
                male = 'male';
                board_member.bm_gender = male;
                female = 'unselected';
                other = 'unselected';
              });
            },
          ),
          Text('Male')
      ],
    ),
          Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Radio(
           // activeColor: Theme.of(context).primaryColor,
           activeColor: Colors.blue,
           
            value: female,
            groupValue: 'female',
            onChanged: (value){
              setState(() {
                print(value);
                male = 'unselected';
                female = 'female';
                board_member.bm_gender = female;
                other = 'unselected';
                
              });
            },
          ),
          Text('Female')
      ],
    ),
          Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Radio(
           // activeColor: Theme.of(context).primaryColor,
           activeColor: Colors.blue,
           
            value: other,
            groupValue: 'others',
            onChanged: (value){
              setState(() {
                print(value);
                male = 'unselected';
                female = 'unselected';
                other = 'others';
                board_member.bm_gender = other;
              });
            },
          ),
          Text('Others')
      ],
    ),
    
        ],
      ),
    );
  }
}