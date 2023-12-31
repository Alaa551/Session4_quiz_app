

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/customSnackBar.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static final String id= "forget_password";

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? userEmail = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 350,
            height: 270,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forget password",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20,),
                Form(
                  key: formState,
                  child: TextFormField(
                    validator: (value){
                      if(value!= userEmail){
                        return "incorrect email";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: () {
                    if(userEmail!=null) {
                      if (formState.currentState!.validate()) {
                        CustomSnackBar.show(
                            context: context, content: "check your email");
                        return;
                      }}
                      CustomSnackBar.show(
                          context: context, content: "check your email");

                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  minWidth: 150,
                  height: 50,
                  elevation: 10,
                  color: Colors.orange,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange)),
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
