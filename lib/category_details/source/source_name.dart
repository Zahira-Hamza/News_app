import 'package:flutter/material.dart';

import '../../model/source.dart';

class SourceName extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceName({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
        style: isSelected
            ? Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18)
            : Theme.of(context).textTheme.headlineSmall);
  }
}
