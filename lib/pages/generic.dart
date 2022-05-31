class UserManagement<T extends Admin> {
  final T admin;

  UserManagement(this.admin);
  int calculateMoney(List<GenericUser> user) {
    final initMoney = admin.id == 1 ? admin.money : 0;
    final _money = user.map((e) => e.money).fold<int>(
        initMoney, (previousValue, element) => previousValue + element);
    return _money;
  }

  Iterable<R>? showNames<R>(List<GenericUser> user) {
    if (R == String) {
      final names = user.map((e) => e.name);

      return names.cast<R>();
    }
    return null;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class Admin {
  final String id;
  final int money;

  Admin(this.id, this.money);
}
