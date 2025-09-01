// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../api/api_manager.dart';
// import 'news_widget_state.dart';
//
// class NewsWidgetViewmodel extends Cubit<NewsWidgetStates> {
//   NewsWidgetViewmodel() : super(NewsLoadingState());
//
//   void getNews(String sourceId) async {
//     try {
//       var response = await ApiManager.getNewsSources(sourceId);
//       if (response.status == 'error') {
//         emit(NewsErrorState(errorMessage: response.message!));
//       } else {
//         emit(NewsSuccessState(newsList: response.articles!));
//       }
//     } catch (e) {
//       emit(NewsErrorState(errorMessage: e.toString()));
//     }
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_manager.dart';
import 'news_widget_state.dart';

class NewsWidgetViewmodel extends Cubit<NewsWidgetState> {
  NewsWidgetViewmodel() : super(NewsWidgetState.initial());

  Future<void> getNews(String sourceId,
      {int page = 1, int pageSize = 20}) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final resp = await ApiManager.getNewsSources(
        sourceId,
        page: page,
        pageSize: pageSize,
      );

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
