// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      albumID: json['albumId'] as int? ?? 0,
      thumbnail: json['thumbnailUrl'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'albumId': instance.albumID,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnail,
    };
