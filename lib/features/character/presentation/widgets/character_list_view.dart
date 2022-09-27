import 'package:flutter/material.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/presentation/widgets/character_list_item.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({
    Key? key,
    required this.characters,
    required this.isLoading,
    required this.hasMoreData,
    this.onLoadMore,
  }) : super(key: key);

  final List<CharacterEntity> characters;
  final bool isLoading;
  final bool hasMoreData;
  final VoidCallback? onLoadMore;

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final ScrollController controller = ScrollController();

  List<CharacterEntity> get characters => widget.characters;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onScrollChange);
  }

  void _onScrollChange() {
    if (!controller.hasClients || widget.isLoading || !widget.hasMoreData) return;

    if (controller.position.pixels + 300 >= controller.position.maxScrollExtent) {
      widget.onLoadMore?.call();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.isLoading ? characters.length + 1 : characters.length;
    return ListView.builder(
      itemCount: itemCount,
      controller: controller,
      itemBuilder: (context, index) {
        if (index < characters.length) {
          return CharacterListItem(character: characters[index]);
        } else {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: const Text("Loading"),
          );
        }
      },
    );
  }
}
