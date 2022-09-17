import 'package:artemis/artemis.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:rick/core/failure.dart';

class GraphqlNetworkManager {
  GraphqlNetworkManager({required GraphQLClient client}) : _client = client;

  final GraphQLClient _client;

  Future<Either<Failure, T>> query<T, U extends json.JsonSerializable>(GraphQLQuery<T, U> query) async {
    final result = await _client.query(QueryOptions(
      document: query.document,
      variables: query.variables?.toJson() ?? {},
    ));
    return _parseOrError(result, parse: query.parse);
  }

  Either<Failure, T> _parseOrError<T>(
    QueryResult result, {
    required T Function(Map<String, dynamic> json) parse,
  }) {
    final exception = result.exception;
    final data = result.data;
    if (exception != null || data == null) {
      return Left(ServerFailure());
    }
    try {
      return Right(parse(data));
    } catch (e, stack) {
      print(e);

      return Left(ServerFailure());
    }
  }
}
