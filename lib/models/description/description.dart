import 'package:flavor_hub/models/text_content/text_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'description.freezed.dart';
part 'description.g.dart';

@freezed
abstract class Description with _$Description {
  factory Description({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'children') @Default([]) List<TextContent> children,
    @JsonKey(name: 'level') int? level,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  factory Description.initial() {
    return Description(type: 'description', children: [], level: null);
  }
}
