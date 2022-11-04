import 'package:flutter/material.dart';
import 'package:rick/features/character/presentation/character_list_page/character_list_page.dart';
import 'package:rick/features/favorite/presentation/pages/favorite_page.dart';

// Should this be in core dir?
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and morty')),
      body: Builder(
        builder: (context) => _currentPage == 0 ? const CharacterListPage() : const FavoritePage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "All Characters"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
        onTap: (index) => setState(() {
          _currentPage = index;
        }),
      ),
    );
  }
}
