// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      id: json['id'] as int? ?? 0,
      body: json['body'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      postID: json['postId'] as int? ?? 0,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postID,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
