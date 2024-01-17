import 'package:js_guru/app/models/address_model.dart';
import 'package:js_guru/app/models/company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  User({this.id = 0, this.email = '', this.name = '', this.username = '', this.address, this.company, this.phone = '', this.website = ''});

  factory User.fromJson(dynamic json) => _$UserFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'phone', defaultValue: '')
  final String phone;
  @JsonKey(name: 'website', defaultValue: '')
  final String website;
  final Address? address;
  final Company? company;
}
