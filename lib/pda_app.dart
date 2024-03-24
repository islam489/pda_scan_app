import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Routing/app_router.dart';
import 'core/Routing/routes.dart';

class PdaApp extends StatelessWidget {
  final AppRouter appRouter;

  const PdaApp({Key? key, required this.appRouter, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375,812) ,
      minTextAdapt: true,
      child: MaterialApp(
        title: 'DocApp',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white
        ),
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,

      ),


    );
  }
}
