import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userToDo = "";
  List todo_list = [];

  @override
  void initState() {
    super.initState();
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 15)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Text('Main page')),
          ],
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _menuOpen, icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: todo_list.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todo_list[index]),
              child: Card(
                child: ListTile(
                  title: Text(todo_list[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.deepOrangeAccent,
                    ),
                    onPressed: (() {
                      setState(() {
                        todo_list.removeAt(index);
                      });
                    }),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: TextFormField(
                              initialValue: todo_list[index],
                              onChanged: (String value) {
                                _userToDo = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      todo_list[index] = _userToDo;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Сохранить')),
                            ],
                          );
                        });
                  },
                ),
              ),
              onDismissed: (direction) {
                //if(direction == DismissDirection.startToEnd)
                setState(() {
                  todo_list.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((BuildContext context) {
                return AlertDialog(
                  title: Text('Add new'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todo_list.add(_userToDo);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Добавить')),
                  ],
                );
              }));
        },
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add_box, color: Colors.white),
      ),
    );
  }
}
