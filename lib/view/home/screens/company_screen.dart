import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_learning/view/home/bloc/company_bloc.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  void initState() {
    BlocProvider.of<CompanyBloc>(context).add(FetchCompanyDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, state) {
            if (state is CompanyDetailsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CompanyDetailsSuccess) {
              return Text(state.response.company!.coo.toString());
            }
            if (state is CompanyDetailsFailure) {
              return Text(state.error.toString());
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
