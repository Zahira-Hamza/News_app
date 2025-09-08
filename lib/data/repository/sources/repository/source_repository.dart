//todo:interface repo =>abstract class
import '../../../../model/SourceResponse.dart';

abstract class SourceRepository {
  Future<SourceResponse?> getSources(String categoryId);
}
