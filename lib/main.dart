import 'package:flutter/material.dart';
import 'package:pda_scan_app/pda_app.dart';

import 'core/DI/dependency_injection.dart';
import 'core/Routing/app_router.dart';

void main() {
  setupGetIt();

  runApp( PdaApp(
    appRouter: AppRouter(),

  ));
}
