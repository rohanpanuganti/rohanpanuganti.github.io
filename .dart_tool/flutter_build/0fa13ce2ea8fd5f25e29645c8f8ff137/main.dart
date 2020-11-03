// @dart = 2.7

import 'dart:ui' as ui;

import 'package:temp/main.dart' as entrypoint;

Future<void> main() async {
  if (true) {
    await ui.webOnlyInitializePlatform();
  }
  entrypoint.main();
}
