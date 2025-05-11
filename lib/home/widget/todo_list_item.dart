import 'package:flutter/material.dart';

import '../../data/model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final isCompleted = todo.completed;
    final borderColor = isCompleted ? Colors.green : Colors.orange;
    final statusText = isCompleted ? 'Completed' : 'Pending';
    final statusColor = isCompleted ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          statusText,
          style: TextStyle(color: statusColor),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {
          // Add functionality for tapping the ListTile, e.g., navigate to details
        },
      ),
    );
  }
}