import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_learning/core/clients/get_it_client.dart';
import 'package:graphql_learning/view/home/bloc/company_bloc.dart';
import 'package:graphql_learning/view/home/screens/company_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  GetItClient().setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CompanyBloc>(create: (_) => CompanyBloc())],
      child: MaterialApp(
        title: 'Revibe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CompanyScreen(),
      ),
    );
  }
}
