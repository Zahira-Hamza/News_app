import 'package:news_app/model/source.dart';

abstract class CategorySourcesStates {}

class SourceLoadingState extends CategorySourcesStates {}

class SourceErrorState extends CategorySourcesStates {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends CategorySourcesStates {
  List<Source> sourcesList;
  SourceSuccessState({required this.sourcesList});
}

class SourceInitialState extends CategorySourcesStates {}
