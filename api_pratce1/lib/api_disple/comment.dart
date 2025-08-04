import 'dart:convert';
import 'package:api_pratce1/model_class/comment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Comment extends StatefulWidget {
   Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<CommentModel> comment=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }
  void getComments()async{
  String url="https://dummyjson.com/comment";

  http.Response res=await http.get(Uri.parse(url));

  if(res.statusCode ==200 ){
    dynamic mData=jsonDecode(res.body);
    comment=CommentDataModel.fromJson(mData).comments;}

  setState(() {
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: comment.isNotEmpty? ListView.builder(
        itemCount: comment.length,
          itemBuilder: (context, index)=>Card(
            child: ListTile(
              title: Text("Comment Id:${comment[index].id}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Post ID: ${comment[index].postId}"),
                  Text("Likes: ${comment[index].likes}"),
                  Text("Body: ${comment[index].body}"),
                ],
              ),
            ),

          )
      ):Center(child: Text("No Comments yet!!"),)
    );
  }
}
