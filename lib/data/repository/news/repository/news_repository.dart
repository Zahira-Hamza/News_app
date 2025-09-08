// NewsRepository interface
import '../../../../model/NewsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNews(String sourceId, {int page, int pageSize});
}
