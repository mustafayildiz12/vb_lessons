import 'package:dio_servis_learn_202/extentions/image.dart';
import 'package:flutter/material.dart';

class ExtentionPage extends StatelessWidget {
  const ExtentionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Extentions",
          style: context.textTheme().subtitle1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImagePaths.bjk.toWidget(height: 500),
            ImagePaths.fb.toWidget(height: 500),
          ],
        ),
      ),
    );
  }
}
