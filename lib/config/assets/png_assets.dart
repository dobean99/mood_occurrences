class PngAssets {
  static String get logo => 'logo'.png;
  static String get menuBG => 'menu_bg'.png;
  static String get volunmOff => 'volunm_off'.png;
  static String get volunmOn => 'volunm_on'.png;
  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
}
