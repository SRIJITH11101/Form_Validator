import 'package:flutter/material.dart';
import 'package:task_01/Models/userData.dart';
import 'package:task_01/Screens/submitscreen.dart';
import 'package:task_01/Widgets/snackbar.dart';
import 'package:task_01/constants.dart';

class Validate {
  bool emailDone = false,
      dobDone = false,
      passDone = false,
      expDone = false,
      genderDone = false,
      hobbiesDone = false;
  String name = '';
  String email = "";
  String stdob = "";
  String? wrkexp = "";
  String? genders = "";
  List<String> hobbies = [];

  bool verifyName(String name, BuildContext context) {
    this.name = name;
    if (name.isNotEmpty) {
      print("Name Entered");
      return true;
    } else {
      showsSnackbar(context: context, content: "Please enter the name");
      return false;
    }
  }

  bool emailVerify(String email, BuildContext context) {
    this.email = email;
    final regex = RegExp(pattern);

    if (email.isNotEmpty && regex.hasMatch(email)) {
      print('Valid Email');
      emailDone = true;
      return true;
    } else {
      showsSnackbar(context: context, content: "Invalid Email");
      emailDone = false;
      return false;
    }
  }

  bool dobVerify(DateTime dob, String stDob, BuildContext context) {
    stdob = stDob;
    DateTime currentdate = DateTime.now();
    int age = currentdate.year - dob.year;
    print(age);
    if ((currentdate.month < dob.month) ||
        (currentdate.month == dob.month && currentdate.day < dob.day)) {
      age = age - 1;
    }

    if (age >= 18) {
      print('Valid Date of Birth');
      dobDone = true;
      return true;
    } else {
      if (stDob == "") {
        showsSnackbar(context: context, content: "Please pick the DOB");
      }
      showsSnackbar(context: context, content: "Invalid DOB");
      dobDone = false;
      return false;
    }
  }

  bool verifyPassword(
      String? password, String? confPassword, BuildContext context) {
    if (confPassword == password) {
      print("Password Matched");
      passDone = true;
      return true;
    } else {
      showsSnackbar(
          context: context, content: "Password not Matched, Correct it..");
      passDone = false;
      return false;
    }
  }

  bool workExpCheck(int expvalue, String? answer, BuildContext context) {
    wrkexp = answer;
    if (expvalue != 0) {
      print("Exp OK $expvalue");
      expDone = true;
      return true;
    } else {
      showsSnackbar(
          context: context, content: "Select Yes or No for experience field");
      return false;
    }
  }

  bool genderCheck(int genderValue, String? gender, BuildContext context) {
    genders = gender;
    if (genderValue == 1) {
      print("Gender OK");
      genderDone = true;
      return true;
    } else {
      showsSnackbar(context: context, content: "Select the gender");
      return false;
    }
  }

  bool hobbiesCheck(List<String> hobbies, BuildContext context) {
    this.hobbies = hobbies;
    if (hobbies.isNotEmpty) {
      print("Hobbies OK");

      hobbiesDone = true;
      return true;
    } else {
      showsSnackbar(context: context, content: "Select atleast one Hobby");
      return false;
    }
  }

  void submitForm(BuildContext context) {
    if (dobDone == true &&
        emailDone == true &&
        passDone == true &&
        expDone == true &&
        genderDone == true &&
        hobbiesDone == true) {
      UserData userData = UserData(
        name: name,
        email: email,
        dob: stdob,
        workExp: wrkexp,
        gender: genders,
        hobbies: hobbies,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubmitScreen(
                    userData: userData,
                  )));
      //return true;
    } else {
      showsSnackbar(
          context: context,
          content: "Some validation failed, Retify it and try again.");
    }
  }
}
