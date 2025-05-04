class Assets {
  ///
  /// Local Assets
  ///
  static const _basePath = 'assets';
  static const _logo = '$_basePath/logo.png';

  static String get logo => _logo;

  ///
  /// Network Assets
  ///
  static String buildTicketSpriteUrl(int index) =>
      'https://www.ejemplo.com/$index.svg';
}
