import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/features/location/domain/model/location.dart';

void setup() {
  Hive.registerAdapter(LocationAdapter());
}
