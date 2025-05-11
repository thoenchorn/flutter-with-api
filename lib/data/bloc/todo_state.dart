part of 'todo_cubit.dart';

  enum TodoStatus { initial, loading, loaded, error }

  class TodoState extends Equatable {
    const TodoState({
      this.status = TodoStatus.initial,
      this.todos = const [],
      this.errorMessage,
    });

    final TodoStatus status;
    final List<TodoModel> todos;
    final String? errorMessage;

    //copyWith method is used to create a new instance of the class with some properties changed
    TodoState copyWith({
      TodoStatus? status,
      List<TodoModel>? todos,
      String? errorMessage,
    }) {
      return TodoState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        errorMessage: errorMessage ?? this.errorMessage,
      );
    }

    @override
    List<Object?> get props => [status, todos, errorMessage];
  }