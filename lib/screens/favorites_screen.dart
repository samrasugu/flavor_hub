import 'package:flavor_hub/shared/widgets/common/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flavor_hub/components/app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RecipeBar(title: 'Favorites'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 0.75,
                        ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/recipeDetails');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: RecipeCard(
                            title: 'Recipe $index',
                            imageUrl:
                                'https://images.pexels.com/photos/27969865/pexels-photo-27969865.jpeg',
                            onTap: () {
                              // Handle recipe tap
                            },
                            author: 'Chef $index',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
