// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, unnecessary_import, use_build_context_synchronously, duplicate_ignore

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routs.dart';

// ignore: use_key_in_widget_constructors
class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myrouts.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,

      // ignore: sized_box_for_whitespace
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Column(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  "assets/images/th.jpg",
                  fit: BoxFit.fitHeight,
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 15.0,
                ),
                // ignore: prefer_const_constructors
                Text(
                  "Welcome  $name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 58, 50, 38),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      // ignore: prefer_const_constructors
                      TextFormField(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "Username can't be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          }),
                      // ignore: prefer_const_constructors
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 8) {
                            return "Password lenght should be atleast 8";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 20.0),

                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 50 : 8),
                        child: InkWell(
                          onTap: () => movetohome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changebutton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text("Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
