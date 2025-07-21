import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
abstract class Comment with _$Comment {
  factory Comment({
    @JsonKey(name: 'content') required String content,
    // Custom parsing for author to handle nested structure
    @JsonKey(name: 'author')
    required String author, // Will be filled by custom fromJson
    @JsonKey(name: 'createdAt') required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) {
    // Manual parsing for nested author data
    var authorData = json['comment_author']?['data'] ?? {};
    return Comment(
      content: json['content'] ?? 'No content',
      author: authorData['username'] ?? 'Unknown',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  factory Comment.initial() {
   return Comment(content: '', author: 'Unknown', createdAt: DateTime.now());
  }
}
