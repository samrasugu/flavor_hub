import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flavor_hub/shared/widgets/buttons/primary_button.dart';
import 'package:flavor_hub/shared/widgets/common/recipe_card.dart';
import 'package:flavor_hub/shared/widgets/common/section_header.dart';
import 'package:flavor_hub/shared/widgets/recipe_quick_info_card.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RecipeBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(
          context,
        ).appBarTheme.iconTheme?.copyWith(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite action
            },
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Handle share action
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Icon(Icons.more_horiz, size: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'recipeImage',
              child: Stack(
                children: [
                  Image.network(
                    'https://images.pexels.com/photos/27969865/pexels-photo-27969865.jpeg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: double.infinity,
                  ),
                  // overlay gradient
                  Container(
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.2),
                          Colors.black.withValues(alpha: 0.4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Delicious Recipe Title',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            const Divider(height: 4, thickness: 1, indent: 16, endIndent: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/27969865/pexels-photo-27969865.jpeg',
                        ),
                        radius: 24,
                      ),
                      mediumHorizontalSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Chef Name',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            '@chef_username',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),

                  PrimaryButton(text: 'Follow', type: ButtonType.primary),
                ],
              ),
            ),

            const Divider(height: 4, thickness: 1, indent: 16, endIndent: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recipe Description: This is a brief description of the recipe. It includes the main ingredients and cooking instructions.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RecipeQuickInfoCard(
                      icon: Icons.timer,
                      title: '30 mins',
                      subtitle: 'Prep Time',
                    ),
                  ),
                  smallHorizontalSizedBox,
                  Expanded(
                    child: RecipeQuickInfoCard(
                      icon: Icons.restaurant_menu,
                      title: '4 servings',
                      subtitle: 'Servings',
                    ),
                  ),
                  smallHorizontalSizedBox,
                  Expanded(
                    child: RecipeQuickInfoCard(
                      icon: Icons.star,
                      title: '4.5',
                      subtitle: 'Rating',
                    ),
                  ),
                ],
              ),
            ),

            mediumVerticalSizedBox,

            const Divider(height: 4, thickness: 1, indent: 16, endIndent: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '1. Ingredient One\n2. Ingredient Two\n3. Ingredient Three',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            mediumVerticalSizedBox,

            const Divider(height: 4, thickness: 1, indent: 16, endIndent: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SectionHeader(title: moreRecipesLikeThis),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.6,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
