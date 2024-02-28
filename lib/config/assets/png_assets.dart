class PngAssets {
  static String get logo => 'logo'.png;
  static String get menuBG => 'menu_bg'.png;
  static String get volunmOff => 'volunm_off'.png;
  static String get volunmOn => 'volunm_on'.png;
  static String get message => 'message'.png;
  static String get back => 'back'.png;
  static String get like => 'like'.png;
  static String get dislike => 'dislike'.png;

  static String get lethargic1 => 'lethargic_1'.png;
  static String get lethargic2 => 'lethargic_2'.png;
  static String get lethargic3 => 'lethargic_3'.png;

  static String get stressed1 => 'stressed_1'.png;
  static String get stressed2 => 'stressed_2'.png;
  static String get stressed3 => 'stressed_3'.png;
  static String get stressed4 => 'stressed_4'.png;

  static String get energetic1 => 'energetic_1'.png;
  static String get energetic2 => 'energetic_2'.png;
  static String get energetic3 => 'energetic_3'.png;
  static String get energetic4 => 'energetic_4'.png;
  static String get energetic5 => 'energetic_5'.png;

  static String get anxious1 => 'anxious_1'.png;
  static String get anxious2 => 'anxious_2'.png;
  static String get anxious3 => 'anxious_3'.png;
  static String get anxious4 => 'anxious_4'.png;

  static String get mindful1 => 'mindful_1'.png;
  static String get mindful2 => 'mindful_2'.png;
  static String get mindful3 => 'mindful_3'.png;
  static String get mindful4 => 'mindful_4'.png;
  static String get mindful5 => 'mindful_5'.png;
  static String get mindful6 => 'mindful_6'.png;
  static String get mindful7 => 'mindful_7'.png;

  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
}
