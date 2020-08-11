import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  final Function addTdHandler;
  AddTodo(this.addTdHandler);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                controller: descriptionController,
              ),
              FlatButton(
                child: Text(
                  'Add Todo',
                  style: TextStyle(color: Colors.black),
                ),
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () {
                  addTdHandler(
                      titleController.text, descriptionController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
