import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/item_bloc.dart';
import '../item_repository.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemBloc>(
      create: (context) {
        print('Create ContentBloc for $name');
        return ItemBloc(
            repository: RepositoryProvider.of<ItemRepository>(context),
            name: name);
      },
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state.loadingStatus == LoadingStatus.loading) {
            return const CircularProgressIndicator();
          }
          final item = state.item!;
          return Column(
            children: [
              Text('Item: ${item.name} => ${item.value}'),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: item.children.length,
                        itemBuilder: (context, index) {
                          final child = item.children[index];
                          return ItemView(
                            key: ValueKey('${item.id}-$child'),
                            name: child,
                          );
                        }),
                    () {
                      final child =
                          ['one', 'two', 'three', 'four', 'five'][next(0, 5)];
                      return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ItemBloc>(context)
                                .add(AddChild(name: child));
                          },
                          child: Text('Add Child "$child"'));
                    }()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

final _random = Random();

int next(int min, int max) => min + _random.nextInt(max - min);
