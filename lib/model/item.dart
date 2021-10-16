class Item {
  final String name;
  final num value;
  final List<String> children;

  Item({required this.name, required this.value, this.children = const []});

  Item copyWith({String? name, num? value, List<String>? children}) {
    return Item(
        name: name ?? this.name,
        value: value ?? this.value,
        children: children ?? this.children);
  }

  @override
  String toString() => 'Item { $name: $value, children[${children.length}] }';
}
