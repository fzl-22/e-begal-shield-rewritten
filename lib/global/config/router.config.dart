import 'package:e_begal_shield_rewritten/modules/auth/login.page.dart';
import 'package:e_begal_shield_rewritten/modules/auth/register.page.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: "/login",
  routes: <RouteBase>[
    GoRoute(
      name: 'login',
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'register',
      path: "/register",
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
