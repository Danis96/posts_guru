import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class Company {
  Company({this.name = '', this.bs = '', this.catchPhrase = ''});

  factory Company.fromJson(dynamic json) => _$CompanyFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'catchPhrase', defaultValue: '')
  final String catchPhrase;
  @JsonKey(name: 'bs', defaultValue: '')
  final String bs;
}