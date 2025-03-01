import 'package:json_annotation/json_annotation.dart';
part 'gallery_vo.g.dart';

@JsonSerializable()
class GalleryVO {
  final int id;
  final String name;
  final String description;
  final String url;

  GalleryVO(
      {required this.id,
      required this.name,
      required this.description,
      required this.url});

  factory GalleryVO.fromJson(Map<String, dynamic> json) =>
      _$GalleryVOFromJson(json);
}
