/////////////class for category types ////////////////

import '../utils/assets_manager.dart';

class CategoryWidget {
  String id;
  String title;
  String image;
  CategoryWidget({required this.id, required this.title, required this.image});
  static List<CategoryWidget> getCategoryList(bool isDark) {
    return [
      CategoryWidget(
          id: "general",
          title: "General",
          image: isDark
              ? AssetsManager.generalDarkImage
              : AssetsManager.generalLightImage),
      CategoryWidget(
          id: "business",
          title: "Business",
          image: isDark
              ? AssetsManager.businessDarkImage
              : AssetsManager.businessLightImage),
      CategoryWidget(
          id: "entertainment",
          title: "Entertainment",
          image: isDark
              ? AssetsManager.entertainmentDarkImage
              : AssetsManager.entertainmentLightImage),
      CategoryWidget(
          id: "health",
          title: "Health",
          image: isDark
              ? AssetsManager.healthDarkImage
              : AssetsManager.healthLightImage),
      CategoryWidget(
          id: "science",
          title: "Science",
          image: isDark
              ? AssetsManager.scienceDarkImage
              : AssetsManager.scienceLightImage),
      CategoryWidget(
          id: "technology",
          title: "Technology",
          image: isDark
              ? AssetsManager.technologyDarkImage
              : AssetsManager.technologyLightImage),
      CategoryWidget(
          id: "sports",
          title: "Sports",
          image: isDark
              ? AssetsManager.sportsDarkImage
              : AssetsManager.sportsLightImage),
    ];
  }
}
