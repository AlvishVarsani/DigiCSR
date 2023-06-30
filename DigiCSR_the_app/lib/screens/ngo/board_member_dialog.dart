import 'package:flutter/material.dart';

import '../../widgets/textformfield.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add member'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormFieldButton('Name',Text2: 'Enter the name of member'),
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