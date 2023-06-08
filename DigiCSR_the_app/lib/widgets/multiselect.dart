import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class MultiSelect extends StatefulWidget{
  List<MultiSelectItem<String>> _items;
  List<String> _selectedOptions;
  MultiSelect(this._items,this._selectedOptions);
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiSelectDialogField<String>(
                            title: Text('Select Options'),
                            items: widget._items,
                            initialValue: widget._selectedOptions,
                            onConfirm: (values) {
                              setState(() {
                                widget._selectedOptions = values;
                              });
                            },
                          );
  }
}