import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/data/bloc/todo_cubit.dart';
import 'package:test_pro/data/model/todo_model.dart';

import '../widget/todo_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<TodoCubit>().fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(TodoState state) {
    switch (state.status) {
      case TodoStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case TodoStatus.loaded:
        return _buildTodoList(state.todos);
      case TodoStatus.error:
        return _buildErrorView(state.errorMessage);
      case TodoStatus.initial:
        return const Center(child: Text('No todos available'));
    }
  }

  Widget _buildTodoList(List<TodoModel> todos) {
    return ListView.builder(
      itemCount: todos.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) => TodoListItem(todo: todos[index]),
    );
  }

  Widget _buildErrorView(String? errorMessage) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 16),
          Text(
            'Error: ${errorMessage ?? 'Unknown error occurred'}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<TodoCubit>().fetchTodos(),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
