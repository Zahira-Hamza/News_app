import 'package:news_app/data/repository/sources/data_sources/remote/sources_remote_dataSource.dart';
import 'package:news_app/model/SourceResponse.dart';

import '../../../../../../api/api_manager.dart';

class SourcesRemoteDatasourceImpl implements SourcesRemoteDatasource {
  ApiManager apiManager;
  SourcesRemoteDatasourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // TODO: implement getSources
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
