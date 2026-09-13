import 'package:roadway/injection_container.dart';
import 'package:roadway/src/features/app/presentation/cubit/app_cubit.dart';

void initAppContainer() {
  sl.registerLazySingleton<AppCubit>(() => AppCubit());
}
