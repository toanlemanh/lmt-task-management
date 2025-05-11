enum AppRoutes {
  home('/home'),
  detail('/detail'),
  analysis('/analysis'),
  add('/add'),
  edit('/edit')
  ;
  final String path;

  const AppRoutes(this.path);
}
