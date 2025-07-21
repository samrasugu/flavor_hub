import 'package:flavor_hub/models/comment/comment.dart';
import 'package:flavor_hub/models/description/description.dart';
import 'package:flavor_hub/models/step/step.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  factory Recipe({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required List<Description> description,
    @JsonKey(name: 'ingredients') required String ingredients,
    @JsonKey(name: 'likes') int? likes,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @JsonKey(name: 'publishedAt') required DateTime publishedAt,
    @JsonKey(name: 'steps') required List<Step> steps,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'comments') required List<Comment> comments,
    // coverImageUrl needs special handling due to URL prefixing and nested structure
    // We'll define a custom getter for this.
    // The raw 'cover' JSON can be parsed into a dynamic or another Freezed class if needed.
    // For simplicity, we'll omit a direct @JsonKey for coverImageUrl and use a custom fromJson.
    @Default('') String coverImageUrl, // Initialize with a default empty string
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Get attributes from Strapi structure - assuming top-level attributes for the Recipe itself
    // If the entire Recipe is nested under 'data' and 'attributes', you'd need to adjust the initial parsing.
    var attributes =
        json['attributes'] ??
        json; // Fallback to direct json if no 'attributes'

    // Parse descriptions
    List<Description> descriptionList = [];
    if (attributes['description'] != null &&
        attributes['description'] is List) {
      descriptionList = (attributes['description'] as List)
          .map((desc) => Description.fromJson(desc))
          .toList();
    }

    // Parse steps
    List<Step> stepsList = [];
    if (attributes['steps'] != null && attributes['steps'] is List) {
      stepsList = (attributes['steps'] as List)
          .map((step) => Step.fromJson(step))
          .toList();
    }

    // Parse comments
    List<Comment> commentList = [];
    if (attributes['comments'] != null && attributes['comments'] is List) {
      commentList = (attributes['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList();
    }

    final String baseUrl = dotenv.env['BASE_URL']!;

    // Ensure image URL is correctly prefixed
    String coverImageUrl = '';
    if (attributes['cover'] != null) {
      if (attributes['cover'] is List &&
          (attributes['cover'] as List).isNotEmpty) {
        // Cover is an array, get the first image
        var coverItem = (attributes['cover'] as List)[0];
        var imageUrl = coverItem['url'];

        if (kDebugMode) {
          print('Found cover image URL (list): $imageUrl');
        }

        if (imageUrl != null) {
          coverImageUrl = imageUrl.startsWith('http')
              ? imageUrl
              : baseUrl.replaceAll('/api', '') + imageUrl;
        }
      } else if (attributes['cover'] is Map) {
        // Handle single cover object
        var imageUrl = attributes['cover']['url'];
        if (imageUrl != null) {
          coverImageUrl = imageUrl.startsWith('http')
              ? imageUrl
              : baseUrl.replaceAll('/api', '') + imageUrl;
        }
      }
    }

    if (kDebugMode) {
      print('Final cover image URL: $coverImageUrl');
    }

    return Recipe(
      id: json['id'] ?? 0, // ID is usually at the top level in Strapi responses
      title: attributes['title'] ?? 'No title',
      description: descriptionList,
      ingredients: attributes['ingredients'] ?? 'No ingredients',
      likes: attributes['likes'] ?? 0,
      createdAt:
          DateTime.tryParse(
            attributes['createdAt'] ?? DateTime.now().toIso8601String(),
          ) ??
          DateTime.now(),
      updatedAt:
          DateTime.tryParse(
            attributes['updatedAt'] ?? DateTime.now().toIso8601String(),
          ) ??
          DateTime.now(),
      publishedAt:
          DateTime.tryParse(
            attributes['publishedAt'] ?? DateTime.now().toIso8601String(),
          ) ??
          DateTime.now(),
      steps: stepsList,
      commentCount: attributes['comment_count'] ?? commentList.length,
      comments: commentList,
      coverImageUrl: coverImageUrl,
    );
  }
}
