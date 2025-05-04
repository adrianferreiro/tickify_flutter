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
  static String buildPokemonSpriteUrl(int index) =>
      'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$index.svg';
}
