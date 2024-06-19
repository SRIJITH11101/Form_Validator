import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkExpWidget extends StatefulWidget {
  final String dispText;
  final Function(String, int) onChanged;
  String? answer;
  int expvalue;
  WorkExpWidget(
      {super.key,
      required this.dispText,
      required this.answer,
      required this.expvalue,
      required this.onChanged});

  @override
  State<WorkExpWidget> createState() => _WorkExpWidgetState();
}

class _WorkExpWidgetState extends State<WorkExpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      child: RadioListTile(
        title: Text(widget.dispText),
        value: widget.dispText,
        groupValue: widget.answer,
        onChanged: (value) {
          widget.onChanged(value.toString(), widget.dispText == 'Yes' ? 1 : 2);
        },
      ),
    );
  }
}
