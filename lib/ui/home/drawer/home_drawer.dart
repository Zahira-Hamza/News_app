import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import 'drawer_dropdown_field.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<AppLanguageProvider>(context);

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: AppColors.whitePrimaryColor,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "News App".tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: AppColors.blackPrimaryColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * .02,
                horizontal: width * .04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Home Button
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.homeRouteName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.home, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          "Go To Home".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * .02),
                  const Divider(color: Colors.white, thickness: 1),
                  SizedBox(height: height * .02),

                  /// Theme
                  Row(
                    children: [
                      Icon(Icons.brightness_4_outlined, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        "Theme".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  DrawerDropdownField(
                    text: themeProvider.isDark ? "Dark".tr() : "Light".tr(),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            color: AppColors.blackPrimaryColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(
                                      "Light".tr(), // Already has .tr() - good
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    themeProvider.toggleTheme(false);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                      "Dark".tr(), // Already has .tr() - good
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    themeProvider.toggleTheme(true);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  SizedBox(height: height * .02),
                  const Divider(color: Colors.white, thickness: 1),
                  SizedBox(height: height * .02),

                  /// Language
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        "Language".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  DrawerDropdownField(
                    text: languageProvider.locale.languageCode == 'en'
                        ? "English"
                        : "العربية",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            color: AppColors.blackPrimaryColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text("English",
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    languageProvider
                                        .setLocale(const Locale('en'));
                                    context.setLocale(const Locale('en'));
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                      "العربية", // Add .tr() to Arabic text
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    languageProvider
                                        .setLocale(const Locale('ar'));
                                    context.setLocale(const Locale('ar'));
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
