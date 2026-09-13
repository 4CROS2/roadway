import 'package:appwrite/appwrite.dart';
import 'package:roadway/injection_container.dart';
import 'package:roadway/src/core/environment/appwrite/appwrite_init.dart';

void initEnvironmentContainer() {
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerSingleton<Appwrite>(Appwrite());
}
