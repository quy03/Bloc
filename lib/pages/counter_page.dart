import 'dart:math';

import 'package:bloc_/bloc/counter_bloc.dart';
import 'package:bloc_/bloc/counter_event.dart';
import 'package:bloc_/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batman Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                for (int index = 0; index < state.count; index++)
                  Positioned(
                    left: Random().nextInt(250).toDouble(),
                    right: Random().nextInt(400).toDouble(),
                    child: const SizedBox(
                      height: 150,
                      width: 150,
                      child: Icon(Icons.ac_unit),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterResetPressed());
            },
            child: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
