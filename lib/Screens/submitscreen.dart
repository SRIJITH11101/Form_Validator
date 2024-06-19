import 'package:flutter/material.dart';
import 'package:task_01/Models/userData.dart';
import 'package:task_01/constants.dart';

class SubmitScreen extends StatelessWidget {
  final UserData userData;

  const SubmitScreen({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Form Details',
              style: qStyle,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Name: ${userData.name}',
              style: dispStyle,
            ),
            Text(
              'Email: ${userData.email}',
              style: dispStyle,
            ),
            Text(
              'Date of Birth: ${userData.dob}',
              style: dispStyle,
            ),
            Text(
              'Work Experience: ${userData.workExp}',
              style: dispStyle,
            ),
            Text(
              'Gender: ${userData.gender}',
              style: dispStyle,
            ),
            Text(
              'Hobbies: ${userData.hobbies.join(', ')}',
              style: dispStyle,
            ),
          ],
        ),
      ),
    );
  }
}
