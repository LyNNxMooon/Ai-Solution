import 'package:json_annotation/json_annotation.dart';
part 'event_vo.g.dart';

@JsonSerializable()
class EventVO {
  final int id;
  final String name;
  final String description;
  final String url;

  EventVO(
      {required this.id,
      required this.name,
      required this.description,
      required this.url});

  factory EventVO.fromJson(Map<String, dynamic> json) =>
      _$EventVOFromJson(json);
}
