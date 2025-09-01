import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/cubit/category_sources_states.dart';

class CategorySourcesViewmodel extends Cubit<CategorySourcesStates> {
  CategorySourcesViewmodel() : super(SourceLoadingState());

  //todo:hold data-handle logic
  Future<void> getSources(String categoeyId) async {
    try {
      //todo:loading
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoeyId);
      if (response.status == 'error') {
        //todo:error=>server
        emit(SourceErrorState(errorMessage: response!.message!));
      } else {
        //todo:success=>server
        emit(SourceSuccessState(sourcesList: response.sources!));
      }
    } catch (e) {
      //todo:error=>user
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
