import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:mood_occurrences/config/assets/audio_assets.dart';

class SoundProvider extends ChangeNotifier {
  bool _isSoundOn = true;
  bool get isSoundOn => _isSoundOn;

  void toggleSound() {
    _isSoundOn = !_isSoundOn;
    if (_isSoundOn) {
      FlameAudio.bgm.play(AudioAssets.bgAudio);
    } else {
      FlameAudio.bgm.stop();
    }
    notifyListeners();
  }
}
