import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldButton extends StatefulWidget {
  String Text1;
  String? Text2;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  String? controller;

  TextFormFieldButton(this.Text1,
      {Text2, keyboardType, inputFormatters, controller});

  @override
  State<TextFormFieldButton> createState() => _TextFormFieldButtonState();
}

class _TextFormFieldButtonState extends State<TextFormFieldButton> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.Text1,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          textDirection: TextDirection.ltr,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          controller: TextEditingController(text: widget.controller),
          onChanged: (value) {
            widget.controller = value;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: widget.Text2,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
        ),
      ],
    );
  }
}
