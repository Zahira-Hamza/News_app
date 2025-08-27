// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/model/category_widget.dart';
//
// class CategoryItem extends StatelessWidget {
//   final CategoryWidget category;
//   final int index;
//
//   const CategoryItem({super.key, required this.category, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Container(
//       padding: EdgeInsets.symmetric(
//           vertical: height * .001, horizontal: width * .03),
//       child: Stack(
//         alignment:
//             (index % 2 == 0) ? Alignment.bottomRight : Alignment.bottomLeft,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               category.image,
//               fit: BoxFit.fill,
//               width: double.infinity,
//               height: height * 0.2,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * .03),
//             child: Container(
//               width: width * .41,
//               margin: EdgeInsets.only(bottom: height * .013),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(84),
//                 color: Colors.grey,
//               ),
//               child: Row(
//                 textDirection:
//                     (index % 2 == 0) ? TextDirection.ltr : TextDirection.rtl,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "View All".tr(),
//                       style: Theme.of(context).textTheme.displayLarge,
//                     ),
//                   ),
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//                     child: Icon(
//                       (index % 2 == 0)
//                           ? Icons.arrow_forward_ios_rounded
//                           : Icons.arrow_back_ios_rounded,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_widget.dart';

class CategoryItem extends StatelessWidget {
  final CategoryWidget category;
  final int index;

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: height * .001, horizontal: width * .03),
      child: Stack(
        alignment:
            (index % 2 == 0) ? Alignment.bottomRight : Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              category.image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: height * 0.2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Container(
              width: width * .45, // Slightly increase the width
              margin: EdgeInsets.only(bottom: height * .013),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(84),
                color: Colors.grey,
              ),
              child: Row(
                // textDirection: (index % 2 == 0) ? TextDirection.ltr : TextDirection.rtl,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Better spacing
                children: [
                  Flexible(
                    // Use Flexible instead of Expanded
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0), // Reduce padding
                      child: Text(
                        "View All".tr(),
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 14, // Reduce font size if needed
                                ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 18, // Slightly reduce icon size
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Icon(
                      (index % 2 == 0)
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.arrow_back_ios_rounded,
                      size: 16, // Reduce icon size
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
