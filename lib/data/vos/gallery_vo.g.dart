// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'gallery_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryVO _$GalleryVOFromJson(Map<String, dynamic> json) => GalleryVO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$GalleryVOToJson(GalleryVO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'url': instance.url,
};
