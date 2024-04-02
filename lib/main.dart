import 'package:flutter/material.dart';
import 'package:pda_scan_app/core/Helpers/cache_helper.dart';
import 'package:pda_scan_app/pda_app.dart';

import 'core/DI/dependency_injection.dart';
import 'core/Routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //CacheHelper().getData(key: "accessToken");
  setupGetIt();
  runApp( PdaApp(
    appRouter: AppRouter(),

  ));
}
