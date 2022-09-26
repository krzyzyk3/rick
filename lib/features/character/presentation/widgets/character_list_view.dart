import 'package:flutter/material.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/presentation/widgets/character_list_item.dart';

class CharacterListView extends StatefulWidget {
  final QueryItems<CharacterEntity> characters;
  final bool isLoading;
  final VoidCallback? onLoadMore;

  const CharacterListView({
    Key? key,
    required this.characters,
    required this.isLoading,
    this.onLoadMore,
  }) : super(key: key);

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final ScrollController controller = ScrollController();

  List<CharacterEntity> get characterList => widget.characters.items;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onScrollChange);
  }

  void _onScrollChange() {
    if (!controller.hasClients || widget.isLoading || !widget.characters.hasMorePages) return;

    if (controller.position.pixels + 300 >= controller.position.maxScrollExtent) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.isLoading ? characterList.length + 1 : characterList.length;
    return ListView.builder(
      itemCount: itemCount,
      controller: controller,
      itemBuilder: (context, index) {
        if (index < characterList.length) {
          return CharacterListItem(character: characterList[index]);
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Loading"),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
