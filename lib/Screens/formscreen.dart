import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:task_01/Validators/validate.dart';
import 'package:task_01/Widgets/dobFieldWidget.dart';
import 'package:task_01/Widgets/hobbiesField.dart';
import 'package:task_01/Widgets/nameFieldWidget.dart';
import 'package:task_01/Widgets/textFieldWidget.dart';
import 'package:task_01/Widgets/workExpWidget.dart';
import 'package:task_01/constants.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  void submitForm(
    BuildContext context,
  ) {
    ob.workExpCheck(expvalue, answer, context);
    ob.genderCheck(genderValue, gender, context);
    ob.hobbiesCheck(interests, context);

    ob.submitForm(context);
  }

  Validate ob = Validate();
  TextEditingController dobcontroller = TextEditingController();
  late DateTime dob;
  late String formatdob;
  int expvalue = 0;
  int genderValue = 0;
  List<String> genders = ['Male', 'Female'];
  List<String> interests = [];
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  late String name = "";
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
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Demo Form",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Name :',
                    style: qStyle,
                  ),
                  NameFieldWidget(
                    ob: ob,
                    hintText: 'Enter the Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email :',
                    style: qStyle,
                  ),
                  emailtextFieldWidget(
                    ob: ob,
                    hintText: 'Enter the Email',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Date of Birth :',
                    style: qStyle,
                  ),
                  dobTextFieldWidget(
                    dobcontroller: dobcontroller,
                    isFilled: true,
                  ),
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
                                    ob.dobVerify(dob, formatdob, context);
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

                  Text(
                    'Password :',
                    style: qStyle,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Enter Password"),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: " Confirm the Password"),
                      onChanged: (value) {
                        setState(() {
                          confpassword = value;
                        });
                      },
                      onEditingComplete: () =>
                          ob.verifyPassword(password, confpassword, context),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
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
                        onTap: () => submitForm(context),
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


// Container(
//                         width: MediaQuery.of(context).size.width / 2.3,
//                         child: RadioListTile(
//                           title: Text('Yes'),
//                           value: 'yes',
//                           groupValue: answer,
//                           onChanged: (value) {
//                             setState(() {
//                               expvalue = 1;
//                               answer = value.toString();
//                             });
//                           },
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width / 2.3,
//                         child: RadioListTile(
//                           title: Text('No'),
//                           value: 'no',
//                           groupValue: answer,
//                           onChanged: (value) {
//                             setState(() {
//                               expvalue = 2;
//                               answer = value.toString();
//                             });
//                           },
//                         ),
//                       ),