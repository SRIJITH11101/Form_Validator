import 'package:flutter/material.dart';
import 'package:task_01/Validators/validate.dart';

class NameFieldWidget extends StatelessWidget {
  const NameFieldWidget({
    super.key,
    required this.ob,
    required this.hintText,
  });

  final Validate ob;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      child: TextField(
        onSubmitted: (value) => ob.verifyName(value, context),
        onChanged: (value) {},
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
