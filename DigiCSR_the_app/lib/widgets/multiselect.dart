import 'package:digicsr/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class MultiSelect extends StatefulWidget{
  List<MultiSelectItem<String>> _items;
  String listname;
  
  MultiSelect(this._items,this.listname);
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}
List<String> _selectedOptions = [];
class _MultiSelectState extends State<MultiSelect> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiSelectDialogField<String>(
                            title: Text('Select Options'),
                            items: widget._items,
                            initialValue: _selectedOptions,
                            onConfirm: (values) {
                              setState(() {
                                multilist = true;
                                if(widget.listname == 'tax_comp'){
                                  company.tax_comp = values;
                                }else if(widget.listname == 'sectors'){
                                  company.sectors = values;
                                }
                                _selectedOptions = values;
                              });
                            },
                          );
  }
}