import 'package:flutter/material.dart';

import '../../pages/callback_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({Key? key, required this.onSelectedItem})
      : super(key: key);

  final void Function(CallBackUser user) onSelectedItem;

  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? _user;

  void updateList(CallBackUser? user) {
    setState(() {
      _user = user;
    });
    if (_user != null) {
      widget.onSelectedItem.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        value: _user,
        items: CallBackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            child: Text(e.name),
            value: e,
          );
        }).toList(),
        onChanged: updateList);
  }
}
