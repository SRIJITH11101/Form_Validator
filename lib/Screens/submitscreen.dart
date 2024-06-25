import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_01/Models/userData.dart';
import 'package:task_01/Repository/user_repository.dart';
import 'package:task_01/Screens/fetched_screen.dart';
import 'package:task_01/Validators/validate.dart';
import 'package:task_01/constants.dart';
import 'package:uuid/uuid.dart';

class SubmitScreen extends StatelessWidget {
  final UserData userData;

  SubmitScreen({
    super.key,
    required this.userData,
  });

  @override
  String uid = const Uuid().v1();
  final Validate ob = Validate();
  Widget build(BuildContext context) {
    print('User hobbies: ${userData.hobbies}');
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
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                //ob.resetForm();
                Navigator.pop(context, true);
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.brown[800]),
                    //color: Colors.orange,
                    child: Center(
                        child: Text(
                      'Back to Form Screen',
                      style: qStyle.copyWith(color: Colors.white),
                    ))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                UserRepository(context,
                        firestore: FirebaseFirestore.instance,
                        uid: uid,
                        userdetails: userData)
                    .userDataToFirebase();
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.brown[800]),
                    //color: Colors.orange,
                    child: Center(
                        child: Text(
                      'Save data to Firebase',
                      style: qStyle.copyWith(color: Colors.white),
                    ))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FetchedScreen(
                            userdata: userData,
                            uid: uid,
                          )),
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown[800]),
                  //color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Fetch data from Firebase',
                      style: qStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
