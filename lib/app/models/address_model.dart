import 'package:js_guru/app/models/geo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';


@JsonSerializable()
class Address {
  Address({this.city = '', this.geoModel, this.street = '', this.suite = '', this.zipcode = ''});

  factory Address.fromJson(dynamic json) => _$AddressFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @JsonKey(name: 'street', defaultValue: '')
  final String street;

  @JsonKey(name: 'suite', defaultValue: '')
  final String suite;
  @JsonKey(name: 'city', defaultValue: '')
  final String city;
  @JsonKey(name: 'zipcode', defaultValue: '')
  final String zipcode;
  @JsonKey(name: 'geo')
  final GeoModel? geoModel;
}