import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/data/bloc/todo_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<TodoCubit>().fetchTodos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == TodoStatus.loaded) {
            return ListView.builder(
              itemCount: state.todos.length,

              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index].title),
                  subtitle: Text('${state.todos[index].completed}'),
                );
              },
            );
          } else if (state.status == TodoStatus.error) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return const Center(child: Text('No todos available'));

        },
      ),
    );
  }
}
