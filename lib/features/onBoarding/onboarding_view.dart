import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/features/Authintication/Login/Presentaion/screen/loginScreen.dart';
import 'package:pda_scan_app/features/Home/presentation/screen/home_screen.dart';
import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/DI/dependency_injection.dart';
import '../../core/Helpers/cache_helper.dart';
import '../../core/Networking/api_constants.dart';
import '../../core/Theming/color.dart';
import '../Authintication/Login/logic/cubit/login_cubit.dart';
import '../Receipt/presentation/screen/receipt_screen.dart';
import 'onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: isLastPage? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Skip Button
            TextButton(
                onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
                child: const Text("Skip")),

            //Indicator
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index)=> pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: ColorsManager.mainBlue,
              ),
            ),

            //Next Button
            TextButton(
                onPressed: ()=>pageController.nextPage(
                    duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                child: const Text("Next")),


          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (index)=> setState(()=> isLastPage = controller.items.length-1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context,index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 15),
                  Text(controller.items[index].title,
                    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15),
                  Text(controller.items[index].descriptions,
                      style: const TextStyle(color: Colors.grey,fontSize: 17), textAlign: TextAlign.center),
                ],
              );

            }),
      ),
    );
  }

  //Now the problem is when press get started button
  // after re run the app we see again the onboarding screen
  // so lets do one time onboarding

  //Get started button

  Widget getStarted(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorsManager.mainBlue
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: ()async{
            final pres = await SharedPreferences.getInstance();
            pres.setBool("onboarding", true);
            //After we press get started button this onboarding value become true
            // same key
            if(!mounted)return;
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => getIt<LoginCubit>(),
                    child:  const LoginScreen(),
                  ),)
            );
          },
          child: const Text("Get started",style: TextStyle(color: Colors.white),)),
    );
  }
}