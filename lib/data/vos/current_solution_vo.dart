import 'package:json_annotation/json_annotation.dart';
part 'current_solution_vo.g.dart';

@JsonSerializable()
class CurrentSolutionVO {
  final int id;
  final String name;
  final String url;
  final String description;

  CurrentSolutionVO(
      {required this.id,
      required this.name,
      required this.url,
      required this.description});

  factory CurrentSolutionVO.fromJson(Map<String, dynamic> json) =>
      _$CurrentSolutionVOFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentSolutionVOToJson(this);
}
