import 'package:json_annotation/json_annotation.dart';
part 'country_vo.g.dart';

@JsonSerializable()
class CountryVO {
  final int id;
  final String name;

  CountryVO({required this.id, required this.name});

  factory CountryVO.fromJson(Map<String, dynamic> json) =>
      _$CountryVOFromJson(json);
}
