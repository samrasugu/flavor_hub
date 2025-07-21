import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flavor_hub/models/description/description.dart';

part 'recipe_request.freezed.dart';
part 'recipe_request.g.dart';

@freezed
abstract class RecipeRequest with _$RecipeRequest {
  factory RecipeRequest({
    required int id,
    required String title,
    @Default([]) List<Description> description,
  }) = _RecipeRequest;

  // Custom fromJson to handle Strapi structure
  factory RecipeRequest.fromJson(Map<String, dynamic> json) {
    // Handle nested attributes structure from Strapi
    var attr = json['attributes'] ?? json;

    // Parse description list
    List<Description> descriptionList = [];
    if (attr['description'] != null && attr['description'] is List) {
      descriptionList = (attr['description'] as List)
          .map((desc) => Description.fromJson(desc))
          .toList();
    }

    if (kDebugMode) {
      print(
        "Parsed RecipeRequest: ${json['id']} - Descriptions: ${descriptionList.length}",
      );
    }

    return RecipeRequest(
      id: json['id'] ?? 0,
      title: attr['title'] ?? 'No title',
      description: descriptionList,
    );
  }

  factory RecipeRequest.initial() =>
      RecipeRequest(id: 0, title: '', description: []);
}
