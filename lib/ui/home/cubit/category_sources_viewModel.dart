import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/sources_remote_dataSource.dart';
import 'package:news_app/ui/home/cubit/category_sources_states.dart';

import '../../../data/repository/sources/data_sources/remote/impl/sources_remote_dataSource_impl.dart';
import '../../../data/repository/sources/repository/impl/source_repository_impl.dart';
import '../../../data/repository/sources/repository/source_repository.dart';

class CategorySourcesViewmodel extends Cubit<CategorySourcesStates> {
  late SourceRepository sourcerepository;
  late SourcesRemoteDatasource remoteDatasource;
  late ApiManager apiManager;
  CategorySourcesViewmodel() : super(SourceLoadingState()) {
    apiManager = ApiManager();
    remoteDatasource = SourcesRemoteDatasourceImpl(
      apiManager: apiManager,
    );
    sourcerepository = SourceRepositoryImpl(remoteDatasource: remoteDatasource);
  }

  //todo:hold data-handle logic
  Future<void> getSources(String categoeyId) async {
    try {
      //todo:loading
      emit(SourceLoadingState());
      var response = await sourcerepository.getSources(categoeyId);
      if (response?.status == 'error') {
        //todo:error=>server
        emit(SourceErrorState(errorMessage: response!.message!));
      } else {
        //todo:success=>server
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      //todo:error=>user
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
