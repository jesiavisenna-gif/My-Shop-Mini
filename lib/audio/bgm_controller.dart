import 'package:audioplayers/audioplayers.dart';

class BGMController {
  static final AudioPlayer _player = AudioPlayer();
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    await _player.setReleaseMode(ReleaseMode.loop); // loop otomatis
    await _player.setVolume(0.5);

    await _player.play(
      AssetSource("audio/bgm.mp3"),
    );
  }

  static Future<void> stop() async {
    await _player.stop();
  }

  static Future<void> setVolume(double v) async {
    await _player.setVolume(v.clamp(0.0, 1.0));
  }
}
