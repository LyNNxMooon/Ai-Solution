
import 'package:json_annotation/json_annotation.dart';
part 'previous_solution_vo.g.dart';

@JsonSerializable()
class PreviousSolutionVO {
  final int id;
  final String name;
  final String url;
  final String description;
  @JsonKey(name: 'client_id')
  final int clientID;

  PreviousSolutionVO(
      {required this.id,
      required this.name,
      required this.url,
      required this.description,
      required this.clientID});

       factory PreviousSolutionVO.fromJson(Map<String, dynamic> json) =>
      _$PreviousSolutionVOFromJson(json);
}
