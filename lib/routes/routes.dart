import 'package:go_router/go_router.dart';
import 'package:gym_new_app/modules/clients/routes/clients_routes.dart';
import 'package:gym_new_app/modules/home/routes/home_routes.dart';

final GoRouter routes = GoRouter(routes: [
  homeRoutes,
  clientRoute,
]);
