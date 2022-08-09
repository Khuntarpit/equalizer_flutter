import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'equalizer_flutter_platform_interface.dart';

/// An implementation of [EqualizerFlutterPlatform] that uses method channels.
class MethodChannelEqualizerFlutter extends EqualizerFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('equalizer_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
