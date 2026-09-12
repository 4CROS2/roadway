import 'package:roadway/injection_container.dart';
import 'package:roadway/src/features/appwrite/presentation/cubit/configuration_remote_cubit.dart';

void initAppwriteContainer() {
  sl.registerFactory<ConfigurationRemoteCubit>(()=> ConfigurationRemoteCubit());
}
