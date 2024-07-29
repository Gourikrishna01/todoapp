import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  print("clicked");
                },
                title: Text("flutter"),
                subtitle: Text("material app"),
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
            ElevatedButton(onPressed: () {}, child: Text("submit")),
            ElevatedButton(onPressed: () {}, child: Text("cancel"))
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
