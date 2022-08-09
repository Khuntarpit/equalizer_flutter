# equalizer_flutter

A Flutter plugin to open the device equalizer. You can also create a custom equalizer for Android.

Currently, supported on **Android** only. **Need help for iOS contributions.**

<img width="250px" alt="Example" src="https://user-images.githubusercontent.com/20875177/85949432-67615b80-b974-11ea-81e5-536caf232dc6.png">

## Android Setup
Edit your project's `AndroidManifest.xml` file to declare the permission to modify audio settings when creating a **custom equalizer**.
```xml
<manifest>
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <application...>
    
    ...
    </application...>
</manifest>
```

## Example

```dart
// Import package
import 'package:equalizer_flutter/equalizer_flutter.dart';

// Open device equalizer
EqualizerFlutter.open(audioSessionId);

// Set or remove audioSessionId.
EqualizerFlutter.setAudioSessionId(audioSessionId);
EqualizerFlutter.removeAudioSessionId(audioSessionId);
```
> You can retrieve `audioSessionId` on android from MediaPlayer. Info on how to do this can be found in `openEqualizer` docs.

## Custom Equalizer Example

Initialize the equalizer. Recommended to perform inside initState
```dart
EqualizerFlutter.init(audioSessionId);
```

Enable the equalizer as follows.
```dart
EqualizerFlutter.setEnabled(true);
```

Now you can query the methods.
```dart
await EqualizerFlutter.getBandLevelRange(); // provides band level range in dB.

await EqualizerFlutter.getBandLevel(bandId);
EqualizerFlutter.setBandLevel(bandId,bandLevel);

await EqualizerFlutter.getCenterBandFreqs(); // provides the center freqs in milliHertz.

await EqualizerFlutter.getPresetNames(); // returns presets that are available on device
EqualizerFlutter.setPreset(presetName);
```

Finally, remember to release resources. Recommended to perform inside dispose
```dart
EqualizerFlutter.release();
```

## TODO

- Add iOS support.