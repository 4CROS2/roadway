# Roadway Copilot Instructions

## Commands

The project requires Flutter SDK 3.47.3 (Dart SDK constraint `^3.13.3`).

```sh
flutter pub get
flutter run --dart-define-from-file=config/env/app.json
flutter analyze
flutter test
flutter test test/widget_test.dart
flutter test test/widget_test.dart --plain-name "test description"
flutter build apk --dart-define-from-file=config/env/app.json
```

`config/env/app.json` supplies the Appwrite compile-time defines. Keep its keys
aligned with `Environment`: `APPWRITE_ENDPOINT`, `APPWRITE_PROJECT_ID`,
`APPWRITE_PROJECT_NAME`, `DATABASE_ID`, `APP_CONFIG`, and `USER_SETTINGS`.
Do not hard-code their values in Dart.

## Architecture

- `lib/main.dart` initializes Flutter bindings, awaits `injectionContainer()`,
  then mounts `AppPage`. Dependencies must be registered before `runApp`.
- `lib/injection_container.dart` owns the global GetIt instance, `sl`, and
  invokes core and feature registration functions. Feature dependencies use
  `registerLazySingleton`; add registrations to the relevant feature container
  and call it from the root container.
- Features follow a data/domain/presentation split. Data sources expose remote
  values, repositories map them to domain entities, use cases expose repository
  operations, and presentation Cubits consume use cases. The app configuration
  flow is `AppDatasource` -> `AppRepository` -> `AppUsecase` -> `AppCubit`.
- App configuration is loaded from Appwrite TablesDB and then watched through
  an Appwrite Realtime subscription. `AppConfigurationModel` and the color
  models translate the flat remote configuration JSON into typed domain
  entities; parse remote hexadecimal colors through `ColorExtension`.
- `AppPage` provides the singleton `AppCubit`, rebuilds `MaterialApp.router`
  from its state, and initializes the cached light/dark themes. Theme values
  are derived from remote colors and `UserPreference.themeMode`.
- Routing is centralized in `AppRouter`. Add standalone routes to
  `Branches`; add persistent, tab-like destinations to `ShellBranches`.
  `Branch.register` is the route abstraction that derives stable route names,
  while the indexed `StatefulShellRoute` renders destinations inside `Shell`.

## Repository Conventions

- Use `package:roadway/...` imports; application source lives under `lib/src`.
- Model configuration payloads with the `Json` typedef and named
  `fromJson({required Json json})` factories. Keep transport parsing in
  `data/model`, rather than in Cubits or widgets.
- Domain entities are immutable value types built with `Equatable`; preserve
  their `empty` constructors and `copyWith` methods when extending
  configuration state.
- Cubit state declarations are split with `part` files: the Cubit imports its
  state via `part '..._state.dart'`, and the state file declares `part of`.
  Long-lived stream subscriptions belong to the Cubit and must be cancelled
  from `close()`.
- Prefer the project’s Dart 3 constructor style (`const new`, `new`) when
  editing adjacent code. Use `const` widgets and constructors where supported.
- Add application-wide colors and fonts through `core/constants`; the bundled
  Lexend font is declared in `pubspec.yaml`.
