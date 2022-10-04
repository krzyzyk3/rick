import 'package:get_it/get_it.dart';
import 'package:rick/features/character/dependencies.dart' as character;
import 'package:rick/networking/dependencies.dart' as networking;
import 'package:rick/features/favorite/dependencies.dart' as favorite;

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await networking.setup();
  await Future.wait([
    character.setup(),
    favorite.setup(),
  ]);
}
