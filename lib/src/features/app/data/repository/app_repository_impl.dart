import 'package:roadway/src/core/entities/json.dart';
import 'package:roadway/src/features/app/data/datasource/app_datasource.dart';
import 'package:roadway/src/features/app/data/model/app_configuration_model.dart';
import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';
import 'package:roadway/src/features/app/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  const new({required this._datasource});

  final AppDatasource _datasource;

  @override
  Stream<AppConfiguration> watchAppConfiguration() async* {
    final Stream<Json> stream = _datasource.watchAppConfiguration();
    try {
      yield* stream.map((json) => AppConfigurationModel.fromJson(json: json));
    } catch (e) {
      throw Exception('Failed to watch app configuration: $e');
    }
  }
}
