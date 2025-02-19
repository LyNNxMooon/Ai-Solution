// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'client_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientVO _$ClientVOFromJson(Map<String, dynamic> json) => ClientVO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ClientVOToJson(ClientVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
