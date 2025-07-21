import 'package:flavor_hub/models/recipe.dart';

class MockData {
  static const List<String> _chefNames = [
    'Chef Maria Rodriguez',
    'Chef Giovanni Rossi',
    'Chef Akira Tanaka',
    'Chef Sophie Laurent',
    'Chef Marcus Johnson',
    'Chef Isabella Chen',
    'Chef Ahmed Hassan',
    'Chef Emma Thompson',
    'Chef Carlos Mendoza',
    'Chef Priya Sharma',
    'Chef Oliver Schmidt',
    'Chef Lucia Moretti',
    'Chef James Wilson',
    'Chef Fatima Al-Rashid',
    'Chef Viktor Petrov',
  ];

  static List<Recipe> get mockRecipes => [
    Recipe(
      id: 1,
      title: 'Spicy Chicken Tacos',
      description: [],
      ingredients: 'Chicken, Tortillas, Peppers, Onions, Spices',
      likes: 124,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
      steps: [],
      commentCount: 23,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/2955819/pexels-photo-2955819.jpeg',
    ),
    Recipe(
      id: 2,
      title: 'Mediterranean Pasta',
      description: [],
      ingredients: 'Pasta, Olives, Tomatoes, Feta, Olive Oil',
      likes: 87,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      publishedAt: DateTime.now().subtract(const Duration(days: 3)),
      steps: [],
      commentCount: 15,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg',
    ),
    Recipe(
      id: 3,
      title: 'Chocolate Chip Cookies',
      description: [],
      ingredients: 'Flour, Butter, Sugar, Chocolate Chips, Eggs',
      likes: 203,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 12)),
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
      steps: [],
      commentCount: 45,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg',
    ),
    Recipe(
      id: 4,
      title: 'Asian Stir Fry',
      description: [],
      ingredients: 'Vegetables, Soy Sauce, Ginger, Garlic, Rice',
      likes: 156,
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      publishedAt: DateTime.now().subtract(const Duration(days: 4)),
      steps: [],
      commentCount: 31,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/1410235/pexels-photo-1410235.jpeg',
    ),
    Recipe(
      id: 5,
      title: 'Classic Caesar Salad',
      description: [],
      ingredients: 'Romaine, Croutons, Parmesan, Caesar Dressing',
      likes: 92,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      publishedAt: DateTime.now().subtract(const Duration(days: 5)),
      steps: [],
      commentCount: 18,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/1213710/pexels-photo-1213710.jpeg',
    ),
    Recipe(
      id: 6,
      title: 'BBQ Pulled Pork',
      description: [],
      ingredients: 'Pork Shoulder, BBQ Sauce, Spices, Buns',
      likes: 178,
      createdAt: DateTime.now().subtract(const Duration(days: 6)),
      updatedAt: DateTime.now().subtract(const Duration(days: 4)),
      publishedAt: DateTime.now().subtract(const Duration(days: 6)),
      steps: [],
      commentCount: 27,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/323682/pexels-photo-323682.jpeg',
    ),
    Recipe(
      id: 7,
      title: 'Vegetarian Curry',
      description: [],
      ingredients: 'Mixed Vegetables, Coconut Milk, Curry Spices',
      likes: 134,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      updatedAt: DateTime.now().subtract(const Duration(days: 5)),
      publishedAt: DateTime.now().subtract(const Duration(days: 7)),
      steps: [],
      commentCount: 22,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/2474658/pexels-photo-2474658.jpeg',
    ),
    Recipe(
      id: 8,
      title: 'Fresh Fruit Smoothie',
      description: [],
      ingredients: 'Mixed Berries, Banana, Yogurt, Honey',
      likes: 98,
      createdAt: DateTime.now().subtract(const Duration(days: 8)),
      updatedAt: DateTime.now().subtract(const Duration(days: 6)),
      publishedAt: DateTime.now().subtract(const Duration(days: 8)),
      steps: [],
      commentCount: 14,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/775032/pexels-photo-775032.jpeg',
    ),
    Recipe(
      id: 9,
      title: 'Homemade Pizza',
      description: [],
      ingredients: 'Pizza Dough, Tomato Sauce, Mozzarella, Toppings',
      likes: 245,
      createdAt: DateTime.now().subtract(const Duration(days: 9)),
      updatedAt: DateTime.now().subtract(const Duration(days: 7)),
      publishedAt: DateTime.now().subtract(const Duration(days: 9)),
      steps: [],
      commentCount: 56,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
    ),
    Recipe(
      id: 10,
      title: 'Grilled Salmon',
      description: [],
      ingredients: 'Salmon Fillet, Lemon, Herbs, Olive Oil',
      likes: 167,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime.now().subtract(const Duration(days: 8)),
      publishedAt: DateTime.now().subtract(const Duration(days: 10)),
      steps: [],
      commentCount: 33,
      comments: [],
      coverImageUrl:
          'https://images.pexels.com/photos/1516415/pexels-photo-1516415.jpeg',
    ),
  ];

  static List<Recipe> get recentRecipes => mockRecipes.take(5).toList();

  static List<Recipe> get yourRecipes => mockRecipes.skip(5).take(5).toList();

  static String getChefNameById(int recipeId) {
    return _chefNames[(recipeId - 1) % _chefNames.length];
  }
}
