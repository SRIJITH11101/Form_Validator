import 'package:flutter/material.dart';

class HobbiesFieldWidget extends StatelessWidget {
  final bool value;
  final String hName;
  final ValueChanged<bool?> onChanged;

  const HobbiesFieldWidget({
    Key? key,
    required this.value,
    required this.hName,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      child: CheckboxListTile(
        title: Text(hName),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
