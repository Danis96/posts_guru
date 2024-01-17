// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int? ?? 0,
      body: json['body'] as String? ?? '',
      title: json['title'] as String? ?? '',
      userID: json['userId'] as int? ?? 0,
      comments: (json['comments'] as List<dynamic>?)
          ?.map(CommentsModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userID,
      'comments': instance.comments,
    };
