import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dio/dio.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:path_provider/path_provider.dart';

Future<GraphQLClient> getClient() async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  final store = await HiveStore.open(path: appDocDirectory.path);
  await store.reset();

  return GraphQLClient(
    link: DioLink(
      "https://rickandmortyapi.com/graphql",
      client: Dio(),
    ),
    cache: GraphQLCache(store: store),
    //cache: GraphQLCache(store: null),
  );
}
