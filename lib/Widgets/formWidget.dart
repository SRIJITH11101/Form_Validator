import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task_01/Validators/validate.dart';
import 'package:task_01/constants.dart';

class FormWidget extends StatefulWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController cpassController;

  const FormWidget(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passController,
      required this.cpassController});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  Validate ob = new Validate();
  String name = "";
  String email = "";
  String pass = "";

  final regex = RegExp(pattern);
  final passRegex = RegExp(passPattern);
  //static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: FormWidget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Name :',
                    style: qStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      controller: widget.nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter the Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Name';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        name = newValue!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Email :',
                    style: qStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      controller: widget.emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter the Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Email';
                        } else if (!regex.hasMatch(value)) {
                          return 'Invalid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Password :',
                    style: qStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      controller: widget.passController,
                      decoration: InputDecoration(
                        hintText: 'Enter the Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Password';
                        } else if (!passRegex.hasMatch(value)) {
                          return 'Invalid Password';
                        } else {
                          pass = value;
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirm Password :',
                style: qStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                width: 200,
                child: TextFormField(
                  obscureText: true,
                  controller: widget.cpassController,
                  decoration: InputDecoration(
                    hintText: 'Confirm the Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Password';
                    } else if (pass != value) {
                      return 'Passwords not matching';
                    } else {
                      //pass = value;
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.brown[800]),
              //   height: 50,
              //   width: MediaQuery.of(context).size.width / 3,
              //   child: GestureDetector(
              //     child: Center(
              //       child: Text(
              //         'Submit',
              //         style: qStyle.copyWith(color: Colors.white),
              //       ),
              //     ),
              //     // onTap: () {
              //     //   if (formKey.currentState!.validate()) {
              //     //     // Process data.
              //     //     formKey.currentState!.save();
              //     //     ob.verifyName(name, context);
              //     //     ob.emailVerify(email, context);
              //     //   }
              //     // },
              //   ),
              // )
            ],
          ),
        ));
  }
}
