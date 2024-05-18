import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_logics.dart';
// ignore: unused_import
import 'package:travel_app/pages/navpages/main_page.dart';
// ignore: unused_import
import 'package:travel_app/pages/welcome_page.dart';
import 'package:travel_app/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AppCubits>
        (
          create:(context) => AppCubits(data: DataServices()),
        child: const AppCubitLogics(),
      )
    );
  }
}