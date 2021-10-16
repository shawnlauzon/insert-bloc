import 'package:bloc/bloc.dart';
import 'package:insert_bloc/item_repository.dart';
import 'package:meta/meta.dart';

import '../model/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc({required this.repository, required this.name})
      : super(ItemState.initial) {
    on<LoadItem>((event, emit) {
      emit(ItemState(
          item: repository.getItem(name)!,
          loadingStatus: LoadingStatus.success));
    });
    on<ItemLoaded>((event, emit) {
      emit(ItemState(item: event.item, loadingStatus: LoadingStatus.success));
    });
    on<AddChild>((event, emit) {
      final patchedChildren = List.of(state.item!.children)
        ..insert(0, event.name);
      final patchedItem = state.item!.copyWith(children: patchedChildren);
      emit(ItemState(item: patchedItem, loadingStatus: LoadingStatus.success));
    });

    add(LoadItem());
  }

  final ItemRepository repository;
  final String name;
}
