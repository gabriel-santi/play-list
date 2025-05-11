import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:play_list/interface/page/home_page.dart';
import 'package:play_list/interface/page/login_page.dart';
import 'package:play_list/interface/page/not_found_page.dart';
import 'package:play_list/interface/page/sing_in_page.dart';
import 'package:play_list/interface/route/app_routes.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: AppRoutes.login.name,
      name: AppRoutes.login.name,
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: LoginPage(),
      ),
      routes: [
        GoRoute(
          path: AppRoutes.signIn.name,
          name: AppRoutes.signIn.name,
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: SignInPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: "/",
      name: AppRoutes.home.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
