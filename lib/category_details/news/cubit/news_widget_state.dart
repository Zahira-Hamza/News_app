// import '../../../model/NewsResponse.dart';
//
// abstract class NewsWidgetStates {}
//
// class NewsLoadingState extends NewsWidgetStates {}
//
// class NewsErrorState extends NewsWidgetStates {
//   String errorMessage;
//   NewsErrorState({required this.errorMessage});
// }
//
// class NewsSuccessState extends NewsWidgetStates {
//   List<Articles> newsList;
//   NewsSuccessState({required this.newsList});
// }
//
// class NewsInitialState extends NewsWidgetStates {}
import '../../../model/NewsResponse.dart';

class NewsWidgetState {
  final List<Articles> articles;
  final int page;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  NewsWidgetState({
    required this.articles,
    required this.page,
    required this.isLoading,
    required this.hasMore,
    this.error,
  });

  factory NewsWidgetState.initial() {
    return NewsWidgetState(
      articles: [],
      page: 1,
      isLoading: false,
      hasMore: true,
      error: null,
    );
  }

  NewsWidgetState copyWith({
    List<Articles>? articles,
    int? page,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return NewsWidgetState(
      articles: articles ?? this.articles,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error ?? this.error,
    );
  }
}
