import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task_01/Models/UserApi.dart';
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
  bool isPressed = false;
  bool verified = false;
  bool pressed = false;
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
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name :',
                    style: qStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Container(
                      height: 40,
                      width: 200,
                      child: TextFormField(
                        controller: widget.nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter the Name',
                          errorStyle: TextStyle(
                              height: 0), // Reduce the error text height to 0
                          helperText: ' ',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Name';
                          } else if (value.length == 1) {
                            return 'Please a proper name';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          if (FormWidget.formKey.currentState!.validate()) {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          name = newValue!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Email :',
                    style: qStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Container(
                      height: 40,
                      width: 195,
                      child: TextFormField(
                        controller: widget.emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter the Email',
                          errorStyle: TextStyle(
                              height: 0), // Reduce the error text height to 0
                          helperText: ' ',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Email';
                          } else if (!regex.hasMatch(value)) {
                            return 'Invalid Email';
                          } else if (!verified) {
                            return 'Verification failed';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          email = value;
                          if (FormWidget.formKey.currentState!.validate()) {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          email = newValue!;
                          //UserApi().getEmail(email);
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: pressed ? CircularProgressIndicator() : null),
                      TextButton(
                          onPressed: () async {
                            //print(email);
                            setState(() {
                              pressed = true;
                            });

                            bool ans =
                                await UserApi().getEmailhttp(context, email);
                            setState(() {
                              verified = ans;
                              pressed = false;
                            });
                            FormWidget.formKey.currentState!.validate();
                            print(ans);
                          },
                          child: Text(
                            "Verify",
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  )
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
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: 40,
                      width: 200,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        readOnly: !verified,
                        controller: widget.passController,
                        decoration: InputDecoration(
                          hintText: 'Enter the Password',
                          errorStyle: TextStyle(
                              height: 0), // Reduce the error text height to 0
                          helperText: ' ',
                        ),
                        validator: (value) {
                          if (!verified) {
                            return 'Verify the Email';
                          } else if (value == null || value.isEmpty) {
                            return 'Please enter the Password';
                          } else if (!passRegex.hasMatch(value)) {
                            return 'Invalid Password';
                          } else {
                            pass = value;
                            return null;
                          }
                        },
                        onChanged: (value) {
                          pass = value;
                          if (FormWidget.formKey.currentState!.validate()) {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          pass = newValue!;
                        },
                      ),
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 70,
                  width: 230,
                  child: TextFormField(
                    readOnly: !verified,
                    obscureText: isPressed ? false : true,
                    controller: widget.cpassController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          height: 0), // Reduce the error text height to 0
                      helperText: ' ',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isPressed) {
                                isPressed = false;
                              } else {
                                isPressed = true;
                              }
                            });
                          },
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(isPressed
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      hintText: 'Confirm the Password',
                    ),
                    validator: (value) {
                      if (!verified) {
                        return 'Verify the Email';
                      } else if (value == null || value.isEmpty) {
                        return 'Please enter the Password';
                      } else if (pass != value) {
                        return 'Passwords not matching';
                      } else {
                        //pass = value;
                        return null;
                      }
                    },
                    onChanged: (value) {
                      if (FormWidget.formKey.currentState!.validate()) {
                        return null;
                      }
                    },
                    //onTapOutside: ,
                    onSaved: (newValue) {
                      pass = newValue!;
                    },
                  ),
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
