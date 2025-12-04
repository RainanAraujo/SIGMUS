import 'package:flutter/material.dart';
import 'package:sigmus/pages/mutiroes/mutiroes_page.dart';
import 'package:sigmus/pages/mutirao_cirurgia/mutirao_cirurgia_page.dart';
import 'package:sigmus/pages/mutirao_generico/mutirao_generico_page.dart';
import 'package:sigmus/pages/mutirao_refracao/mutirao_refracao_page.dart';

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
        final mutiraoId = args?['mutiraoId'] as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MutiraoCirurgiaPage(mutiraoId: mutiraoId),
          settings: settings,
        );

      case AppRoutes.mutiraoRefracao:
        final args = settings.arguments as Map<String, dynamic>?;
        final mutiraoId = args?['mutiraoId'] as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MutiraoRefracaoPage(mutiraoId: mutiraoId),
          settings: settings,
        );

      case AppRoutes.mutiraoGenerico:
        final args = settings.arguments as Map<String, dynamic>?;
        final mutiraoId = args?['mutiraoId'] as int? ?? 0;
        final nomeMutirao = args?['nomeMutirao'] as String? ?? '';
        final tipoMutirao = args?['tipoMutirao'] as String? ?? '';
        final periodoMutirao = args?['periodoMutirao'] as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => MutiraoGenericoPage(
            mutiraoId: mutiraoId,
            nomeMutirao: nomeMutirao,
            tipoMutirao: tipoMutirao,
            periodoMutirao: periodoMutirao,
          ),
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

  static void goToMutiraoRefracao({required int mutiraoId}) {
    push(AppRoutes.mutiraoRefracao, arguments: {'mutiraoId': mutiraoId});
  }

  static void goToMutiraoGenerico({
    required int mutiraoId,
    required String nomeMutirao,
    required String tipoMutirao,
    required String periodoMutirao,
  }) {
    push(
      AppRoutes.mutiraoGenerico,
      arguments: {
        'mutiraoId': mutiraoId,
        'nomeMutirao': nomeMutirao,
        'tipoMutirao': tipoMutirao,
        'periodoMutirao': periodoMutirao,
      },
    );
  }
}
