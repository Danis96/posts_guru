import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  ImageModel({this.id = 0, this.title = '', this.albumID = 0, this.thumbnail = '', this.url = ''});

  factory ImageModel.fromJson(dynamic json) => _$ImageModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'albumId', defaultValue: 0)
  final int albumID;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'url', defaultValue: '')
  final String url;
  @JsonKey(name: 'thumbnailUrl', defaultValue: '')
  final String thumbnail;
}