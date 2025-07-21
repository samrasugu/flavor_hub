import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_content.freezed.dart';
part 'text_content.g.dart';

@freezed
abstract class TextContent with _$TextContent {
  factory TextContent({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'text') required String text,
    @JsonKey(name: 'bold') bool? bold,
  }) = _TextContent;
  factory TextContent.fromJson(Map<String, dynamic> json) =>
      _$TextContentFromJson(json);

  factory TextContent.initial() {
    return TextContent(type: 'text', text: '', bold: false);
  }
}
