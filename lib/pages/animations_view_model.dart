import 'package:dio_servis_learn_202/pages/animations_202.dart';
import 'package:flutter/material.dart';

abstract class AnimationsViewModel extends State<CrossAnimationPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: AllDurations().lowDuration);
  }

  bool isVisible = false;
  bool isOpacity = false;
  late AnimationController controller;
  final durations = AllDurations();

  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
      if (isVisible) {
        controller.animateTo(0);
      } else {
        controller.animateTo(1);
      }
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
