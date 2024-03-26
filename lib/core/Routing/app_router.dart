
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/core/Routing/routes.dart';
import 'package:pda_scan_app/features/Receipt/presentation/screen/receipt_screen.dart';
import 'package:pda_scan_app/features/Splash/splash_screen.dart';
import 'package:pda_scan_app/features/onBoarding/onboarding_view.dart';

import '../../features/Authintication/Login/Presentaion/screen/loginScreen.dart';
import '../../features/Authintication/Login/logic/cubit/login_cubit.dart';
import '../../features/Home/presentation/screen/home_screen.dart';
import '../DI/dependency_injection.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const Splash_Screen(),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );


      case Routes.receiptScreen:
        return MaterialPageRoute(
          builder: (_) => const ReceiptScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}