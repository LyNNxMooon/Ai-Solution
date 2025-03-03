import 'package:json_annotation/json_annotation.dart';
part 'feedback_vo.g.dart';

@JsonSerializable()
class FeedbackVO {
  final int id;
  final String name;
  final String body;

  FeedbackVO({required this.id, required this.name, required this.body});

  factory FeedbackVO.fromJson(Map<String, dynamic> json) =>
      _$FeedbackVOFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackVOToJson(this);
}
