import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:roadway/injection_container.dart';
import 'package:roadway/src/core/entities/json.dart';
import 'package:roadway/src/core/environment/environment.dart';

abstract interface class AppDatasource {
  Stream<Json> watchAppConfiguration();
}

mixin ConnectionMixin {
  final Client _client = sl<Client>();

  TablesDB get databases => TablesDB(_client);
  Realtime get realtime => Realtime(_client);
  Environment get environment => Environment();
}

class AppDatasourceImpl with ConnectionMixin implements AppDatasource {
  @override
  Stream<Json> watchAppConfiguration() async* {
    final RowList result = await databases.listRows(
      databaseId: environment.databaseId,
      tableId: environment.appConfig,
    );

    final Json configuration = <String, dynamic>{
      for (final row in result.rows)
        row.data['name'] as String: row.data['value'],
    };

    yield Map<String, dynamic>.from(configuration);

    final RealtimeSubscription subscription = realtime.subscribe([
      Channel.tablesdb(
        environment.databaseId,
      ).table(environment.appConfig).row().toString(),
    ]);

    await for (final event in subscription.stream) {
      final data = event.payload;

      final name = data['name'] as String?;
      if (name == null) continue;

      yield Map<String, dynamic>.from(configuration);
    }
  }
}
