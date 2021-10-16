part of 'item_bloc.dart';

@immutable
class ItemState {
  final Item? item;

  final LoadingStatus loadingStatus;

  const ItemState({this.item, required this.loadingStatus});

  static ItemState initial =
      const ItemState(loadingStatus: LoadingStatus.loading);
}

enum LoadingStatus {
  loading,
  success,
}
