import 'package:get_it/get_it.dart';
import 'package:rick/features/character/dependencies.dart' as character;
import 'package:rick/networking/dependencies.dart' as networking;
import 'package:rick/features/favorite/dependencies.dart' as favorite;

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await Future.wait([
    networking.setup(),
    character.setup(),
    favorite.setup(),
  ]);
}
