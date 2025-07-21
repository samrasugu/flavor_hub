import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flavor_hub/models/text_content/text_content.dart';

part 'step.freezed.dart';
part 'step.g.dart';

@freezed
abstract class Step with _$Step {
  factory Step({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'children') required List<TextContent> children,
    @JsonKey(name: 'level') int? level,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  factory Step.initial() {
    return Step(type: 'step', children: [], level: null);
  }
}
