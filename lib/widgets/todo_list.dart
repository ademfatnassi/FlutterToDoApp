import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> _todoList;
  final Function _deleteHandler;

  TodoList(this._todoList, this._deleteHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _todoList.length == 0
          ? Column(
              children: <Widget>[
                Text(
                  'No Todo to Todo :^)',
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                      title: Text(
                        _todoList[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _todoList[index].description,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          Text(
                            DateFormat.yMMMMd().format(
                              _todoList[index].date,
                            ),
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      ),
                      trailing: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit, size: 45),
                              onPressed: () {
                                print('prep pep..');
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_forever, size: 45),
                              onPressed: () {
                                _deleteHandler(_todoList[index].id);
                              },
                            ),
                          ],
                        ),
                      )),
                );
              },
              itemCount: _todoList.length,
            ),
    );
  }
}
