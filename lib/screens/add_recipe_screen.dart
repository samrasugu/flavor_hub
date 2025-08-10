import 'package:flutter/material.dart';
import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flavor_hub/shared/widgets/inputs/custom_text_input.dart';
import 'package:flavor_hub/shared/widgets/buttons/primary_button.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _prepTimeController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _servingsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    _prepTimeController.dispose();
    _cookTimeController.dispose();
    _servingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: 'Add New Recipe',
        actions: [
          TextButton(
            onPressed: () {
              _saveRecipe();
            },
            child: Text(
              'Save',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Image Upload Section
                _buildImageUploadSection(),
                largeVerticalSizedBox,

                // Basic Information
                Text('Basic Information', style: AppTextStyles.header3),
                mediumVerticalSizedBox,

                CustomTextInput(
                  controller: _titleController,
                  labelText: 'Recipe Title',
                  hintText: 'Enter recipe title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a recipe title';
                    }
                    return null;
                  },
                ),
                mediumVerticalSizedBox,

                CustomTextInput(
                  controller: _descriptionController,
                  labelText: 'Description',
                  hintText: 'Describe your recipe',
                  maxLines: 3,
                ),
                largeVerticalSizedBox,

                // Recipe Details
                Text('Recipe Details', style: AppTextStyles.header3),
                mediumVerticalSizedBox,

                Row(
                  children: [
                    Expanded(
                      child: CustomTextInput(
                        controller: _prepTimeController,
                        labelText: 'Prep Time (min)',
                        hintText: '30',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextInput(
                        controller: _cookTimeController,
                        labelText: 'Cook Time (min)',
                        hintText: '45',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                mediumVerticalSizedBox,

                CustomTextInput(
                  controller: _servingsController,
                  labelText: 'Servings',
                  hintText: '4',
                  keyboardType: TextInputType.number,
                ),
                largeVerticalSizedBox,

                // Ingredients
                Text('Ingredients', style: AppTextStyles.header3),
                mediumVerticalSizedBox,

                CustomTextInput(
                  controller: _ingredientsController,
                  labelText: 'Ingredients',
                  hintText: 'List ingredients (one per line)',
                  maxLines: 8,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add ingredients';
                    }
                    return null;
                  },
                ),
                largeVerticalSizedBox,

                // Instructions
                Text('Instructions', style: AppTextStyles.header3),
                mediumVerticalSizedBox,

                CustomTextInput(
                  controller: _instructionsController,
                  labelText: 'Cooking Instructions',
                  hintText: 'Step-by-step instructions',
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add cooking instructions';
                    }
                    return null;
                  },
                ),
                largeVerticalSizedBox,

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    type: ButtonType.primary,
                    text: 'Publish Recipe',
                    onPressed: _saveRecipe,
                  ),
                ),
                mediumVerticalSizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderLightGray,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 48,
            color: AppColors.textMediumGray,
          ),
          mediumVerticalSizedBox,
          Text(
            'Add Recipe Photo',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textMediumGray,
            ),
          ),
          smallVerticalSizedBox,
          TextButton(
            onPressed: () {
              // TODO: Handle image upload
              _selectImage();
            },
            child: Text(
              'Choose from Gallery',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primaryOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectImage() {
    // TODO: Implement image selection
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image selection coming soon!')),
    );
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement recipe saving logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recipe saved successfully!'),
          backgroundColor: AppColors.accentGreen,
        ),
      );

      // Optionally navigate back or to a different screen
      Navigator.of(context).pop();
    }
  }
}
