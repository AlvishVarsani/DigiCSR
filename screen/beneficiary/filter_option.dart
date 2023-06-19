
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../views/common_widgets/text_form_field.dart';

class FiterOption extends StatefulWidget {
  const FiterOption({super.key});

  @override
  State<FiterOption> createState() => _FiterOptionState();
}

class _FiterOptionState extends State<FiterOption> {
   TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _items = [
    MultiSelectItem<String>('Option 1', "Rural Development"),
    MultiSelectItem<String>('Option 2', "Encouraging Sports"),
    MultiSelectItem<String>('Option 3', "Clean Ganga Fund"),
    MultiSelectItem<String>('Option 4', "Swachh Bharat"),
    MultiSelectItem<String>('Option 5', "Health & Sanitation"),
    MultiSelectItem<String>(
        'Option 6', "Education, Differently Abled, Livelihood"),
    MultiSelectItem<String>('Option 7',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>(
        'Option 8', "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Option 9', "Slum Development"),
    MultiSelectItem<String>('Option 10', "Heritage Art And Culture"),
    MultiSelectItem<String>(
        'Option 11', "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('Option 12', "others"),
  ];

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text('Add member'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            TextFormFieldButton(Text1: 'Name',Text2: 'Enter the name of member'),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            String name = nameController.text;
            String phone = phoneController.text;
            String email = emailController.text;

            // Perform further actions with the entered details
            // For example, you can print the values to the console
            print('Name: $name');
            print('Phone Number: $phone');
            print('Email: $email');

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

