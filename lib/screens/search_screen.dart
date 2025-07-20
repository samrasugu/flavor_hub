import 'package:flutter/material.dart';
import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flavor_hub/shared/widgets/inputs/custom_text_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RecipeBar(title: 'Search Recipes'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextInput(
                controller: _searchController,
                hintText: 'Search for recipes...',
                prefixIcon: const Icon(Icons.search),
                onChanged: (value) {
                  // Handle search logic
                },
              ),
              const SizedBox(height: 16),
              Text('Recent Searches', style: AppTextStyles.header3),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Text(
                    'Start typing to search for recipes',
                    style: AppTextStyles.bodyMedium,
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
