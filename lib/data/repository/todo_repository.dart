import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:test_pro/data/model/todo_model.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body)
          .map<TodoModel>((json) => TodoModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}