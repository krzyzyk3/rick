import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/app.dart';
import 'package:rick/dependencies.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await setupDependencies();
  runApp(const MyApp());
}
