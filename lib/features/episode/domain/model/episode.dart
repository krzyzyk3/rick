import 'package:rick/generated/graphql_api.graphql.dart';

class Episode {
  Episode(this.id, this.name, this.code, this.airDate);

  final String id;
  final String name;
  final String code;
  final String airDate;

  factory Episode.fromGraphQL(EpisodeMixin mixin) {
    return Episode(mixin.id, mixin.name, mixin.episode, mixin.airDate);
  }

  @override
  String toString() {
    return "Episode: {id: $id, name: $name, code: $code}";
  }
}
