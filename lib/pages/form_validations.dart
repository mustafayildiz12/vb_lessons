import 'package:flutter/material.dart';

class FormValidationPage extends StatefulWidget {
  const FormValidationPage({Key? key}) : super(key: key);

  @override
  State<FormValidationPage> createState() => _FormValidationPageState();
}

class _FormValidationPageState extends State<FormValidationPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(child: Text('a'), value: 'v'),
                  DropdownMenuItem(child: Text('a'), value: 'v2'),
                  DropdownMenuItem(child: Text('a'), value: 'v3'),
                ],
                onChanged: (value) {}),
            CheckboxListTile(value: true, onChanged: (value) {}),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  print('okey');
                }
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bos gecielemz';
}
