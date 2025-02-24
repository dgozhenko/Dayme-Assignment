enum AppRoutes {
  main('/main'),
  game('/game'),
  gameResult('/game_result'),
  ;

  final String path;
  const AppRoutes(this.path);
}
