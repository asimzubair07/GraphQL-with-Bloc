import 'package:graphql_learning/core/clients/get_it_client.dart';
import 'package:graphql_learning/core/services/company_service.dart';
import 'package:graphql_learning/view/home/interfaces/i_company.dart';
import 'package:graphql_learning/view/home/models/company_details.dart';

class CompanyRepo implements ICompany {
  final CompanyService _companyService = getIt.get<CompanyService>();
  @override
  Future<CompanyDetails> getComapnyDetails() async =>
      await _companyService.getCompanyDetails();
}
