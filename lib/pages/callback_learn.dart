// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../product/buttons/callback_button.dart';
import '../product/buttons/loading_button.dart';
import '../product/widgets/callback_drop_down.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(
            onSelectedItem: (CallBackUser? user) {
              print(user!.name);
            },
          ),
          CallBackcButon(
            selectedNumber: (int number) {
              if (number % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
          ),
          Center(
            child: LoadingButton(
              title: "Yükle",
              onPressed: () async {
                await Future.delayed(
                  const Duration(seconds: 1),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final String id;
  CallBackUser(
    this.name,
    this.id,
  );

  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser("a1", "a2"),
      CallBackUser("b1", "b2"),
      CallBackUser("c1", "c2")
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
