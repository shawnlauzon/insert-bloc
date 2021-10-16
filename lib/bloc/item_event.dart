part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {}

class LoadItem extends ItemEvent {}

class ItemLoaded extends ItemEvent {
  final Item item;

  ItemLoaded({required this.item});
}

class AddChild extends ItemEvent {
  final String name;
  AddChild({required this.name});
}
