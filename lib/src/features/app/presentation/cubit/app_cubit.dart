import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';
import 'package:roadway/src/features/app/domain/usecase/app_usecase.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  new({required this._usecase}) : super(const AppState()) {
    watchAppConfiguration();
  }
  final AppUsecase _usecase;

  StreamSubscription<AppConfiguration>? _appConfigurationSubscription;

  void watchAppConfiguration() {
    _appConfigurationSubscription = _usecase.watchAppConfiguration().listen(
      _onSuccess,
      onError: _onError,
    );
  }

  void _onSuccess(AppConfiguration configuration) {
    emit(
      state.copyWith(
        appConfiguration: configuration.copyWith(
          lightRemoteColors: configuration.lightRemoteColors,
          darkRemoteColors: configuration.darkRemoteColors,
          userPreference: configuration.userPreference,
        ),
      ),
    );
  }

  void _onError(Object error) {
    print(error);
  }

  void cancelWatchAppConfiguration() {
    _appConfigurationSubscription?.cancel();
    _appConfigurationSubscription = null;
  }

  @override
  Future<void> close() {
    cancelWatchAppConfiguration();
    return super.close();
  }
}
