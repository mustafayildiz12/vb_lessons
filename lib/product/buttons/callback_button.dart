import 'dart:math';

import 'package:flutter/material.dart';

class CallBackcButon extends StatefulWidget {
  CallBackcButon({Key? key, required this.selectedNumber}) : super(key: key);

  bool Function(int onNumber)? selectedNumber;
  @override
  State<CallBackcButon> createState() => _CallBackcButonState();
}

class _CallBackcButonState extends State<CallBackcButon> {
  Color? _backColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _backColor),
      onPressed: () {
        final result = Random().nextInt(25);

        final response = widget.selectedNumber?.call(result) ?? false;
        print(result);
        setState(() {
          _backColor = response ? Colors.green : Colors.red;
        });
      },
      child: const Text("Click"),
    );
  }
}
