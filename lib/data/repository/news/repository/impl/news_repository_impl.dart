import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/model/NewsResponse.dart';

import '../../data_sources/remote/news_remote_dataSource.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDatasource remoteDatasource;

  NewsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<NewsResponse?> getNews(String sourceId,
      {int page = 1, int pageSize = 20}) {
    return remoteDatasource.getNews(sourceId, page: page, pageSize: pageSize);
  }
}
