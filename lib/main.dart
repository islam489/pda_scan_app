import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pda_scan_app/core/Helpers/cache_helper.dart';
import 'package:pda_scan_app/pda_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/DI/dependency_injection.dart';
import 'core/Routing/app_router.dart';
import 'features/Receipt/data/models/get_purchase_order_details_response.dart';
import 'features/Receipt/data/models/get_purchase_order_hive_model.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(OrderResponseAdapter());
  Hive.registerAdapter(OrderItemAdapter());



  setupGetIt();
  runApp( PdaApp(
    appRouter: AppRouter(),

  ));
}
