# Flavor Hub

A Flutter mobile application for sharing and discovering recipes, built with Strapi as the backend CMS. Flavor Hub allows users to browse recipes, view detailed cooking instructions, like recipes, and engage with the community through comments.

## Development Status

- ✅ **User Authentication** - Login/signup with JWT token management
- ✅ **Recipe Browsing** - Browse recipes with images and pagination
- ✅ **Recipe Details** - View comprehensive recipe information
- ✅ **Multi-language Support** - English, French, and Japanese localization
- ✅ **API Integration** - Strapi backend integration with proper error handling
- 🚧 **UI Re-design** - In progress to enhance user experience and visual appeal
- 🚧 **Comment System** - Basic commenting implemented, author population in progress
- 🚧 **Recipe Interactions** - Like functionality implemented, needs refinement
- 📋 **User Profiles** - Planned for future release
- 📋 **Recipe Creation** - Planned for future release
- 📋 **Push Notifications** - Under consideration

### Legend

- ✅ **Completed** - Feature is fully implemented and tested
- 🚧 **In Progress** - Feature is partially implemented or being refined
- 📋 **Planned** - Feature is planned for future development

## Features

- **Recipe Discovery**: Browse a collection of recipes with images and detailed information
- **Recipe Details**: View comprehensive recipe information including ingredients, cooking steps, and descriptions
- **User Authentication**: Secure login and signup functionality with JWT token management
- **Social Features**: Like recipes and leave comments on your favorite dishes (in development)
- **Multi-language Support**: Available in English, French, and Japanese
- **Responsive Design**: Optimized for both iOS and Android platforms

## Tech Stack

### Frontend

- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language
- **Provider**: State management
- **Easy Localization**: Internationalization support
- **HTTP**: API communication

### Backend

- **Strapi**: Headless CMS for content management
- **JWT**: Authentication tokens
- **Rich Text (Blocks)**: For recipe descriptions and content

## Project Structure

```
lib/
├── main.dart                 # App entry point and configuration
├── models/
│   └── recipe.dart          # Data models (Recipe, Comment, Description, etc.)
├── screens/
│   ├── home.dart           # Home screen with recipe list
│   ├── detail.dart         # Recipe detail screen
│   ├── login.dart          # User authentication
│   ├── signup.dart         # User registration
│   └── request_recipe.dart # Recipe request functionality
└── utils/
    └── server.dart         # API service layer
```

## Setup & Installation

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK
- iOS Simulator / Android Emulator
- [Strapi backend server](https://github.com/samrasugu/flavor_hub_strapi_cms.git)

### Environment Configuration

1. Create a `.env` file in the root directory:

```env
BASE_URL=http://localhost:1337/api
RECIPE_ENDPOINT=/recipes
COMMENT_ENDPOINT=/comments
```

### Installation Steps

1. Clone the repository:

```bash
git clone https://github.com/samrasugu/flavor_hub.git
cd flavor_hub
```

2. Install dependencies:

```bash
flutter pub get
```

3. Set up translation assets:

```bash
# Ensure assets/translations/ directory exists with translation files
```

4. Run the application:

```bash
flutter run
```

## API Integration

The app integrates with a Strapi backend providing:

- **Recipes API**: Fetch recipes with localization support
- **Comments API**: Recipe comments with user relations
- **Authentication API**: User login/signup with JWT tokens
- **Media API**: Recipe cover images and media assets

### Key API Endpoints

- `GET /api/recipes?locale={lang}&populate=*` - Fetch recipes
- `GET /api/comments?filters[recipe][id][$eq]={id}&populate=comment_author` - Fetch comments
- `POST /api/auth/local` - User authentication
- `POST /api/auth/local/register` - User registration

## Features in Detail

### Recipe Management

- Browse recipes with cover images
- View detailed recipes with ingredients and cooking steps
- Multi-language recipe content support
- Rich text descriptions with proper formatting

### User Interaction

- Like/unlike recipes
- Comment system with user attribution
- User authentication and profile management
- Secure JWT token management

### Localization

- Support for English (en), French (fr-FR), and Japanese (ja-JP)
- Dynamic locale switching
- Localized content from Strapi backend

## Platform Support

- ✅ iOS
- ✅ Android
- ❌ Web (excluded)
- ❌ Desktop platforms (excluded)

## Development

### Debug Mode Features

- Comprehensive logging with `kDebugMode` checks
- API request/response debugging
- JSON parsing error handling
- Network error tracking

### State Management

- Provider pattern for state management
- Authentication state persistence
- Recipe data caching and updates

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.
