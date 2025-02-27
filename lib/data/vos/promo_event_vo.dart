import 'package:json_annotation/json_annotation.dart';
part 'promo_event_vo.g.dart';

@JsonSerializable()
class PromoEventVO {
  final int id;
  final String name;
  final String description;
  final String url;

  PromoEventVO(
      {required this.id,
      required this.name,
      required this.description,
      required this.url});

  factory PromoEventVO.fromJson(Map<String, dynamic> json) =>
      _$PromoEventVOFromJson(json);
}
