import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_learning/core/clients/get_it_client.dart';
import 'package:graphql_learning/core/clients/graphql_client.dart';
import 'package:graphql_learning/view/home/models/company_details.dart';

class CompanyService {
  final GraphQLService _graphQLService = getIt.get<GraphQLService>();
  Future<CompanyDetails> getCompanyDetails() async {
    QueryResult response =
        await _graphQLService.performQuery(r'''query Company {
    company {
        ceo
        coo
        cto
        founder
        name
        summary
        founded
    }
}
''');
    return CompanyDetails.fromJson(response.data!);
  }
}
