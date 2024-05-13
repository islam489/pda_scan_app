import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/DI/dependency_injection.dart';
import 'core/Routing/app_router.dart';
import 'core/Routing/routes.dart';
import 'features/Receipt/logic/cubit/get_purchase_order_details_cubit.dart';

class PdaApp extends StatelessWidget {
  final AppRouter appRouter;

  const PdaApp({Key? key, required this.appRouter,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetPurchaseOrderDetailsCubit>(),
          )
        ],
        child: MaterialApp(
          title: 'DocApp',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white
          ),
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,


          initialRoute: Routes.splashScreen,

        ),
      ),


    );
  }
}
