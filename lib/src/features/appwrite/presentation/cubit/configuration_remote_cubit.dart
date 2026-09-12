import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'configuration_remote_state.dart';

class ConfigurationRemoteCubit extends Cubit<ConfigurationRemoteState> {
  ConfigurationRemoteCubit() : super(ConfigurationRemoteInitial());
}
