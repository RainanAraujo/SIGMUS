import 'package:flutter/material.dart';
import 'package:sigmus/pages/mutiroes/mutiroes_page.dart';
import 'package:sigmus/pages/mutirao_cirurgia/mutirao_cirurgia_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String mutiraoCirurgia = '/mutirao-cirurgia';
}

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const MutiroesPage(),
          settings: settings,
        );

      case AppRoutes.mutiraoCirurgia:
        final args = settings.arguments as Map<String, dynamic>?;
        final mutiraoId = args?['mutiraoId'] as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MutiraoCirurgiaPage(mutiraoId: mutiraoId),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Center(child: Text('Rota não encontrada: ${settings.name}')),
          settings: settings,
        );
    }
  }

  static Future<T?> push<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  static Future<T?> replace<T, TO>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
    );
  }

  static void pop<T>([T? result]) {
    navigatorKey.currentState!.pop<T>(result);
  }

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static void popToHome() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static void goToMutiraoCirurgia({required int mutiraoId}) {
    push(AppRoutes.mutiraoCirurgia, arguments: {'mutiraoId': mutiraoId});
  }
}
