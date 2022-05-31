import 'dart:convert';

import 'shared_manager.dart';
import 'user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    // Compute
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringList(SharedKeys.users, _items);
  }

  Future<void> saveDummyItems(List items) async {
    // Compute
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringList(SharedKeys.users, _items);
  }

  Future<void> saveListDummy(List items) async {
    // Compute
    final _items = items.map((element) => jsonEncode(element)).toList();
    await sharedManager.saveStringList(SharedKeys.dummy, _items);
  }

  List? getDummyItems() {
    // Compute
    return sharedManager.getStringList(SharedKeys.dummy);
  }

  List<User>? getItems() {
    // Compute
    final itemsString = sharedManager.getStringList(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('Abc', 'def', 'get');
      }).toList();
    }
    return null;
  }
}
