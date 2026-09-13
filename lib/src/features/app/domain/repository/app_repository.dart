import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';

abstract interface class AppRepository {
  Stream<AppConfiguration> watchAppConfiguration();
}