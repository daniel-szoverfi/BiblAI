import 'package:flutter_fe/models/comment_model.dart';
import 'package:flutter_fe/models/verse_model.dart';

class Post{
  final String userName;
  final int userId;
  List<PostInfo>? posts;

  Post({
    required this.userName,
    required this.userId,
    this.posts
  });

  //arra van hogy atalakitsa a usernek
  toMap() {}

}

class PostInfo{
  late final int id;
  late String userName;
  late String question;
  late String answer;
  late int userId;
  late String profilePictureUrl;
  late int numLikes;
  late int numDisLikes;
  late int commentsNum;
  late final bool anonym;
  late List<Comment>? comments = [];
  late String date;
  late bool likedByUser;
  late bool dislikedByUser;
  late List<Verse> verses = [];

  PostInfo({
    required this.id,
    required this.question,
    required this.answer,
    required this.anonym,
    required this.userName,
    required this.userId,
    required this.profilePictureUrl,
    required this.date,
    required this.commentsNum,
    this.comments,
    required this.numLikes,
    required this.numDisLikes,
    required this.likedByUser,
    required this.dislikedByUser,
    required this.verses
  });
  
  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    map["id"] = id;
    map["question"] = question;
    map["answer"] = answer;
    map["anonym"] = anonym;
    map["userName"] = userName;
    map["userId"] = userId;
    map["profilePictureUrl"] = profilePictureUrl;
    map["date"] = date;
    map["commentsNum"] = commentsNum;
    map["comments"] = comments?.map((comment) => comment.toMap()).toList();
    map["numLikes"] = numLikes;
    map["numDislikes"] = numDisLikes;
    map["likedByUser"] = likedByUser;
    map["dislikedByUser"] = dislikedByUser;
    map["verses"] = verses.map((verses) => verses.toMap()).toList();
    return map;
  }


  PostInfo.fromJson(dynamic o) {
    this.id = o["id"] as int;
    this.question = o["question"] as String;
    this.answer = o["answer"] as String;
    this.anonym = o["anonym"] as bool;
    this.userName = o["userName"] as String;
    this.userId = o["userId"] as int;
    this.profilePictureUrl = o["profilePictureUrl"] as String;
    this.date = o["date"] as String;
    this.commentsNum = o["commentsNum"] as int;
    this.numLikes = o["numLikes"] as int; 
    this.numDisLikes = o["numDislikes"] as int; 
    this.likedByUser = o["likedByUser"] as bool? ?? false; 
    this.dislikedByUser = o["dislikedByUser"] as bool? ?? false; 

    this.comments = o["comments"] != null ? List<Comment>.from(o["comments"].map((comment) => Comment.fromJson(comment))) : [];
    this.verses = o["verses"] != null ? List<Verse>.from(o["verses"].map((vers) => Verse.fromJson(vers))) : [];
  }

}