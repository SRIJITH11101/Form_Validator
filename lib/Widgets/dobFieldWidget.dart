import 'package:flutter/material.dart';

class dobTextFieldWidget extends StatelessWidget {
  const dobTextFieldWidget({
    super.key,
    required this.dobcontroller,
  });

  final TextEditingController dobcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      child: TextField(
        controller: dobcontroller,
        readOnly: true,
        decoration: InputDecoration(hintText: "Picked date"),
      ),
    );
  }
}
