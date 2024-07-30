import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoModelService {
  Box<TodoModel>? _todoBox;
  Future<void> openBox() async {
    _todoBox = await Hive.openBox<TodoModel>('todos');
  }

  Future<void> closeBox() async {
    await _todoBox!.close();
  }

  Future<void> addTodo(TodoModel todo) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.add(todo);
  }

  Future<List<TodoModel>> getTodos() async {
    if (_todoBox == null) {
      await openBox();
    }
    return _todoBox!.values.toList();
  }

  Future<void> updateTodos(int index, TodoModel todo) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.putAt(index, todo);
  }

  Future<void> deleteTodo(int index) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.deleteAt(index);
  }
}
