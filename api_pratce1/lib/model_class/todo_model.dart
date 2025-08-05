class TodoModel{
  int id;
  int userId;
  bool completed;
  String todo;

  TodoModel({required this.id ,required this.userId,required this.completed,required this.todo});
  ///fromjson
  factory TodoModel.fromJson(Map<String,dynamic>json){
    return TodoModel(
        id: json['id'],
        userId: json['userId'],
        completed: json['completed'],
        todo: json['todo']);
  }
}

class TodoDataMode{
  int limit;
  int skip;
  int total;
  List<TodoModel>todos;
  TodoDataMode({required this.limit,required this.skip,required this.total,required this.todos});

  factory TodoDataMode.fromJson(Map<String,dynamic>json){
    List<TodoModel> mTodo=[];
    for(Map<String,dynamic> eachTodo in json['todos']){
      mTodo.add(TodoModel.fromJson(eachTodo));
    }
    return TodoDataMode(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        todos: mTodo);
  }
}