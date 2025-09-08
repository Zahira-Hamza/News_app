import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_dataSource.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';

import '../../../api/api_manager.dart';
import '../../../data/repository/news/data_sources/remote/impl/news_remote_dataSource_impl.dart';
import '../../../data/repository/news/repository/impl/news_repository_impl.dart';
import 'news_widget_state.dart';

class NewsWidgetViewmodel extends Cubit<NewsWidgetState> {
  late NewsRepository newsRepository;
  late NewsRemoteDatasource remote;
  late ApiManager apiManager;

  NewsWidgetViewmodel() : super(NewsWidgetState.initial()) {
    apiManager = ApiManager();
    remote = NewsRemoteDatasourceImpl(apiManager: apiManager);
    newsRepository = NewsRepositoryImpl(remoteDatasource: remote);
  }

  Future<void> getNews(String sourceId,
      {int page = 1, int pageSize = 20}) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final resp = await newsRepository.getNews(
        sourceId,
        page: page,
        pageSize: pageSize,
      );

      if (resp == null) {
        throw Exception('Failed to fetch news: null response');
      }

      if (resp.status != 'ok') {
        throw Exception(resp.message ?? 'Unknown error'.tr());
      }

      final fetched = resp.articles ?? [];

      emit(state.copyWith(
        articles: page == 1 ? fetched : [...state.articles, ...fetched],
        page: page,
        hasMore: fetched.length >= pageSize,
        isLoading: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  void resetAndReload(String sourceId) {
    emit(NewsWidgetState.initial());
    getNews(sourceId, page: 1);
  }
}
