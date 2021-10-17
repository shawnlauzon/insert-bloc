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
      emit(
        ItemState(
          item: state.item!.copyWith(
            children: [event.name, ...state.item!.children],
          ),
          loadingStatus: LoadingStatus.success,
        ),
      );
    });

    add(LoadItem());
  }

  final ItemRepository repository;
  final String name;
}
