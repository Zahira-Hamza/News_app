import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/web_view_screen.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).primaryColor,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: articles.urlToImage ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: height * 0.25,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image, size: 40),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      articles.title ?? 'No title'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      articles.description ??
                          articles.content ??
                          "No description available".tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    WebViewScreen(url: articles.url ?? ""),
                              ),
                            );
                          },
                          child: Text(
                            "View Full Article".tr(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        width: width,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? '',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: height * 0.2,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor)),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image, size: 40),
                ),
              ),
              SizedBox(height: height * .01),
              Text(
                articles.title ?? 'unknown',
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 2,
              ),
              SizedBox(height: height * .02),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "By: ${articles.author ?? ''}",
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Text(
                    articles.publishedAt ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
