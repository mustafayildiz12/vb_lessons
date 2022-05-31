import 'package:flutter/material.dart';

import '../manager/shared_manager.dart';
import '../manager/user_cache_manager.dart';
import 'catcinig_page.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStateful<SharedListCache> {
  late final UserCacheManager userCacheManager;
  List _users = [];
  @override
  void initState() {
    super.initState();
    initalazeAndSave();
  }

  Future<void> initalazeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();

    await manager.init().whenComplete(() {
      userCacheManager = UserCacheManager(manager);
    });

    _users = userCacheManager.getDummyItems() ?? [];
    setState(() {});
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).scaffoldBackgroundColor)
            : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                    onPressed: () async {
                      changeLoading();
                      await userCacheManager.saveListDummy(['aa', 'bb', 'cc']);
                      print("*** ${_users.length}");
                      changeLoading();
                    },
                    icon: const Icon(Icons.download_for_offline_outlined)),
                IconButton(
                    onPressed: () {
                      print("*** ${_users.length}");
                    },
                    icon: const Icon(Icons.remove_circle_outline)),
              ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[0] ?? ''),
            subtitle: Text(users[1] ?? ''),
            trailing: Text(users[2] ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(decoration: TextDecoration.underline)),
          ),
        );
      },
    );
  }
}
