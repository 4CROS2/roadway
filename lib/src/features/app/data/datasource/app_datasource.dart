import 'package:appwrite/appwrite.dart';
import 'package:roadway/injection_container.dart';

abstract interface class AppDatasource {
//  Stream<Json> watchAppConfiguration();
}

mixin ConnectionMixin {
  final Client _client = sl<Client>();

  Databases get databases => Databases(_client);
  Realtime get realtime => Realtime(_client);
}

class AppDatasourceImpl with ConnectionMixin implements AppDatasource {

}
