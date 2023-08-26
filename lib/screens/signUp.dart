import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/logIn.dart';
import '../models/userModel.dart';

class SignUp extends StatefulWidget {

  static final String id= "sign_up";
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   UserModel user=UserModel();
  bool _obsecure1 = true;
  bool _obsecure2 = true;
  List gender = ["Male", "Female"];
  var genderSelectedItem;
  List grade = ["grade1", "grade2", "grade3"];
  var gradeSelectedItem;
  List university = ["AUC", "Cairo", "Helwan"];
  var unversitySelectedItem;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    genderSelectedItem = gender[0];
    gradeSelectedItem = grade[0];
    unversitySelectedItem = university[0];
    user.gender= genderSelectedItem;
    user.grade= gradeSelectedItem;
    user.university= unversitySelectedItem;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Text(
                  "Registeration page",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: formState,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          onSaved: (value){
                            user.email=value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                         validator: (value){
                           if(value!.length < 8){
                             return "must be 8 or more characters";
                           }
                           user.password=value;
                           return null;
                         },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obsecure1,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(_obsecure1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obsecure1 = !_obsecure1;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value != user.password){
                              return "incorrect password, please try again";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obsecure2,
                          decoration: InputDecoration(
                            labelText: "Confirm password",
                            suffixIcon: IconButton(
                              icon: Icon(_obsecure2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obsecure2 = !_obsecure2;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          onSaved: (value){
                            user.phone= int.parse(value!);
                          },
                          keyboardType: TextInputType.phone,
                          onTapOutside: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          decoration: InputDecoration(
                            labelText: "Phone",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.orange),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                  value: genderSelectedItem,
                                  items: gender
                                      .map((e) => DropdownMenuItem(
                                            child: Text("$e"),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      genderSelectedItem = value;
                                      user.gender=genderSelectedItem;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "University",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.orange),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                  value: unversitySelectedItem,
                                  items: university
                                      .map((e) => DropdownMenuItem(
                                            child: Text("$e"),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      unversitySelectedItem = value;
                                      user.university= unversitySelectedItem;

                                    });
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Grade",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.orange),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                              value: gradeSelectedItem,
                              items: grade
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  gradeSelectedItem = value;
                                  user.grade= gradeSelectedItem;
                                });
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if(formState.currentState!.validate()){
                             formState.currentState!.save();
                             Navigator.of(context).pushNamed(LogIn.id,arguments: user);
                             return;
                            }
                            SnackBar(content: Text("error"),);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          minWidth: 360,
                          height: 50,
                          elevation: 10,
                          color: Colors.orange,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LogIn.id);
                            },
                            child: Text(
                              "Have an account? Log in",
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
