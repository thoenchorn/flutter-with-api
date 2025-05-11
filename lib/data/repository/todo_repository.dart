import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:test_pro/data/model/todo_model.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com/todos'; // Replace with your API endpoint URL

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse(baseUrl)); // Make a GET request to the API endpoint
    if (response.statusCode == 200) { // Check if the response was successful
      final todos = convert.jsonDecode(response.body); // Decode the response body as JSON
      return todos.map<TodoModel>((json) => TodoModel.fromJson(json)).toList(); // Convert the JSON to TodoModel objects

    } else {
      throw Exception('Failed to load todos'); // Throw an exception if the response was not successful
    }
  }
}