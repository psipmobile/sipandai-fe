import 'package:flutter/material.dart';
import 'package:samsat_gpt/core.dart';

final GoRouter router = GoRouter(
  navigatorKey: Get.navigatorKey,
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (context, state) {
        return state.uri.toString();
      },
      builder: (BuildContext context, GoRouterState state) {
        return const SelectionArea(
          child: ChatView(),
        );
      },
      routes: const <RouteBase>[
        // GoRoute(
        //   path: 'login',
        //   redirect: (context, state) {
        //     return null;
        //   },
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const SelectionArea(
        //       child: C(),
        //     );
        //   },
        // ),
      ],
    ),
  ],
);
