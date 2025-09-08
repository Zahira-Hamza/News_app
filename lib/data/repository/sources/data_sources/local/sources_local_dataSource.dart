//todo:interface source local data source =>offline
import '../../../../../model/SourceResponse.dart';

abstract class SourcesLocalDatasource {
  Future<SourceResponse?> getSources(String categoryId);
}
