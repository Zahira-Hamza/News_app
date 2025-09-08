//todo:interface sources remote data source=>ds
import '../../../../../model/SourceResponse.dart';

abstract class SourcesRemoteDatasource {
  Future<SourceResponse?> getSources(String categoryId);
}
