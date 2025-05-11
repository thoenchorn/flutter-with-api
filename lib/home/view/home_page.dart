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
      appBar: AppBar(title: const Text('Todo App')),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == TodoStatus.loaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),

              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                  ), // Add spacing between tiles
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          state.todos[index].completed
                              ? Colors.green
                              : Colors.orange, // Green for completed
                      width: 1, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: ListTile(
                    leading: Icon(
                      state.todos[index].completed
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color:
                          state.todos[index].completed
                              ? Colors.green
                              : Colors.grey,
                    ),
                    title: Text(
                      state.todos[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration:
                            state.todos[index].completed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      state.todos[index].completed ? 'Completed' : 'Pending',
                      style: TextStyle(
                        color:
                            state.todos[index].completed
                                ? Colors.green
                                : Colors.orange,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      // Add functionality for tapping the ListTile, e.g., navigate to details
                    },
                  ),
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
