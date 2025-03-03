// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingVO _$RatingVOFromJson(Map<String, dynamic> json) => RatingVO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  rate: (json['rate'] as num).toInt(),
);

Map<String, dynamic> _$RatingVOToJson(RatingVO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'rate': instance.rate,
};
