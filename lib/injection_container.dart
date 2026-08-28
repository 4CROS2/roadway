import 'package:get_it/get_it.dart';
import 'package:roadway/src/features/home/presentation/injection/injection_container.dart';

final sl = GetIt.instance;

Future<void> injectionContainer() async {
  initializeHomeDependencies();
}
