import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late GraphQLClient client;

  GraphQLService() {
    HttpLink link = HttpLink(dotenv.get('BASE_URL'));

    client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  Future<QueryResult> performQuery(String query) async {
    QueryOptions options = QueryOptions(
      document: gql(query),
    );

    late QueryResult result;
    try {
      result = await client.query(options);
    } on GraphQLError catch (_) {
      rethrow;
    }

    return result;
  }

  Future<QueryResult> performQueryWithParams(
      {required String query, required Map<String, dynamic> params}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: params);

    late QueryResult result;
    try {
      result = await client.query(options);
    } on GraphQLError catch (_) {
      rethrow;
    }

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables!);

    final result = await client.mutate(options);

    return result;
  }
}
