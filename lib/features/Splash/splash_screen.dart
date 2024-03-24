import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pda_scan_app/features/onBoarding/onboarding_view.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      Future.delayed(
        const Duration(seconds: 3),
            () async {

          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>  OnboardingView()));

        },
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/business.png',
              scale: 2),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Powerd By :',style: TextStyle(color: const Color(0xFF1c3559),fontSize: 20),),
              Text('Business Systematic',style: TextStyle(color: const Color(0xFF1c3559),fontWeight: FontWeight.bold,fontSize: 20),),

            ],
          ),
        ],
      ),
    );
  }
}
