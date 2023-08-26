
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/userModel.dart';
import 'package:quiz_app/screens/homePage.dart';

class LogIn extends StatefulWidget {
  static final String id = "log_in";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _obsecure = true;

  @override
  Widget build(BuildContext context) {
    var userData = ModalRoute.of(context)?.settings.arguments as UserModel;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Log in page",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: formState,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value != userData.email){
                          return "incorrect email";
                        }
                        return null;
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
                        if(value != userData.password){
                          return "incorrect email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obsecure,
                      onTapOutside: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(_obsecure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: (){
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                if(formState.currentState!.validate()){
                   Navigator.pushNamed(context, HomePage.id);
                }
              },
              child: Text(
                "Log in",
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
          ],
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
