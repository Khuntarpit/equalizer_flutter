
import 'package:flutter/services.dart';

import 'equalizer_flutter_platform_interface.dart';

enum CONTENT_TYPE { MUSIC, MOVIE, GAME, VOICE }

class EqualizerFlutter {

  static const methodChannel = const MethodChannel('equalizer_flutter');

  /// Open's the device equalizer.
  ///
  /// - [audioSessionId] enable audio effects for the current session.
  /// - [contentType] optional parameter. Defaults to [CONTENT_TYPE.MUSIC]
  ///
  /// [android]:
  /// https://developer.android.com/reference/android/media/MediaPlayer#getAudioSessionId()
  static Future open(int audioSessionId,
      [CONTENT_TYPE contentType = CONTENT_TYPE.MUSIC]) async {
    return await methodChannel.invokeMethod(
      'open',
      {'audioSessionId': audioSessionId, 'contentType': contentType.index},
    );
  }

  /// Set [audioSessionId] for equalizer.
  ///
  /// [android]:
  /// https://developer.android.com/reference/android/media/MediaPlayer#getAudioSessionId()
  static Future<void> setAudioSessionId(int audioSessionId) async {
    await methodChannel.invokeMethod('setAudioSessionId', audioSessionId);
  }

  /// Remove current [audioSessionId] for equalizer.
  static Future<void> removeAudioSessionId(int audioSessionId) async {
    await methodChannel.invokeMethod('removeAudioSessionId', audioSessionId);
  }

  /// Initialize a custom equalizer.
  ///
  /// [audioSessionId] enable audio effects for the current session.
  static Future<void> init(int audioSessionId) async {
    await methodChannel.invokeMethod('init', audioSessionId);
  }

  // Release the custom equalizer resources.
  static Future<void> release() async {
    await methodChannel.invokeMethod('release');
  }

  /// Enable/disable a custom equalizer.
  static Future<void> setEnabled(bool enabled) async {
    await methodChannel.invokeMethod('enable', enabled);
  }

  /// Returns the band level range in a list of integers represented in [dB].
  /// The first element is
  /// the lower limit of the range, the second element the upper limit.
  static Future<List<int>> getBandLevelRange() async {
    return (await methodChannel.invokeMethod('getBandLevelRange')).cast<int>();
  }

  /// Returns the band level in [dB].
  static Future<int> getBandLevel(int bandId) async {
    return await methodChannel.invokeMethod('getBandLevel', bandId);
  }

  /// Set the band level for a custom equalizer.
  ///
  /// - [bandId] can be retrieved from [getCenterBandFreqs]
  /// - [level] can be retrieved from [getBandLevel]
  static Future<void> setBandLevel(int bandId, int level) async {
    // The level retrieved here is in dB. The native platform requires
    // the level in millibels.
    await methodChannel.invokeMethod(
      'setBandLevel',
      {'bandId': bandId, 'level': level * 100},
    );
  }

  /// Returns the center band frequencies in milliHertz.
  static Future<List<int>> getCenterBandFreqs() async {
    return (await methodChannel.invokeMethod('getCenterBandFreqs')).cast<int>();
  }

  /// Returns the preset names available on device.
  static Future<List<String>> getPresetNames() async {
    return (await methodChannel.invokeMethod('getPresetNames')).cast<String>();
  }

  /// Set the preset name.
  static Future<void> setPreset(String presetName) async {
    await methodChannel.invokeMethod('setPreset', presetName);
  }

  Future<String?> getPlatformVersion() {
    return EqualizerFlutterPlatform.instance.getPlatformVersion();
  }
}
