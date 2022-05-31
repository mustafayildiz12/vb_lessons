import 'package:dio_servis_learn_202/manager/shared_manager.dart';
import 'package:dio_servis_learn_202/manager/user_model.dart';
import 'package:flutter/material.dart';

class SharedCatchPage extends StatefulWidget {
  const SharedCatchPage({Key? key}) : super(key: key);

  @override
  State<SharedCatchPage> createState() => _SharedCatchPageState();
}

class _SharedCatchPageState extends LoadingStateful<SharedCatchPage> {
  int _currentValue = 0;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();

    _manager = SharedManager();
    initiliazeManager();
  }

  Future<void> initiliazeManager() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getValue();
  }

  void getValue() {
    _onChanged(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChanged(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () async {
              changeLoading();

              await _manager.setString(
                  SharedKeys.counter, _currentValue.toString());
              changeLoading();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () async {
              changeLoading();

              await _manager.removeItem(SharedKeys.counter);
              changeLoading();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        centerTitle: true,
        actions: [
          isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Icon(Icons.check)
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: ((value) {
              _onChanged(value);
            }),
          ),
          Expanded(child: ListUserTile())
        ],
      ),
    );
  }
}

class ListUserTile extends StatelessWidget {
  ListUserTile({
    Key? key,
  }) : super(key: key);

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name.toString()),
            subtitle: Text(users[index].description ?? 'aa'),
          );
        });
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('vb', '10', 'vb10.dev'),
      User('vb2', '102', 'vb10.dev'),
      User('vb3', '103', 'vb10.dev'),
    ];
  }
}

abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
