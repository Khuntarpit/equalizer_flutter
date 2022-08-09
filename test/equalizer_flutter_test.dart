import 'package:flutter_test/flutter_test.dart';
import 'package:equalizer_flutter/equalizer_flutter.dart';
import 'package:equalizer_flutter/equalizer_flutter_platform_interface.dart';
import 'package:equalizer_flutter/equalizer_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEqualizerFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements EqualizerFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EqualizerFlutterPlatform initialPlatform = EqualizerFlutterPlatform.instance;

  test('$MethodChannelEqualizerFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEqualizerFlutter>());
  });

  test('getPlatformVersion', () async {
    EqualizerFlutter equalizerFlutterPlugin = EqualizerFlutter();
    MockEqualizerFlutterPlatform fakePlatform = MockEqualizerFlutterPlatform();
    EqualizerFlutterPlatform.instance = fakePlatform;
  
    expect(await equalizerFlutterPlugin.getPlatformVersion(), '42');
  });
}
