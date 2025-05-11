import 'package:flutter/material.dart';
import 'package:test_pro/router/router_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/data/bloc/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
