import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFormFieldButton extends StatefulWidget {
  String Text1;
  String? Text2;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  String? controller;
  Icon? prefixIcons;

  TextFormFieldButton(this.Text1,
      {Text2, keyboardType, inputFormatters, controller, prefixIcons});

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
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: TextFormField(
            textDirection: TextDirection.ltr,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            controller: TextEditingController(text: widget.controller),
            onChanged: (value) {
              widget.controller = value;
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                labelText: widget.Text1,
                prefixIcon: widget.prefixIcons,
                hintStyle: TextStyle(fontSize: 16),
                hintText: widget.Text2,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue))),
          ),
        ),
      ],
    );
  }
}
