// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:task_01/Models/userData.dart';
import 'package:task_01/Widgets/snackbar.dart';

class UserRepository {
  final FirebaseFirestore firestore;
  final String uid;
  final UserData userdetails;
  final BuildContext context;

  UserRepository(
    this.context, {
    required this.firestore,
    required this.uid,
    required this.userdetails,
  });

  void userDataToFirebase() async {
    var userDetails = UserData(
        name: userdetails.name,
        email: userdetails.email,
        dob: userdetails.dob,
        workExp: userdetails.workExp,
        gender: userdetails.gender,
        hobbies: userdetails.hobbies);
    try {
      await firestore.collection('users').doc(uid).set(userDetails.toMap());
    } catch (e) {
      showsSnackbar(context: context, content: e.toString());
    }
  }

  Future<DocumentSnapshot> getUserData() async {
    DocumentSnapshot data = await firestore.collection('users').doc(uid).get();
    UserData user = UserData.fromMap(data!.data() as Map<String, dynamic>);
    print(user.name);
    return data;
  }
}
