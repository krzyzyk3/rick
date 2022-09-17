import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/networking/graphql_client.dart';
import 'package:rick/networking/graphql_network_manager.dart';

Future<void> setup() async {
  final graphqlClient = await getClient();
  sl.registerLazySingleton<GraphQLClient>(() => graphqlClient);
  sl.registerLazySingleton<GraphqlNetworkManager>(() => GraphqlNetworkManager(client: graphqlClient));
}
