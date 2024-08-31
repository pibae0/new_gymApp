import 'package:go_router/go_router.dart';
import 'package:gym_new_app/modules/home/pages/home_page.dart';

final GoRoute homeRoutes = GoRoute(
    path: '/',
    name: 'home',
    builder: (
      context,
      state,
    ) =>
        const HomePage());
