import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyBlocProvider());
  // runApp(const MyApp());
}

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: false).getTheme(),
    );
  }
}
