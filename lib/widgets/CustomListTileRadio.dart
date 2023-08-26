

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/listTileRadioModel.dart';

class CustomListTileRadio extends StatefulWidget {
 final ListTileRadioModel listTileRadioModel;

  CustomListTileRadio({ required this.listTileRadioModel});


  @override
  State<CustomListTileRadio> createState() => _CustomListTileRadioState();
}

class _CustomListTileRadioState extends State<CustomListTileRadio> {

  @override
  Widget build(BuildContext context) {
    return   RadioListTile(
      title: Text(widget.listTileRadioModel.title,style: TextStyle(fontSize: 20),),
      value: widget.listTileRadioModel.value,
      groupValue: widget.listTileRadioModel.groupValue,
      onChanged: (value){
        setState(() {
         widget.listTileRadioModel.onChanged(value!);
        });
      },
    );
  }
}
