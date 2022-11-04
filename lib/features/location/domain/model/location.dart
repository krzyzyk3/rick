import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/generated/graphql_api.graphql.dart';

part 'location.g.dart';

// Could be moved to character feature if I don't use it later in any other way
@HiveType(typeId: 3)
class Location {
  Location(this.id, this.name, this.type, this.dimension);

  Location.fromGraphQL(LocationMixin mixin)
      : id = mixin.id ?? "-1",
        name = mixin.name,
        type = mixin.type ?? "",
        dimension = mixin.dimension ?? "";

  @HiveField(0)
  final String id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final String dimension;
}
