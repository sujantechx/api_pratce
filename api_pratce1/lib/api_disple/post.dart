import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_pratce1/model_class/post_model.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late Future<PostDataModel> postDataFuture;

  @override
  void initState() {
    super.initState();
    postDataFuture = getPost(); // ✅ assign future here
  }

  /// ✅ get post data from API and return Future<PostDataModel>
  Future<PostDataModel> getPost() async {
    const String url = 'https://dummyjson.com/posts';
    final http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final dynamic mData = jsonDecode(res.body);
      return PostDataModel.fromJson(mData);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Data UI")),
      body: FutureBuilder<PostDataModel>(
        future: postDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.posts.isEmpty) {
            return const Center(child: Text('No posts found'));
          } else {
            final posts = snapshot.data!.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.thumb_up, color: Colors.green, size: 18),
                        Text('${post.reactions.likes}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
