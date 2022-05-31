import 'package:dio_servis_learn_202/extentions/image.dart';
import 'package:flutter/material.dart';

import 'animations_view_model.dart';

class CrossAnimationPage extends StatefulWidget {
  const CrossAnimationPage({Key? key}) : super(key: key);

  @override
  State<CrossAnimationPage> createState() => _CrossAnimationPageState();
}

class _CrossAnimationPageState extends AnimationsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisibility();
        },
      ),
      //appBar: AppBar(),
      body: Column(
        children: [
          AnimatedCrossFade(
            firstChild: ImagePaths.bjk.toWidget(),
            secondChild: ImagePaths.gs.toWidget(),
            duration: AllDurations().lowDuration,
            crossFadeState: isVisible
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          /*
          AnimatedOpacity(
            opacity: isOpacity ? 1 : 0.1,
            duration: durations.lowDuration,
            child: ElevatedButton(
              onPressed: () {
                changeOpacity();
              },
              child: const Text("Opacity"),
            ),
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: controller,
          ),
          AnimatedContainer(
            duration: durations.lowDuration,
            width: GetSize(context).getSize() * 0.4,
            height: isVisible ? 0 : MediaQuery.of(context).size.height * 0.3,
            color: Colors.blue,
          ),
            Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                    top: 40,
                    left: isVisible ? 200 : 50,
                    child: const Text("Uç Bakalım"),
                    duration: durations.lowDuration)
              ],
            ),
          )
          */
        ],
      ),
    );
  }
}

class AllDurations {
  final Duration lowDuration = const Duration(seconds: 1);
  final Duration mediumDuration = const Duration(seconds: 2);
  final Duration heightDuration = const Duration(seconds: 2);
}
