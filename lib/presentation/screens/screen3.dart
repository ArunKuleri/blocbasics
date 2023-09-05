import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  createState() => _ThirdScreen();
}

class _ThirdScreen extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("pushed  button "),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  "NEGATIVE${state.counterValue}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else if (state.counterValue == 0) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else if (state.counterValue % 2 == 0) {
                return Text(
                  "even number${state.counterValue}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else if (state.counterValue % 2 != 0) {
                return Text(
                  "odd number${state.counterValue}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
              return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          const SizedBox(
            height: 240,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: const Text("button"),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: "Decrement",
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: const Text(""),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: "increment",
                child: const Icon(Icons.add),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          MaterialButton(
            color: widget.color,
            child: Text("go to next screen"),
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
          ),
          SizedBox(
            height: 24,
          ),
          MaterialButton(
              color: Colors.greenAccent,
              child: Text(
                "go to third screen",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              })
        ],
      )),
    );
  }
}
