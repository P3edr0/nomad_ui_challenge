import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Para Hive.initFlutter()
import 'package:nomad/data/config_storage.dart';
import 'package:nomad/pages/splash_page.dart';
import 'package:nomad/pages/store/config_controller.dart';
import 'package:nomad/theme/custom_themes/theme.dart';
import 'package:nomad/utils/i18n/locale_controller.dart';
import 'package:nomad/utils/i18n/localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await ConfigStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = LocaleController.instance();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConfigController>(
          create: (_) => ConfigController(),
        ),
      ],

      child: MaterialApp(
        theme: NomadAppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        locale: localeController.locale,
        supportedLocales: [localeController.locale],
        localizationsDelegates: NomadLocalizations.localizationsDelegates,

        // home: AppWithBanner(child: const SplashPage()),
        home: const SplashPage(),
      ),
    );
  }
}

// class AppWithBanner extends StatelessWidget {
//   final Widget child;

//   const AppWithBanner({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         if (kDebugMode) const _EnvBanner(label: "DEBUG", color: Colors.red),
//         if (kProfileMode)
//           const _EnvBanner(label: "PROFILE", color: Colors.orange),
//         if (kReleaseMode)
//           const _EnvBanner(label: "RELEASE", color: Colors.green),
//       ],
//     );
//   }
// }

// class _EnvBanner extends StatelessWidget {
//   final String label;
//   final Color color;

//   const _EnvBanner({required this.label, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 0,
//       left: 0,
//       child: Banner(
//         message: label,
//         location: BannerLocation.topStart,
//         color: color.withOpacity(0.8),
//       ),
//     );
//   }
// }
