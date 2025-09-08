import 'package:news_app/data/repository/news/data_sources/remote/news_remote_dataSource.dart';
import 'package:news_app/model/NewsResponse.dart';

import '../../../../../../api/api_manager.dart';

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  ApiManager apiManager;
  NewsRemoteDatasourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNews(String sourceId,
      {int page = 1, int pageSize = 20}) async {
    var response = await apiManager.getNewsSources(sourceId,
        page: page, pageSize: pageSize);
    return response;
  }
}
