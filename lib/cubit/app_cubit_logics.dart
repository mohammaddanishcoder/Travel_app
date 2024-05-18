import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

import '../pages/navpages/main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(builder:(context, state) {
        if(state is WelcomeStates)
          {
            return const WelcomePage();
          }
        if(state is DetailStates)
        {
          return const DetailPage();
        }
        if(state is LoadedStates)
        {
          return const MainPage();
        }
        if(state is LoadingStates)
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else
          {
            return Container();
          }


      }, ),
    );
  }
}
