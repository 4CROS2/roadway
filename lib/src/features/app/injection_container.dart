import 'package:roadway/injection_container.dart';
import 'package:roadway/src/features/app/data/datasource/app_datasource.dart';
import 'package:roadway/src/features/app/data/repository/app_repository_impl.dart';
import 'package:roadway/src/features/app/domain/repository/app_repository.dart';
import 'package:roadway/src/features/app/domain/usecase/app_usecase.dart';
import 'package:roadway/src/features/app/presentation/cubit/app_cubit.dart';

void initAppContainer() {
  sl.registerLazySingleton<AppDatasource>(() => AppDatasourceImpl());

  sl.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(datasource: sl<AppDatasource>()),
  );

  sl.registerLazySingleton<AppUsecase>(
    () => AppUsecase(repository: sl<AppRepository>()),
  );

  sl.registerLazySingleton<AppCubit>(() => AppCubit(usecase: sl<AppUsecase>()));
}
