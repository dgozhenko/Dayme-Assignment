enum AppRoutes {
  promo('/promo'),
  game('/game'),
  gameResult('/game_result'),
  ;

  final String path;
  const AppRoutes(this.path);
}
