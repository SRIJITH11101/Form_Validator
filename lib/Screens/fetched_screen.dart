import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_01/Models/userData.dart';
import 'package:task_01/Repository/user_repository.dart';
import 'package:task_01/constants.dart';

// ignore: must_be_immutable
class FetchedScreen extends StatefulWidget {
  FetchedScreen({super.key, required this.userdata, required this.uid});
  UserData userdata;
  final String uid;

  @override
  State<FetchedScreen> createState() => _FetchedScreenState();
}

class _FetchedScreenState extends State<FetchedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserRepository(context,
                firestore: FirebaseFirestore.instance,
                uid: widget.uid,
                userdetails: widget.userdata)
            .getUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No data found**'));
          }
          widget.userdata =
              UserData.fromMap(snapshot.data!.data() as Map<String, dynamic>);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Form Details fetched from Firebase',
                  style: qStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Name: ${widget.userdata.name}',
                  style: dispStyle,
                ),
                Text(
                  'Email: ${widget.userdata.email}',
                  style: dispStyle,
                ),
                Text(
                  'Date of Birth: ${widget.userdata.dob}',
                  style: dispStyle,
                ),
                Text(
                  'Work Experience: ${widget.userdata.workExp}',
                  style: dispStyle,
                ),
                Text(
                  'Gender: ${widget.userdata.gender}',
                  style: dispStyle,
                ),
                Text(
                  'Hobbies: ${widget.userdata.hobbies.join(', ')}',
                  style: dispStyle,
                ),
              ],
            ),
          );
          //return Center(child: Text('No data found'));
        },
      ),
    );
  }
}
