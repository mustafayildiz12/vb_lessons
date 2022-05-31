import 'package:flutter/material.dart';

enum ImagePaths { bjk, fb, gs }

extension ImagePathExtentions on ImagePaths {
  String path() {
    return 'assets/$name.png';
  }

  Widget toWidget({double? height}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}

extension GetTheme on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

extension GetSize on BuildContext {
  double getSize() {
    return MediaQuery.of(this).size.width;
  }
}
