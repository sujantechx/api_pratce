class Reaction{
  int dislikes;
  int likes;

  Reaction({required this.likes,required this.dislikes});

  factory Reaction.formJson(Map<String,dynamic>json){
    return Reaction(likes: json['likes'], dislikes: json['dislikes']);
  }
}

class PostModel{
  int id;
  String title;
  String body;
  List<String> tags;
  Reaction reactions;
  int views;
  int userId;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
    required this.userId
  });

  factory PostModel.formJson(Map<String,dynamic>json){
    return PostModel(
      id: json['id'],
        title: json['title'],
        body: json['body'],
        tags: List<String>.from(json['tags']),
        reactions: Reaction.formJson(json['reactions']),
        views: json['views'],
        userId: json['userId']
    );
  }
}

class PostDataModel{
  int limit;
  int skip;
  int total;
  List<PostModel> posts;

  PostDataModel({
    required this.limit,
    required this.total,
    required this.skip,
    required this.posts
});

  factory PostDataModel.fromJson(Map<String,dynamic>json){
    List<PostModel> mPost=[];
    for(Map<String,dynamic> eachPost in json['posts']){
      mPost.add(PostModel.formJson(eachPost));
    }
    return PostDataModel(
        limit: json['limit'],
        total:json['total'],
        skip: json['skip'],
        posts: mPost
    );
  }
}