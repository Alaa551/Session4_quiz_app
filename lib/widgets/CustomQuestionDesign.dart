
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/listTileRadioModel.dart';
import 'package:quiz_app/widgets/CustomListTileRadio.dart';

class CustomQuestionDesign extends StatefulWidget {
   String questionTitle;
  List<CustomListTileRadio> customListTileRadio;
  CustomQuestionDesign({required this.questionTitle, required this.customListTileRadio});

  @override
  State<CustomQuestionDesign> createState() => _CustomQuestionDesignState();
}

class _CustomQuestionDesignState extends State<CustomQuestionDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(.9),

      ),
      child: Column(
        children: [
          Text(
            widget.questionTitle,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          widget.customListTileRadio[0],
          widget.customListTileRadio[1],
          widget.customListTileRadio[2],
          widget.customListTileRadio[3],


        ],
      ),

    );
  }
}
