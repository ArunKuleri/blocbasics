import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/logic/cubit/counter_cubit.dart';
import 'package:flutter_cubit/presentation/screens/homescreen.dart';
import 'package:flutter_cubit/presentation/screens/screen2.dart';
import 'package:flutter_cubit/presentation/screens/screen3.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings Settings) {
    final Object? key = Settings.arguments;
    switch (Settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: MyHomePage(
                  title: "HomeScreen",
                  color: Colors.blueAccent,
                )));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: SecondScreen(
                    title: "SecondScreen",
                    color: Colors.redAccent,
                  ),
                ));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                    title: "ThirdScreen", color: Colors.greenAccent)));
        break;
      default:
        return null;
    }
  }
}
