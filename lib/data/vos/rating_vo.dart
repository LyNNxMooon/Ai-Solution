import 'package:json_annotation/json_annotation.dart';
part 'rating_vo.g.dart';

@JsonSerializable()
class RatingVO {
  final int id;
  final String name;
  final int rate;

  RatingVO({required this.id, required this.name, required this.rate});

  factory RatingVO.fromJson(Map<String, dynamic> json) =>
      _$RatingVOFromJson(json);

  Map<String, dynamic> toJson() => _$RatingVOToJson(this);
}
