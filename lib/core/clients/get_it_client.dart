import 'package:get_it/get_it.dart';
import 'package:graphql_learning/core/clients/dio_client.dart';
import 'package:graphql_learning/core/clients/graphql_client.dart';
import 'package:graphql_learning/core/clients/socket_client.dart';
import 'package:graphql_learning/core/services/company_service.dart';

final getIt = GetIt.I;

class GetItClient {
  setupLocator() {
    getIt.registerSingleton<GraphQLService>(GraphQLService());
    getIt.registerSingleton<DioService>(DioService());
    getIt.registerSingleton<CompanyService>(CompanyService());
    getIt.registerSingleton<SocketService>(SocketService());
  }
}
