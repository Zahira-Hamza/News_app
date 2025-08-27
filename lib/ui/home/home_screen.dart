import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_widget.dart';
import 'package:news_app/ui/home/category_fragments/category_fragment.dart';

import '../../category_details/category_details.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryWidget? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home'.tr() : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body: selectedCategory == null
          ? CategoryFragment(
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            )
          : CategoryDetails(
              category: selectedCategory!,
            ),
    );
  }
}
