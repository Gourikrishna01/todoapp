import 'package:flutter/material.dart';
import 'package:todo_app/Service/todo_model_service.dart';

import '../models/todo_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  final TodoModelService _todoModelService = TodoModelService();
  List<TodoModel> _todos = [];
  Future<void> _loadsTodo() async {
    _todos = await _todoModelService.getTodos();
    setState(() {});
  }

  @override
  void initState() {
    _loadsTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TaskPulse",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home),
        actions: [
          CircleAvatar(
            child: Image.network(
                "https://www.366icons.com/media/01/profile-avatar-account-icon-16699.png"),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogBox();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  print("clicked");
                },
                title: Text("${todo.title}"),
                subtitle: Text("${todo.desc}"),
                leading: IconButton(
                    onPressed: () {
                      _EditDialogBox();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showDialogBox() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Task"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "title",
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _descController,
                    decoration: InputDecoration(hintText: "desc"),
                    keyboardType: TextInputType.name,
                  ),
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  final newmodel = TodoModel(
                      title: _titleController.text, desc: _descController.text);
                  await _todoModelService.addTodo(newmodel);
                  _titleController.clear();
                  _descController.clear();
                  Navigator.pop(context);
                  _loadsTodo();
                },
                child: Text("submit")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancel"))
          ],
        );
      },
    );
  }

  Future<void> _EditDialogBox() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Task"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "title",
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "desc"),
                    keyboardType: TextInputType.name,
                  ),
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(onPressed: () {}, child: Text("update")),
            ElevatedButton(onPressed: () {}, child: Text("cancel"))
          ],
        );
      },
    );
  }
}
