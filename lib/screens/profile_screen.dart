import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flavor_hub/shared/widgets/buttons/primary_button.dart';
import 'package:flavor_hub/shared/widgets/common/recipe_card.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeBar(
        title: 'Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
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
                                ?.copyWith(fontWeight: FontWeight.bold),
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
                  PrimaryButton(
                    text: 'Edit',
                    type: ButtonType.secondary,
                    icon: Icons.edit,
                    onPressed: () {
                      //TODO:: navigate to edit profile screen
                    },
                  ),
                ],
              ),

              mediumVerticalSizedBox,

              const Divider(height: 4, thickness: 1),

              mediumVerticalSizedBox,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.borderLightGray,
                            width: 1.5,
                          ),
                        ),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '125',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Recipes',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.borderLightGray,
                            width: 1.5,
                          ),
                        ),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '300',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '150',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Following',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              mediumVerticalSizedBox,

              const Divider(height: 4, thickness: 1),

              mediumVerticalSizedBox,

              TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primaryOrange,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primaryOrange,
                      width: 2.0,
                    ),
                  ),
                ),
                labelColor: AppColors.primaryOrange,
                unselectedLabelColor: Colors.grey[600],
                labelStyle: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: AppTextStyles.bodyMedium,
                tabs: const [
                  Tab(text: 'My Recipes'),
                  Tab(text: 'About'),
                ],
              ),

              mediumVerticalSizedBox,

              Expanded(
                child: TabBarView(
                  clipBehavior: Clip.hardEdge,
                  controller: _tabController,
                  children: [_buildMyRecipesTab(), _buildAboutTab()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyRecipesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          // TODO:: handle recipe tap
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
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(description, style: Theme.of(context).textTheme.headlineSmall),
          smallVerticalSizedBox,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          mediumVerticalSizedBox,
          const Divider(height: 4, thickness: 1),
          mediumVerticalSizedBox,
          Text(socialMedia, style: Theme.of(context).textTheme.headlineSmall),
          smallVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSocialButton(FontAwesomeIcons.instagram, () {}),
              _buildSocialButton(FontAwesomeIcons.facebook, () {}),
              _buildSocialButton(FontAwesomeIcons.twitter, () {}),
              _buildSocialButton(FontAwesomeIcons.linkedin, () {}),
              _buildSocialButton(FontAwesomeIcons.youtube, () {}),
            ],
          ),
          mediumVerticalSizedBox,
          const Divider(height: 4, thickness: 1),
          mediumVerticalSizedBox,
          Text(moreInfo, style: Theme.of(context).textTheme.headlineSmall),
          smallVerticalSizedBox,
          _buildMoreInfoItem(
            context,
            Icons.link_rounded,
            'https://www.example.com',
            contentColor: AppColors.primaryOrange,
          ),
          _buildMoreInfoItem(
            context,
            Icons.location_on_outlined,
            'Proxima, Centauri',
          ),
          _buildMoreInfoItem(
            context,
            Icons.calendar_today_outlined,
            'Joined since Aug 24, 2023',
          ),
          _buildMoreInfoItem(
            context,
            Icons.analytics_outlined,
            '2,368,456 views',
          ),
          mediumVerticalSizedBox,
          const Divider(height: 4, thickness: 1),
          mediumVerticalSizedBox,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: PrimaryButton(
              text: editProfile,
              type: ButtonType.primary,
              onPressed: () {
                // TODO:: navigate to edit profile screen
              },
            ),
          ),
          mediumVerticalSizedBox,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: PrimaryButton(
              text: logOut,
              type: ButtonType.secondary,
              onPressed: () {
                // TODO:: logout action
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[600]!
              : Colors.grey[300]!,
        ),
      ),
      child: IconButton(
        icon: FaIcon(icon, color: AppColors.primaryOrange, size: 20),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildMoreInfoItem(
    BuildContext context,
    IconData icon,
    String content, {
    Color? contentColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color:
                contentColor ?? Theme.of(context).textTheme.bodyMedium?.color,
            size: 20,
          ),
          smallHorizontalSizedBox,
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color:
                  contentColor ?? Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
