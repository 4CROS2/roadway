import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roadway_native_navigation/roadway_native_navigation_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelRoadwayNativeNavigation platform = MethodChannelRoadwayNativeNavigation();
  const MethodChannel channel = MethodChannel('roadway_native_navigation');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
