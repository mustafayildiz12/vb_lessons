import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final String _obscureCharecter = "-";

  bool _obscureText = true;

  void changeObs() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [AutofillHints.countryCode],
      obscuringCharacter: _obscureCharecter,
      obscureText: _obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          suffixIcon: _onVisibilityIcon()),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: changeObs,
        icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState: _obscureText
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(seconds: 2),
        ));
  }
}
