part of 'app_cubit.dart';

@immutable
class AppState {
  const AppState({this.appConfiguration = const .empty()});

  final AppConfiguration appConfiguration;

  AppState copyWith({AppConfiguration? appConfiguration}) {
    return AppState(
      appConfiguration: appConfiguration ?? this.appConfiguration,
    );
  }
}
