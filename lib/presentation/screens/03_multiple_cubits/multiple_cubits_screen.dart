import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';


class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1,),

            IconButton(
              // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
              icon: const Icon( Icons.dark_mode_outlined, size: 100 ),
              onPressed: () {},
            ),

            const Text('Fernando Herrera', style: TextStyle(fontSize: 25 )),

            TextButton.icon(
              icon:null,
              label: Text('${counterCubit.state}', style: TextStyle(fontSize: 100)),
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ElevatedButton(onPressed: (){
                counterCubit.incrementBy(1);
              }, child: Text('+1', style: TextStyle(fontSize: 20),)),
              ElevatedButton(onPressed: (){
                counterCubit.decrementBy(1);
              }, child: Text('-1', style: TextStyle(fontSize: 20))),
              ElevatedButton(onPressed: (){
                counterCubit.multiplyBy(2);
              }, child: Text('*2',style: TextStyle(fontSize: 20))),
              ElevatedButton(onPressed: (){
                counterCubit.divideBy(2);
              }, child: Text('/2',style: TextStyle(fontSize: 20))),
              ElevatedButton(onPressed: (){
                counterCubit.powToSquare();
              }, child: Text('^2',style: TextStyle(fontSize: 20)))],
            ),

            const Spacer(flex: 2,),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {},
      ),
    );
  }
}