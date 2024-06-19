// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  final String name;
  final String email;
  final String dob;
  final String? workExp;
  final String? gender;
  final List<String> hobbies;

  const UserData({
    required this.name,
    required this.email,
    required this.dob,
    required this.workExp,
    required this.gender,
    required this.hobbies,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'dob': dob,
      'workExp': workExp,
      'gender': gender,
      'hobbies': hobbies,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      email: map['email'] as String,
      dob: map['dob'] as String,
      workExp: map['workExp'] as String,
      gender: map['gender'] as String,
      hobbies: List<String>.from(map['hobbies'] as List),
    );
  }
}
