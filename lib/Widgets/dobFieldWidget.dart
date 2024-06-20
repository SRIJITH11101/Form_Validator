import 'package:flutter/material.dart';

class dobTextFieldWidget extends StatelessWidget {
  const dobTextFieldWidget({
    super.key,
    required this.dobcontroller,
    required this.isFilled,
  });

  final TextEditingController dobcontroller;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      child: TextField(
        controller: dobcontroller,
        readOnly: true,
        decoration: InputDecoration(
          hintText: "Picked date",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isFilled ? Colors.black : Colors.red[800]!)),
          //labelStyle: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
