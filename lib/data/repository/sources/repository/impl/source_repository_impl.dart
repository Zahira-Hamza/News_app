//todo:impl source_repository=>concrete
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/model/SourceResponse.dart';

import '../../data_sources/remote/sources_remote_dataSource.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourcesRemoteDatasource remoteDatasource;

  SourceRepositoryImpl({required this.remoteDatasource});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    // TODO: implement getSources
    return remoteDatasource.getSources(categoryId);
  }
}
