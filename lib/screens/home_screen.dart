import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/data/mock_data.dart';
import 'package:flavor_hub/models/recipe.dart';
import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flavor_hub/shared/widgets/common/recipe_card.dart';
import 'package:flavor_hub/shared/widgets/common/section_header.dart';
import 'package:flavor_hub/shared/widgets/hero_banner_card.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recentRecipesData = MockData.recentRecipes;
    final List<Recipe> yourRecipesData = MockData.yourRecipes;

    return Scaffold(
      appBar: RecipeBar(
        title: 'FlavorHub',
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeroBannerCard(),
              mediumVerticalSizedBox,
              SectionHeader(title: recentRecipes, onMorePressed: () {}),
              smallVerticalSizedBox,
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: recentRecipesData.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final recipe = recentRecipesData[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: RecipeCard(
                        title: recipe.title,
                        imageUrl: recipe.coverImageUrl,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/recipeDetails',
                            arguments: recipe,
                          );
                        },
                        author: MockData.getChefNameById(recipe.id),
                      ),
                    );
                  },
                ),
              ),
              mediumVerticalSizedBox,
              SectionHeader(title: yourRecipes, onMorePressed: () {}),
              smallVerticalSizedBox,
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: yourRecipesData.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final recipe = yourRecipesData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/recipeDetails',
                          arguments: recipe,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: RecipeCard(
                          title: recipe.title,
                          imageUrl: recipe.coverImageUrl,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/recipeDetails',
                              arguments: recipe,
                            );
                          },
                          author: MockData.getChefNameById(recipe.id),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
