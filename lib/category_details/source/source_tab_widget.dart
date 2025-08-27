import 'package:flutter/material.dart';
import 'package:news_app/category_details/source/source_name.dart';

import '../../model/source.dart';
import '../news/news_widget.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;
  final String searchQuery; // ✅ استقبل قيمة البحث

  SourceTabWidget({required this.sourcesList, this.searchQuery = ""});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Theme.of(context).primaryColor,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sourcesList.map(
              (source) {
                return SourceName(
                  source: source,
                  isSelected:
                      selectedIndex == widget.sourcesList.indexOf(source),
                );
              },
            ).toList(),
          ),
          SizedBox(height: height * 0.03),
          Expanded(
            child: NewsWidget(
              source: widget.sourcesList[selectedIndex],
              searchQuery: widget.searchQuery, // 🔥 مرر البحث للـ NewsWidget
            ),
          ),
        ],
      ),
    );
  }
}
