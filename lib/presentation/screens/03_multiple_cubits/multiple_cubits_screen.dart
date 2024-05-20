import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();
    final themeCubit = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 4,
          ),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: Icon(
                themeCubit.state.isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                size: 100),
            onPressed: () {
              themeCubit.toggleTheme();
            },
          ),
          const Text('Fernando Herrera', style: TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: null,
            label: Text('${counterCubit.state}',
                style: const TextStyle(fontSize: 100)),
            onPressed: () {},
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              gradient: LinearGradient(
                colors: [Colors.white12, Colors.black45],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                      onPressed: () {
                        themeCubit.SetLightMode();
                      },
                      icon: const Icon(Icons.light_mode_outlined)),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                      onPressed: () {
                        themeCubit.toggleTheme();
                      },
                      icon: const Row(
                        children: [
                          Icon(Icons.light_mode_outlined),
                          Text(
                            '/',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.dark_mode_outlined),
                        ],
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                      onPressed: () {
                        themeCubit.SetDarkMode();
                      },
                      icon: const Icon(Icons.dark_mode_outlined)),
                )
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    counterCubit.incrementBy(1);
                  },
                  child: const Text(
                    '+1',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    counterCubit.decrementBy(1);
                  },
                  child: const Text('-1', style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () {
                    counterCubit.multiplyBy(2);
                  },
                  child: const Text('*2', style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () {
                    counterCubit.divideBy(2);
                  },
                  child: const Text('/2', style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () {
                    counterCubit.powToSquare();
                  },
                  child: const Text('^2', style: TextStyle(fontSize: 20)))
            ],
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
    );
  }
}
