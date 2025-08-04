import 'dart:convert';
class UserModel {
  int id;
  String fullName;
  String username;

  UserModel({
    required this.id,
    required this.fullName,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
    );
  }
}

class CommentModel {
  int id;
  int likes;
  int postId;
  String body;
  UserModel user;

  CommentModel({
    required this.id,
    required this.postId,
    required this.likes,
    required this.body,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['postId'],
      likes: json['likes'],
      body: json['body'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
class CommentDataModel {
  int limit;
  int skip;
  int total;
  List<CommentModel> comments;

  CommentDataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.comments,
  });

  factory CommentDataModel.fromJson(Map<String, dynamic> json) {
    List<CommentModel> mComment = [];
    for (Map<String, dynamic> eachComment in json['comments']) {
      mComment.add(CommentModel.fromJson(eachComment));
    }
    return CommentDataModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      comments: mComment,
    );
  }
}


/*
class UserModel{
  int id;
  String fullName;
  String username;

  UserModel({
    required this.id,
    required this.fullName,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
    );
  }

}

class CommentModel{
  int id;
  int likes;
  int postId;
  String body;
  List<UserModel>user;

  CommentModel({required this.id,required this.postId,required this.likes,required this.body,required this.user});

  factory CommentModel.fromJson(Map<String,dynamic>json){
    List<UserModel> mUsers=[];
    for( Map<String,dynamic> eachUser in json['user']){
      mUsers.add(UserModel.fromJson(eachUser));
    }

    return CommentModel(
        id: json['id'],
        postId: json['postId'],
        likes: json['likes'],
        body: json['body'],
        user: mUsers);
  }
}
class CommentDataModel{
  int limit;
  int skip;
  int total;
  List<CommentModel> comments;

  CommentDataModel({required this.total,required this.skip,required this.limit,required this.comments});

  factory CommentDataModel.fromJson(Map<String,dynamic> json){
    List<CommentModel> mComment=[];
    for( Map<String,dynamic> eachComment in json['comments']){
      mComment.add(CommentModel.fromJson(eachComment));
    }
    return CommentDataModel(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        comments: mComment);
  }

}*/
