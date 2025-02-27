// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventVO _$EventVOFromJson(Map<String, dynamic> json) => EventVO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  url: json['url'] as String,
);

// ignore: unused_element
Map<String, dynamic> _$EventVOToJson(EventVO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'url': instance.url,
};
