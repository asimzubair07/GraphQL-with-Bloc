import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_learning/core/clients/get_it_client.dart';
import 'package:graphql_learning/core/services/company_service.dart';
import 'package:graphql_learning/view/home/models/company_details.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyService _companyService = getIt.get<CompanyService>();
  CompanyBloc() : super(CompanyInitial()) {
    on<CompanyEvent>((event, emit) {});
    on<FetchCompanyDetails>((event, emit) async {
      try {
        emit(CompanyDetailsLoading());
        CompanyDetails companyDetails =
            await _companyService.getCompanyDetails();
        emit(CompanyDetailsSuccess(response: companyDetails));
      } on GraphQLError catch (e) {
        emit(CompanyDetailsFailure(error: e.message));
      }
    });
  }
}
