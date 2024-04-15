import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pda_scan_app/core/Helpers/cache_helper.dart';
import 'package:pda_scan_app/pda_app.dart';

import 'core/DI/dependency_injection.dart';
import 'core/Routing/app_router.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp( PdaApp(
    appRouter: AppRouter(),

  ));
}
