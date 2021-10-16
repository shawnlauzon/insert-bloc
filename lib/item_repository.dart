import 'model/item.dart';

Map<String, Item> items = {
  'one': Item(name: 'one', value: 1),
  'two': Item(name: 'two', value: 2),
  'three': Item(name: 'three', value: 3),
  'four': Item(name: 'four', value: 4),
  'five': Item(name: 'five', value: 5),
};

// Normally this repository is a remote call, which has a delay of multiple
// seconds between pushing an update and seeing it in the repository. This is
// why the code patches the local object rather than pulling it from the repo.
class ItemRepository {
  Item? getItem(String name) => items[name];
}
