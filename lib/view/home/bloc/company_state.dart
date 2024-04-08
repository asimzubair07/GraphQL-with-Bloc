part of 'company_bloc.dart';

sealed class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

final class CompanyInitial extends CompanyState {}

final class CompanyDetailsLoading extends CompanyState {}

final class CompanyDetailsSuccess extends CompanyState {
  final CompanyDetails response;

  const CompanyDetailsSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class CompanyDetailsFailure extends CompanyState {
  final String error;

  const CompanyDetailsFailure({required this.error});
  @override
  List<Object> get props => [error];
}
