import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sigmus/data/brasil_data.dart';
import 'package:sigmus/routes/app_router.dart';
import 'package:sigmus/theme/app_theme.dart';
import 'package:sigmus/widgets/app_header.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BrasilData.init();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    center: true,
    size: const Size(1000, 800),
    minimumSize: const Size(1000, 600),

    title: 'SIGMUS',
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIGMUS',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
        },
        scrollbars: true,
      ),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      locale: const Locale('pt', 'BR'),
      home: Scaffold(
        appBar: const AppHeader(),
        body: Navigator(
          key: AppRouter.navigatorKey,
          initialRoute: AppRoutes.home,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
