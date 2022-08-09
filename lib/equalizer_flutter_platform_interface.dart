import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'equalizer_flutter_method_channel.dart';

abstract class EqualizerFlutterPlatform extends PlatformInterface {
  /// Constructs a EqualizerFlutterPlatform.
  EqualizerFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static EqualizerFlutterPlatform _instance = MethodChannelEqualizerFlutter();

  /// The default instance of [EqualizerFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelEqualizerFlutter].
  static EqualizerFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EqualizerFlutterPlatform] when
  /// they register themselves.
  static set instance(EqualizerFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
