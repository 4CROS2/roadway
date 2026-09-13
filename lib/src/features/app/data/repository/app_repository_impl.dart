import 'package:roadway/src/features/app/data/datasource/app_datasource.dart';
import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';
import 'package:roadway/src/features/app/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  const new({required this._datasource});

  final AppDatasource _datasource;

  @override
  Stream<AppConfiguration> watchAppConfiguration() {
    final stream = _datasource.watchAppConfiguration();
    try {
      print(stream);
      return Stream.empty();
    } catch (e) {
      throw Exception('Failed to watch app configuration: $e');
    }
  }
}
