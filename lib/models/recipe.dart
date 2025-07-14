import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// models recipe_ request
class RecipeRequest {
  final int id;
  final String title;
  final List<Description> description;

  RecipeRequest({
    required this.id,
    required this.title,
    required this.description,
  });

  factory RecipeRequest.fromJson(Map<String, dynamic> json) {
    var attr = json['attributes'] ?? {};
    // var attributes = json['attributes'] ?? {};
    List<Description> descriptionList = (attr['description'] as List? ?? [])
        .map((desc) => Description.fromJson(desc))
        .toList();

    if (kDebugMode) {
      print(
        "Parsed Recipe: ${json['id']} - Descriptions: ${descriptionList.length}",
      );
    }

    return RecipeRequest(
      id: json['id'] ?? 0,
      title: attr['title'] ?? 'No title',
      description: descriptionList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description.map((desc) => desc.toJson()).toList(),
      // 'id': id
    };
  }
}

// step model

class Step {
  final String type;
  final List<TextContent> children;
  final int? level;

  Step({required this.type, required this.children, this.level});

  factory Step.fromJson(Map<String, dynamic> json) {
    var childrenList = json['children'] as List? ?? [];
    List<TextContent> parsedChildren = childrenList
        .map((child) => TextContent.fromJson(child))
        .toList();
    return Step(
      type: json['type'] ?? '',
      children: parsedChildren,
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'children': children.map((child) => child.toJson()).toList(),
      'level': level,
    };
  }
}

// description model

class Description {
  final String type;
  final List<TextContent> children;
  final int? level;

  Description({required this.type, required this.children, this.level});

  factory Description.fromJson(Map<String, dynamic> json) {
    var childrenList = json['children'] as List? ?? [];
    List<TextContent> parsedChildren = childrenList
        .map((child) => TextContent.fromJson(child))
        .toList();
    return Description(
      type: json['type'] ?? '',
      children: parsedChildren,
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'children': children.map((child) => child.toJson()).toList(),
      'level': level,
    };
  }
}

class TextContent {
  final String type;
  final String text;
  final bool? bold;

  TextContent({required this.type, required this.text, this.bold});

  factory TextContent.fromJson(Map<String, dynamic> json) {
    return TextContent(
      type: json['type'] ?? '',
      text: json['text'] ?? '',
      bold: json['bold'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'text': text, 'bold': bold};
  }
}

class Comment {
  final String content;
  final String author;
  final DateTime createdAt;

  Comment({
    required this.content,
    required this.author,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    var authorData = json['comment_author']?['data'] ?? {};
    return Comment(
      content: json['content'] ?? 'No content',
      author: authorData['username'] ?? 'Unknown',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'comment_author': author,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

//recipe model

class Recipe {
  final int id;
  final String title;
  final List<Description> description;
  final String ingredients;
  late int? likes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final List<Step> steps;
  late int commentCount;
  final List<Comment> comments;
  final String coverImageUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.steps,
    required this.commentCount,
    required this.comments,
    required this.coverImageUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Get attributes from Strapi structure

    // Parse descriptions
    List<Description> descriptionList = [];
    if (json['description'] != null && json['description'] is List) {
      descriptionList = (json['description'] as List)
          .map((desc) => Description.fromJson(desc))
          .toList();
    }

    // Parse steps
    List<Step> stepsList = [];
    if (json['steps'] != null && json['steps'] is List) {
      stepsList = (json['steps'] as List)
          .map((step) => Step.fromJson(step))
          .toList();
    }

    // Parse comments
    List<Comment> commentList = [];
    if (json['comments'] != null && json['comments'] is List) {
      commentList = (json['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList();
    }

    final String baseUrl = dotenv.env['BASE_URL']!;

    // Ensure image URL is correctly prefixed
    String coverImageUrl = '';
    if (json['cover'] != null &&
        json['cover'] is List &&
        (json['cover'] as List).isNotEmpty) {
      // Cover is an array, get the first image
      var coverItem = (json['cover'] as List)[0];
      var imageUrl = coverItem['url'];

      if (kDebugMode) {
        print('Found cover image URL: $imageUrl');
      }

      coverImageUrl = imageUrl.startsWith('http')
          ? imageUrl
          : baseUrl.replaceAll('/api', '') + imageUrl;
    } else if (json['cover'] != null && json['cover'] is Map) {
      // Handle single cover object (fallback)
      var imageUrl = json['cover']['url'];
      coverImageUrl = imageUrl.startsWith('http')
          ? imageUrl
          : baseUrl.replaceAll('/api', '') + imageUrl;
    }

    if (kDebugMode) {
      print('Final cover image URL: $coverImageUrl');
    }

    return Recipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title',
      description: descriptionList,
      ingredients: json['ingredients'] ?? 'No ingredients',
      likes: json['likes'] ?? 0,
      createdAt:
          DateTime.tryParse(
            json['createdAt'] ?? DateTime.now().toIso8601String(),
          ) ??
          DateTime.now(),
      updatedAt:
          DateTime.tryParse(
            json['updatedAt'] ?? DateTime.now().toIso8601String(),
          ) ??
          DateTime.now(),
      publishedAt:
          DateTime.tryParse(
            json['publishedAt'] ?? DateTime.now().toIso8601String(),
          ) ??
          DateTime.now(),
      steps: stepsList,
      commentCount: json['comment_count'] ?? commentList.length,
      comments: commentList,
      coverImageUrl: coverImageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description.map((desc) => desc.toJson()).toList(),
      'ingredients': ingredients,
      'likes': likes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'publishedAt': publishedAt.toIso8601String(),
      'steps': steps.map((step) => step.toJson()).toList(),
      'comment_count': commentCount,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'cover': coverImageUrl,
    };
  }
}
