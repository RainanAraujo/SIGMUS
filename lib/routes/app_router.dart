import 'package:flutter/material.dart';
import 'package:sigmus/models/mutirao_item.dart';
import 'package:sigmus/pages/mutirao_cirurgia/mutirao_cirurgia_page.dart';
import 'package:sigmus/pages/mutirao_generico/mutirao_generico_page.dart';
import 'package:sigmus/pages/mutirao_refracao/mutirao_refracao_page.dart';
import 'package:sigmus/pages/mutiroes/mutiroes_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String mutiraoCirurgia = '/mutirao-cirurgia';
  static const String mutiraoRefracao = '/mutirao-refracao';
  static const String mutiraoGenerico = '/mutirao-generico';
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
        final mutirao = args?['mutirao'] as MutiraoItem;
        return MaterialPageRoute(
          builder: (_) => MutiraoCirurgiaPage(mutirao: mutirao),
          settings: settings,
        );

      case AppRoutes.mutiraoRefracao:
        final args = settings.arguments as Map<String, dynamic>?;
        final mutirao = args?['mutirao'] as MutiraoItem;
        return MaterialPageRoute(
          builder: (_) => MutiraoRefracaoPage(mutirao: mutirao),
          settings: settings,
        );

      case AppRoutes.mutiraoGenerico:
        final args = settings.arguments as Map<String, dynamic>?;
        final mutirao = args?['mutirao'] as MutiraoItem;
        return MaterialPageRoute(
          builder: (_) => MutiraoGenericoPage(mutirao: mutirao),
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

  static void goToMutiraoCirurgia({required MutiraoItem mutirao}) {
    push(AppRoutes.mutiraoCirurgia, arguments: {'mutirao': mutirao});
  }

  static void goToMutiraoRefracao({required MutiraoItem mutirao}) {
    push(AppRoutes.mutiraoRefracao, arguments: {'mutirao': mutirao});
  }

  static void goToMutiraoGenerico({required MutiraoItem mutirao}) {
    push(AppRoutes.mutiraoGenerico, arguments: {'mutirao': mutirao});
  }
}
