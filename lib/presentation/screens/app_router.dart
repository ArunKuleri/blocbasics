import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/logic/cubit/counter_cubit.dart';
import 'package:flutter_cubit/presentation/screens/homescreen.dart';
import 'package:flutter_cubit/presentation/screens/screen2.dart';
import 'package:flutter_cubit/presentation/screens/screen3.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  // ignore: non_constant_identifier_names
  Route? onGenerateRoute(RouteSettings Settings) {
    switch (Settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const MyHomePage(
                  title: "HomeScreen",
                  color: Colors.blueAccent,
                )));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                    title: "SecondScreen",
                    color: Colors.redAccent,
                  ),
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(
                    title: "ThirdScreen", color: Colors.greenAccent)));
      default:
        return null;
    }
  }
}
