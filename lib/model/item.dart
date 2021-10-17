import 'package:uuid/uuid.dart';

class Item {
  final String id;
  final String name;
  final num value;
  final List<String> children;

  Item({
    required this.name,
    required this.value,
    this.children = const [],
    String? id,
  }) : id = id ?? const Uuid().v4();

  Item copyWith({String? name, num? value, List<String>? children}) {
    return Item(
      id: id,
      name: name ?? this.name,
      value: value ?? this.value,
      children: children ?? this.children,
    );
  }

  @override
  String toString() => 'Item { $name: $value, children[${children.length}] }';
}
