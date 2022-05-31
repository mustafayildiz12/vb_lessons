import 'package:dio_servis_learn_202/pages/animations_202.dart';
import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _backColor,
        appBar: AppBar(),
        body: Center(
            child: TextButton(
          child: const Text("Mixin"),
          onPressed: () {
            showCustomSheet(context, const CrossAnimationPage());
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                barrierColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                builder: (context) {
                  return const BottomWidget();
                });
            if (result is bool) {
              setState(() {
                _backColor = Colors.lightGreen;
              });
            }
          },
          child: const Icon(Icons.podcasts),
        ),
      ),
    );
  }
}

class BottomWidget extends StatefulWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  Color _backColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                  right: 5,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ))),
              Divider(
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.45,
                endIndent: MediaQuery.of(context).size.width * 0.45,
              ),
            ],
          ),
        ),
        Image.asset("assets/gs.png"),
        TextButton(
            onPressed: () {
              setState(() {
                _backColor = Colors.deepOrange;
              });
              Navigator.of(context).pop<bool>(true);
            },
            child: const Text("OK"))
      ],
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        builder: (context) {
          return _CustomMainSheet(
            child: child,
          );
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  _CustomMainSheet({Key? key, required this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Stack(
            children: [
              Positioned(
                  right: 5,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ))),
              Divider(
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.45,
                endIndent: MediaQuery.of(context).size.width * 0.45,
              ),
            ],
          ),
        ),
        Expanded(child: child)
      ],
    );
  }
}
