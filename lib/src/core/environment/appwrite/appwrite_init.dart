import 'package:appwrite/appwrite.dart';
import 'package:roadway/src/core/environment/environment.dart';

class Appwrite {
  const Appwrite._();

  static final Client _client = Client();
  static final Environment _environment = Environment();

  static Future<void> init() async {
    _client
        .setEndpoint(_environment.apiBaseUrl)
        .setProject(_environment.projectId);
    // si está en debug ejecurar  .setSelfSigned()
    if (_environment.isDebug) {
      _client.setSelfSigned();
    }
  }
}
