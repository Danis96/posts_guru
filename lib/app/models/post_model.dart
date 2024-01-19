import 'package:js_guru/app/models/comments_model.dart';
import 'package:js_guru/app/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  Post({this.id = 0, this.body = '', this.title = '', this.userID = 0, this.comments, this.user});

  factory Post.fromJson(dynamic json) => _$PostFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'body', defaultValue: '')
  final String body;
  User? user;
  @JsonKey(name: 'userId', defaultValue: 0)
  final int userID;
  List<CommentsModel>? comments;
}
