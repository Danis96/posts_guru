import 'package:json_annotation/json_annotation.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel {
  GeoModel({this.lat = '', this.lng = ''});

  factory GeoModel.fromJson(dynamic json) => _$GeoModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$GeoModelToJson(this);

  @JsonKey(name: 'lat', defaultValue: '')
  final String lat;
  @JsonKey(name: 'lng', defaultValue: '')
  final String lng;
}