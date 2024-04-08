import 'package:graphql_learning/view/home/models/company_details.dart';

abstract class ICompany {
 Future<CompanyDetails> getComapnyDetails();
}
