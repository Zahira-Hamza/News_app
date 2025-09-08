import '../../../../../model/NewsResponse.dart';

abstract class NewsRemoteDatasource {
  Future<NewsResponse?> getNews(String sourceId, {int page, int pageSize});
}
