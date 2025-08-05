import 'dart:convert';

import 'package:api_pratce1/model_class/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List <TodoModel> todo=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodos();
  }
/// data fatche in api to
  void getTodos() async{
    String url="https://dummyjson.com/todos";

    http.Response res=await http.get(Uri.parse(url));

    if (res.statusCode ==200){
      dynamic mData=jsonDecode(res.body);
      todo=TodoDataMode.fromJson(mData).todos;
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos"),),
      body:todo.isNotEmpty?ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) =>Card(
          child: ListTile(
            leading: Text("${todo[index].id}"),
            title: Text("${todo[index].todo}"),
            subtitle: Row(
              children: [
                Text("${todo[index].completed}"),
                SizedBox(width: 20,),
                Text("userId${todo[index].userId}")
              ],
            ),
          ),
        ),
      ): Center(
        child: Text("No Quotes yet!!"),
      ),
    );
  }
}
