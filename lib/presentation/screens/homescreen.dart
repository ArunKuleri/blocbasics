import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/logic/cubit/counter_cubit.dart';
import 'package:flutter_cubit/presentation/screens/screen2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncrement == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("incremented"),
              duration: Duration(milliseconds: 300),
            ));
          } else if (state.wasIncrement == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("decreament!"),
              duration: Duration(),
            ));
          }
        },
        child: Center(
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
          ),
        ),
      ),
    );
  }
}
