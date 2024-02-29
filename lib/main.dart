import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_occurrences/config/assets/audio_assets.dart';
import 'package:mood_occurrences/screens/menu_screen.dart';
import 'package:mood_occurrences/screens/provider/sound_provider.dart';
import 'package:mood_occurrences/screens/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SoundProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (context.watch<SoundProvider>().isSoundOn) {
      startBgmMusic();
    }
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.alumniSans().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Mood Occurrences',
      home: const MenuScreen(),
      // routes: <String, WidgetBuilder>{
      //   '/MenuScreen': (BuildContext context) => const MenuScreen(),
      // },
    );
  }

  void startBgmMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play(AudioAssets.bgAudio);
  }
}
