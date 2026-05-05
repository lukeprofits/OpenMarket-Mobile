// TODO: load AppSettings, build SourceRegistry (register every Source here), start enabled inbound sources.

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bootstrap.g.dart';

/// One-shot init run before the main app shell mounts. Splash shows while this is loading.
@Riverpod(keepAlive: true)
Future<void> appBootstrap(Ref ref) async {
  await Future<void>.delayed(const Duration(milliseconds: 800));
}
