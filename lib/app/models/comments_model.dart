import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel {
  CommentsModel({this.id = 0, this.body = '', this.email = '', this.name = '', this.postID = 0});

  factory CommentsModel.fromJson(dynamic json) => _$CommentsModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);

  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'postId', defaultValue: 0)
  final int postID;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'body', defaultValue: '')
  final String body;
}