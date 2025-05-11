import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_pro/data/repository/todo_repository.dart';

import '../model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());

  final TodoRepository todoRepository = TodoRepository();

  Future<void> fetchTodos() async {
    try {
      emit(state.copyWith(status: TodoStatus.loading));
      final todos = await todoRepository.getTodos();
      emit(state.copyWith(status: TodoStatus.loaded, todos: todos));
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
