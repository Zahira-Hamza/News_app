import 'package:news_app/model/NewsResponse.dart';

abstract class NewsLocalDatasource {
  Future<NewsResponse?> getNews(String sourceId);
}
