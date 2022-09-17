import 'package:get_it/get_it.dart';
import 'package:rick/features/character/dependencies.dart' as character;
import 'package:rick/networking/dependencies.dart' as networking;

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  networking.setup();

  character.setup();
}
