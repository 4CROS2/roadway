import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';
import 'package:roadway/src/features/app/domain/repository/app_repository.dart';

class AppUsecase {
  const new({required this._repository});

  final AppRepository _repository;

  Stream<AppConfiguration> watchAppConfiguration() =>
      _repository.watchAppConfiguration();
}
