import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:task_01/Validators/validate.dart';
import 'package:task_01/Widgets/dobFieldWidget.dart';
import 'package:task_01/Widgets/formWidget.dart';
import 'package:task_01/Widgets/hobbiesField.dart';
import 'package:task_01/Widgets/workExpWidget.dart';
import 'package:task_01/constants.dart';

class SecFormScreen extends StatefulWidget {
  const SecFormScreen({super.key});

  @override
  State<SecFormScreen> createState() => _SecFormScreenState();
}

class _SecFormScreenState extends State<SecFormScreen> {
  final GlobalKey<FormState> txtformKey = FormWidget.formKey;

  void submitForm(
    BuildContext context,
  ) {
    if (txtformKey.currentState!.validate()) {
      txtformKey.currentState!.save();

      // Sequential function calls with conditional execution
      if (ob.verifyName(nameController.text, context)) {
        if (ob.emailVerify(emailController.text, context)) {
          if (ob.verifyPassword(
              passController.text, cpassController.text, context)) {
            if (ob.dobVerify(dob, formatdob, context)) {
              if (ob.workExpCheck(expvalue, answer, context)) {
                if (ob.genderCheck(genderValue, gender, context)) {
                  if (ob.hobbiesCheck(interests, context)) {
                    ob.submitForm(context);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();
  Validate ob = Validate();
  //FormWidget oj = FormWidget();
  TextEditingController dobcontroller = TextEditingController();
  DateTime dob = DateTime.now();
  String formatdob = "";
  int expvalue = 0;
  int genderValue = 0;
  List<String> genders = ['Male', 'Female'];
  List<String> interests = [];
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  String? answer;
  String? gender;
  String? password;
  String? confpassword;

  Map<String, bool> hobbiesState = {
    "Cricket": false,
    "Football": false,
    "Chess": false,
    "Carrom": false,
  };

  void handleRadioChange(String value, int expValue) {
    setState(() {
      answer = value;
      expvalue = expValue;
    });
  }

  void handleCheckboxChange(String hobby, bool? value) {
    setState(() {
      hobbiesState[hobby] = value!;
      if (value) {
        interests.add(hobby);
      } else {
        interests.remove(hobby);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Second Form',
                  style: qStyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FormWidget(
                nameController: nameController,
                emailController: emailController,
                passController: passController,
                cpassController: cpassController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Date of Birth :',
                style: qStyle,
              ),
              dobTextFieldWidget(dobcontroller: dobcontroller),
              CupertinoButton(
                  child: Text('Pick Your Birth Date'),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.blueGrey[200],
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime(2000, 1, 1),
                              onDateTimeChanged: (value) {
                                setState(() {
                                  dob = value;
                                });
                                formatdob =
                                    DateFormat('dd-MM-yyyy').format(dob);
                                dobcontroller.text = formatdob;
                                //ob.dobVerify(dob, formatdob, context);
                                // //print(dob);
                                // formatdob =
                                //     DateFormat('yyyy-mm-dd').format(dob);
                                // print(formatdob);
                              },
                            )));
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                'Do you have work experience?',
                style: qStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WorkExpWidget(
                    dispText: 'Yes',
                    answer: answer,
                    expvalue: expvalue,
                    onChanged: handleRadioChange,
                  ),
                  WorkExpWidget(
                    dispText: 'No',
                    answer: answer,
                    expvalue: expvalue,
                    onChanged: handleRadioChange,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Gender dropdown',
                style: qStyle,
              ),
              DropdownButton(
                hint: Text('Pick the Gender'),
                value: gender,
                items: genders.map((gen) {
                  return DropdownMenuItem(
                    child: Text(gen),
                    value: gen,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    genderValue = 1;
                    gender = value;
                  });
                },
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                'Hobbies',
                style: qStyle,
              ),
              // HobbiesFieldWidget(
              //     values: value1, interests: interests, hName: "Test"),
              for (String hobby in hobbiesState.keys)
                HobbiesFieldWidget(
                  value: hobbiesState[hobby]!,
                  hName: hobby,
                  onChanged: (value) => handleCheckboxChange(hobby, value),
                ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown[800]),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3,
                  child: GestureDetector(
                    child: Center(
                      child: Text(
                        'Submit',
                        style: qStyle.copyWith(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      submitForm(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
