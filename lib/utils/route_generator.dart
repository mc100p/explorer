import 'dart:io';
import 'package:explorer/pages/homepage/homepage.dart';
import 'package:explorer/pages/welcome/welcome.dart';
import 'package:explorer/utils/magic_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Welcome(),
      ),
      GoRoute(
        name: RouteNames.homepage,
        path: '/homepage',
        pageBuilder: (context, state) {
          // final args = state.extra! as Products;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: HomePage(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorRoute(),
    errorPageBuilder: (context, state) => MaterialPage(child: ErrorRoute()),
  );
}

class ErrorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error - 400"),
        leading: IconButton(
          icon: IconButton(
            icon: Platform.isIOS
                ? Icon(Icons.arrow_back_ios)
                : Icon(Icons.arrow_back_outlined),
            onPressed: () => Navigator.pop(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          "Page Not Found....",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    // transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //     ScaleTransition(scale: animation, child: child),
  );
}
