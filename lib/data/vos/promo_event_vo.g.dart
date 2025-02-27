// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'promo_event_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoEventVO _$PromoEventVOFromJson(Map<String, dynamic> json) => PromoEventVO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$PromoEventVOToJson(PromoEventVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
    };
