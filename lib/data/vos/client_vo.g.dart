// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientVO _$ClientVOFromJson(Map<String, dynamic> json) => ClientVO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  url: json['url'] as String,
);

// ignore: unused_element
Map<String, dynamic> _$ClientVOToJson(ClientVO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
};
