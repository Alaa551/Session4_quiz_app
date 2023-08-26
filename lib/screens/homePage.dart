

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/listTileRadioModel.dart';
import 'package:quiz_app/widgets/CustomListTileRadio.dart';
import '../core/customSnackBar.dart';
import '../widgets/CustomQuestionDesign.dart';

class HomePage extends StatefulWidget {

  static final String id= "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static  int questionOneGroupValue=0 ;
  static  int questionTwoGroupValue=0 ;
  static  int questionThreeGroupValue=0 ;
  int grade=0;
  List<int> answers=[1,2,3];
  checkAnswers(){
    if(questionOneGroupValue==answers[0])
      grade++;
    if(questionTwoGroupValue==answers[1])
      grade++;
    if(questionThreeGroupValue==answers[2])
      grade++;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/quiz.jpg"),
                fit: BoxFit.cover,

            ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: const Text(
                    "Answer All quiz questions",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                       color: Colors.white ),
                  ),
                ),
                const SizedBox(height: 50,),
                CustomQuestionDesign(questionTitle: "Q1. SDK represents___", customListTileRadio: [
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 1",
                      groupValue: questionOneGroupValue,
                      value: 1,onChanged: (value){
                    setState(() {
                      questionOneGroupValue=value;
                    });
                  }),
                  ),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 2",
                      groupValue: questionOneGroupValue,
                      value: 2,onChanged: (value){
                    setState(() {
                      questionOneGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 3",
                      groupValue: questionOneGroupValue,
                      value: 3,onChanged: (value){
                    setState(() {
                      questionOneGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 4",
                      groupValue: questionOneGroupValue,
                      value: 4,onChanged: (value){
                    setState(() {
                      questionOneGroupValue=value;
                    });
                  }),),]),
                SizedBox(height: 20,),
                CustomQuestionDesign(questionTitle: "Q2. SDK represents___", customListTileRadio: [
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 1",
                      groupValue: questionTwoGroupValue,
                      value: 1,onChanged: (value){
                    setState(() {
                      questionTwoGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 2",
                      groupValue: questionTwoGroupValue,
                      value: 2,onChanged: (value){
                    setState(() {
                      questionTwoGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 3",
                      groupValue: questionTwoGroupValue,
                      value: 3,onChanged: (value){
                    setState(() {
                      questionTwoGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 4",
                      groupValue: questionTwoGroupValue,
                      value: 4,onChanged: (value){
                    setState(() {
                      questionTwoGroupValue=value;
                    });
                  }),),]),
                SizedBox(height: 20,),
                CustomQuestionDesign(questionTitle: "Q3. SDK represents___", customListTileRadio: [
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 1",
                      groupValue: questionThreeGroupValue,
                      value: 1,onChanged: (value){
                    setState(() {
                      questionThreeGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 2",
                      groupValue: questionThreeGroupValue,
                      value: 2,onChanged: (value){
                    setState(() {
                      questionThreeGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 3",
                      groupValue: questionThreeGroupValue,
                      value: 3,onChanged: (value){
                    setState(() {
                      questionThreeGroupValue=value;
                    });
                  }),),
                  CustomListTileRadio(listTileRadioModel: ListTileRadioModel(
                      title: "Software Development Knowledge 4",
                      groupValue: questionThreeGroupValue,
                      value: 4,onChanged: (value){
                    setState(() {
                      questionThreeGroupValue=value;
                    });
                  }),),]),
                SizedBox(height: 20,),

                MaterialButton(
                  onPressed: () {
                    if(questionOneGroupValue!=0 && questionTwoGroupValue!=0 && questionThreeGroupValue!=0) {
                      checkAnswers();
                      CustomSnackBar.show(context:context,content:"Your grade is $grade/${answers.length}");
                      grade=0;
                    }
                    else{
                      CustomSnackBar.show(context:context,content:"Please answer all questions");

                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  minWidth: 200,
                  height: 60,
                  elevation: 10,
                  color: Colors.black,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: () {
                   setState(() {
                     questionOneGroupValue=0;
                     questionTwoGroupValue=0;
                     questionThreeGroupValue=0;
                   });
                  },
                  child: Text(
                    "Reset answers",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  minWidth: 200,
                  height: 60,
                  elevation: 10,
                  color: Colors.blueAccent.withOpacity(0.3),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Quiz App",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
