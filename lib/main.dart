import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bootstrap.dart';
import 'features/browse/browse_screen.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: _BootstrapGate()));
}

/// Watches [appBootstrapProvider] — shows the splash while loading,
/// otherwise hands off to [MyApp]. Bootstrap is the one place to put real
/// startup work; everything below stays as the default Flutter scaffold.
class _BootstrapGate extends ConsumerWidget {
  const _BootstrapGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boot = ref.watch(appBootstrapProvider);
    return boot.when(
      loading: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
      error: (e, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(error: e),
      ),
      data: (_) => const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenMarket',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const BrowseScreen(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    // TRY THIS: change `seedColor` and hot-reload (`r`) to retheme the whole
    // app. Material 3 derives every surface, accent and on-color from this
    // single value.
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFE65100), // warm marketplace orange
      brightness: brightness,
    );
    final base = ThemeData(useMaterial3: true, colorScheme: scheme);
    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        surfaceTintColor: scheme.surface,
      ),
      scaffoldBackgroundColor: scheme.surface,
    );
  }
}
