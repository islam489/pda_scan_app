import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';

import '../../../../core/DI/dependency_injection.dart';
import '../../../../core/Routing/routes.dart';
import '../../../../core/Theming/color.dart';
import '../../../../core/Wigets/custom_text.dart';
import '../../../Receipt/logic/cubit/get_purchase_order_details_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> entries = <String>[
    'سند استلام مخزني',
    'سند صرف مخزني',
    'شاشة جرد الاصناف'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.drag_handle_outlined),
                          color: ColorsManager.mainBlue,
                          iconSize: 30,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 20.w),
                          child: CustomText(
                            text: 'Home Page',
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.mainBlue,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(width: 66.w,),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: BlocProvider(
                              create: (context) =>
                                  getIt<GetPurchaseOrderDetailsCubit>(),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(Routes.receiptScreen);
                                },
                                child: Container(
                                  width: 100,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border: Border.all(
                                      width: 2,
                                      color: ColorsManager.mainBlue,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(20, 20)),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      entries[index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
