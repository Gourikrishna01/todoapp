import 'package:hive_flutter/adapters.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String desc;
  TodoModel({required this.title, required this.desc});
}
