// import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pda_scan_app/core/Helpers/extentions.dart';
// import 'package:pda_scan_app/core/Theming/color.dart';
// import 'package:pda_scan_app/core/Wigets/text_form_input.dart';
// import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_state.dart';
//
// import '../../../../core/Helpers/spacing.dart';
// import '../../../../core/Routing/routes.dart';
// import '../../../../core/Theming/styles.dart';
// import '../../../../core/Wigets/app_text_button.dart';
// import '../../../../core/Wigets/custom_text.dart';
// import '../../data/models/get_purchase_order_details_response.dart';
// import '../../logic/cubit/get_purchase_order_details_cubit.dart';
// import '../wigets/get_purchase_order_bloc_builder.dart';
// class ReceiptScreen extends StatefulWidget {
//   const ReceiptScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ReceiptScreen> createState() => _ReceiptScreenState();
// }
// late GetPurchaseOrderDetailsResponse getPurchaseOrderDetailsResponse;
//
// class _ReceiptScreenState extends State<ReceiptScreen> {
//   bool loading = false;
//
//   @override
//   void initState() {
//     loading = false;
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         IconButton(onPressed: (){
//                           context.pushNamed(Routes.logoutScreen);
//                         },
//                           icon: const Icon(Icons.drag_handle_outlined),
//                           color: ColorsManager.mainBlue,
//                           iconSize: 30,
//                         ),
//                         SizedBox(height: 15.h,),
//                         Padding(
//                           padding: EdgeInsetsDirectional.only(start: 10.w),
//                           child: Row(
//                             children: [
//                               CustomText(
//                                 text: 'Receipt Screen',
//                                 fontSize: 25.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: ColorsManager.mainBlue,
//                               ),
//                               SizedBox(width: 5,),
//                               TextButton(
//                                 child:   Text("ترحيل",style: TextStyles.font16WhiteMedium.copyWith(fontWeight: FontWeight.w700),),
//                                 style:  ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(ColorsManager.gray),
//                                 ),
//                                 onPressed: (){},
//                               ),
//                               TextButton(
//                                 child:   Text("حفظ",style: TextStyles.font16WhiteMedium.copyWith(fontWeight: FontWeight.w700),),
//                                 style:  ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
//                                 ),
//                                 onPressed: (){},
//                               ),
//                               IconButton(onPressed: (){}, icon: Icon(Icons.wifi,size: 30,)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(width: 66.w,),
//
//                   ],
//                 ),
//                 verticalSpace(24),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     children: [
//                       BlocBuilder<GetPurchaseOrderDetailsCubit,GetPurchaseOrderDetailsState>(builder: (context,state){
//                         return
//                         Expanded(
//                           child: Container(
//                             padding: EdgeInsets.all(8),
//                             color: ColorsManager.mainBlue,
//                             child: Text(context.read<GetPurchaseOrderDetailsCubit>().result?.supplier_nameEn ?? "",style: TextStyles.font24BlackBold,maxLines: 2,),
//                           ),
//                         );
//                       }),
//                       SizedBox(width: 10,),
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Form(
//                               key: context.read<GetPurchaseOrderDetailsCubit>().formKey,
//                               child: AppTextForm(
//
//                                 hintText: 'رقم طلب',
//                                 validator: (String? value) {
//                                   if (value!.isEmpty) {
//                                     return "Please Enter the Number";
//                                   }
//                                   return null;
//                                 },
//
//                                 controller: context.read<GetPurchaseOrderDetailsCubit>().poNumberController,
//                               ),
//                               ),
//                             SizedBox(height: 5,),
//                             AppTextButton(
//                               buttonText: "Send",
//                               textStyle: TextStyles.font16WhiteSemiBold,
//                               onPressed: () {
//                                 validateThenDoGetPurchaseOrder(context);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//
//                 BlocBuilder<GetPurchaseOrderDetailsCubit,GetPurchaseOrderDetailsState>(builder: (context,state){
//                   if (state is Success) {
//                     loading = false;
//
//                   }
//                   return (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).isEmpty
//                       ? const SizedBox()
//                       : SizedBox(
//                     height: 400,
//                     child: DataTable(
//                       headingRowColor: MaterialStateProperty.all(ColorsManager.mainBlue),
//                       dividerThickness: 1.2,
//                       columns: const [
//                         DataColumn(
//                             label: Text(
//                               'Code',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             )),
//                         DataColumn(
//                             label: Text(
//                               'Product ',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             )),
//                         DataColumn(
//                             label: Text(
//                               'Quantity',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             )),
//                       ],
//                       rows: (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).map((e) => DataRow(
//                         cells: [
//                           DataCell(Text((e.wh_units_id ?? 0).toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
//                           const DataCell(Text('product1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
//                           const DataCell(Text('10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
//                         ],
//                         color: MaterialStateProperty.all(ColorsManager.gray),
//                       )).toList(),
//                     ),
//                   );
//                 }),
//                 SizedBox(height: 10.h,),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         child: Container(
//                           color: ColorsManager.mainBlue,
//                           height: 40,
//                           width: 40,
//                           child: const Icon(Icons.keyboard_arrow_left,size: 35,),
//
//                         ),
//                         onTap: (){
//
//                         },
//                       ),
//                       GestureDetector(
//                         child: Container(
//                           color: ColorsManager.mainBlue,
//                           height: 40,
//                           width: 40,
//                           child: const Icon(Icons.keyboard_arrow_right,size: 35,),
//
//                         ),
//                         onTap: (){
//
//                         },
//                       ),
//
//                     ],
//                   ),
//                 ),
//
//
//               ],
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void validateThenDoGetPurchaseOrder(BuildContext context) {
//     if (context.read<GetPurchaseOrderDetailsCubit>().formKey.currentState!.validate()) {
//       context.read<GetPurchaseOrderDetailsCubit>().emitGetPurchaseOrderDetailsStates();
//
//     }
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';
import 'package:pda_scan_app/features/ConfirmReceiptOrder/logic/cubit/confirm_receipt_order_cubit.dart';
import 'package:pda_scan_app/features/ConfirmReceiptOrder/presentation/confirm_receipt_order_bloc_listener.dart';

import '../../../../core/DI/dependency_injection.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/Routing/routes.dart';
import '../../../../core/Theming/color.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/Wigets/app_text_button.dart';
import '../../../../core/Wigets/custom_text.dart';
import '../../../../core/Wigets/text_form_input.dart';
import '../../data/models/get_purchase_order_hive_model.dart';
import '../../logic/cubit/get_purchase_order_details_cubit.dart';
import '../../logic/cubit/get_purchase_order_details_state.dart';
import '../wigets/get_purchase_order_ui.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  bool loading = false;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetPurchaseOrderDetailsCubit>(),
      child: Scaffold(
        body: BlocBuilder<GetPurchaseOrderDetailsCubit,
            GetPurchaseOrderDetailsState>(
          builder: (context, state) {
            if (state is Success) {
              loading = false;
            }
            return SafeArea(
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
                                onPressed: () {
                                  context.pushNamed(Routes.logoutScreen);
                                },
                                icon: const Icon(Icons.drag_handle_outlined),
                                color: ColorsManager.mainBlue,
                                iconSize: 30,
                              ),
                              SizedBox(height: 15.h),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.only(start: 10.w),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: 'Receipt Screen',
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.mainBlue,
                                    ),
                                    SizedBox(width: 5),
                                    Column(
                                      children: [
                                        TextButton(
                                          child: Text(
                                            "ترحيل",
                                            style: TextStyles.font16WhiteMedium
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    ColorsManager.gray),
                                          ),
                                          onPressed: () async {
                                            await doConfirmOrder(context);
                                          },
                                        ),
                                        const ConfirmReceiptOrderBlocListener(),
                                      ],
                                    ),
                                    TextButton(
                                      child: Text(
                                        "حفظ",
                                        style: TextStyles.font16WhiteMedium
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorsManager.mainBlue),
                                      ),
                                      onPressed: () async {
                                        saveDataLocally1(context
                                            .read<
                                                GetPurchaseOrderDetailsCubit>()
                                            .result);
                                        print(context
                                            .read<
                                                GetPurchaseOrderDetailsCubit>()
                                            .result
                                            ?.supplierNameEn);
                                        showSnackbar(context,
                                            'Data Was Saved Successfully ');
                                      },
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.wifi, size: 30)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalSpace(24),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            BlocBuilder<GetPurchaseOrderDetailsCubit,
                                GetPurchaseOrderDetailsState>(
                              builder: (context, state) {
                                return Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    color: ColorsManager.mainBlue,
                                    child: Text(
                                      context
                                              .read<
                                                  GetPurchaseOrderDetailsCubit>()
                                              .result
                                              ?.supplierNameEn ??
                                          "",
                                      style: TextStyles.font24BlackBold,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Form(
                                    key: context
                                        .read<GetPurchaseOrderDetailsCubit>()
                                        .formKey,
                                    child: AppTextForm(
                                      hintText: 'رقم طلب',
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter the Number";
                                        }
                                        return null;
                                      },
                                      controller: context
                                          .read<GetPurchaseOrderDetailsCubit>()
                                          .poNumberController,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  AppTextButton(
                                    buttonText: "Send",
                                    textStyle: TextStyles.font16WhiteSemiBold,
                                    onPressed: () {
                                      validateThenDoGetPurchaseOrder(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(30),
                      if (state is Success) GetPurchaseOrderDetailsUi(),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                color: ColorsManager.mainBlue,
                                height: 40,
                                width: 40,
                                child: const Icon(Icons.keyboard_arrow_left,
                                    size: 35),
                              ),
                              onTap: () {},
                            ),
                            GestureDetector(
                              child: Container(
                                color: ColorsManager.mainBlue,
                                height: 40,
                                width: 40,
                                child: const Icon(Icons.keyboard_arrow_right,
                                    size: 35),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      if (loading)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 50.h),
                              SpinKitFadingCircle(color: Colors.blue),
                            ],
                          ),
                        ),
                      if (state is Error)
                        Text(
                          'تاكد من الاتصال بالانترنت',
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void validateThenDoGetPurchaseOrder(BuildContext context) {
    if (context
        .read<GetPurchaseOrderDetailsCubit>()
        .formKey
        .currentState!
        .validate()) {
      context
          .read<GetPurchaseOrderDetailsCubit>()
          .emitGetPurchaseOrderDetailsStates();
      setState(() {
        loading = true;
      });
    }
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.mainBlue,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

doConfirmOrder(BuildContext context) async {
  await context
      .read<ConfirmReceiptOrderCubit>()
      .emitConfirmReceiptOrderStates();
}
