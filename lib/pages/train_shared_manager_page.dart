import 'package:flutter/material.dart';

import '../manager/shared_manager.dart';
import '../manager/user_cache_manager.dart';
import 'catcinig_page.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends LoadingStateful<TodoApp> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  late final UserCacheManager userCacheManager;
  List todo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalazeAndSave();
  }

  Future<void> initalazeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();

    await manager.init().whenComplete(() {
      userCacheManager = UserCacheManager(manager);
    });

    todo = userCacheManager.getDummyItems() ?? [];
    setState(() {});
    changeLoading();
  }

  initMethods() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: t1,
              ),
              ElevatedButton(
                  onPressed: () async {
                    changeLoading();
                    await userCacheManager
                        .saveListDummy([t1.text, t2.text, t3.text]);
                    print(todo.length);
                    changeLoading();
                  },
                  child: const Text("Add")),
              Expanded(
                  child: ListView.builder(
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todo[index]),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
