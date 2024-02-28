import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mood_occurrences/config/assets/assets.dart';

class SoundProvider extends ChangeNotifier {
  bool _isSoundOn = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool get isSoundOn => _isSoundOn;

  Future<void> _loadSound() async {
    try {
      await _audioPlayer.setAsset(AudioAssets.bgAudio, preload: true);
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  void toggleSound() async {
    _isSoundOn = !_isSoundOn;

    if (_isSoundOn) {
      await _loadSound();
      _audioPlayer.setLoopMode(LoopMode.one);
      _audioPlayer.play();
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.dispose();
    }

    notifyListeners();
  }
}
