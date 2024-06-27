import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_01/Widgets/snackbar.dart';

class UserApi {
  final dio = Dio();
  String email = "";
  Future<dynamic> getEmailhttp(BuildContext context, String email) async {
    var uri = "https://api.babelonia.nl/site/user/checkemail";
    var url = Uri.parse(uri);
    //print(email);
    http.Response response = await http.post(url, body: {"email": "$email"});

    Map<String, dynamic> bodyValue = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('OK');
      showsSnackbar(
          context: context, content: "Verification : ${bodyValue['status']}");
    } else {
      print(response.statusCode);
      showsSnackbar(
          context: context, content: "Verification : ${bodyValue['status']}");
    }
    return bodyValue['status'];
  }

  Future<dynamic> getEmaildio(BuildContext context, String email) async {
    var uri = "https://api.babelonia.nl/site/user/checkemail";
    var url = Uri.parse(uri);
    //print(email);
    Response<dynamic> response = await dio.post(uri, data: {"email": "$email"});

    Map<String, dynamic> bodyValue = jsonDecode(response.data);
    if (response.statusCode == 200) {
      print('OK');
      showsSnackbar(
          context: context, content: "Verification : ${bodyValue['status']}");
    } else {
      print(response.statusCode);
      showsSnackbar(
          context: context, content: "Verification : ${bodyValue['status']}");
    }
    return bodyValue['status'];
  }
}

//{"status":true,"user_status":1,"message":"#1226 Inform Jaap on what screen you found #1226"}