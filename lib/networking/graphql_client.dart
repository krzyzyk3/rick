import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dio/dio.dart';
import 'package:gql_dio_link/gql_dio_link.dart';

Future<GraphQLClient> getClient() async {
  final store = await HiveStore.open(path: 'my/cache/path');
  return GraphQLClient(
    link: DioLink(
      "https://rickandmortyapi.com/graphql",
      client: Dio(),
    ),
    cache: GraphQLCache(store: store),
  );
}
