import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pda_scan_app/core/Theming/color.dart';
import 'package:pda_scan_app/core/Wigets/text_form_input.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/Wigets/app_text_button.dart';
import '../../../../core/Wigets/custom_text.dart';
import '../../logic/cubit/get_purchase_order_details_cubit.dart';
class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
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
                        IconButton(onPressed: (){},
                          icon: const Icon(Icons.drag_handle_outlined),
                          color: ColorsManager.mainBlue,
                          iconSize: 30,
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 10.w),
                          child: Row(
                            children: [
                              CustomText(
                                text: 'Receipt Screen',
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.mainBlue,
                              ),
                              SizedBox(width: 5,),
                              TextButton(
                                child:   Text("ترحيل",style: TextStyles.font16WhiteMedium.copyWith(fontWeight: FontWeight.w700),),
                                style:  ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(ColorsManager.gray),
                                ),
                                onPressed: (){},
                              ),
                              TextButton(
                                child:   Text("حفظ",style: TextStyles.font16WhiteMedium.copyWith(fontWeight: FontWeight.w700),),
                                style:  ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
                                ),
                                onPressed: (){},
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.wifi,size: 30,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(width: 66.w,),

                  ],
                ),
                verticalSpace(24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: ColorsManager.mainBlue,
                          child: Text('عرض اسم المورد لطلب الشراء',style: TextStyles.font24BlackBold,maxLines: 2,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          children: [
                            Form(
                              key: context.read<GetPurchaseOrderDetailsCubit>().formKey,
                              child: AppTextForm(

                                hintText: 'رقم طلب',
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter the Number";
                                  }
                                  return null;
                                },

                                controller: context.read<GetPurchaseOrderDetailsCubit>().poNumberController,
                              ),
                              ),
                            SizedBox(height: 5,),
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

                SizedBox(
                  height: 500,
                  child: ListView(children: <Widget>[
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(ColorsManager.mainBlue),
                        dividerThickness: 1.2,
                        columns: const [
                          DataColumn(label: Text(
                              'Code',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          )),
                          DataColumn(label: Text(
                              'Product ',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          )),
                          DataColumn(label: Text(
                              'Quantity',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          )),
                        ],
                        rows: [
                          DataRow(
                            cells: const [
                              DataCell(Text('1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('product1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('10',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                            ],
                            color: MaterialStateProperty.all(ColorsManager.gray),
                          ),
                          DataRow(
                            cells: const [
                              DataCell(Text('2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('Product2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('25',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                            ],
                            color: MaterialStateProperty.all(ColorsManager.gray),

                          ),
                          DataRow(
                            cells: const [
                              DataCell(Text('3',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('Product3',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('6',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                            ],
                            color: MaterialStateProperty.all(ColorsManager.gray),

                          ),
                          DataRow(
                            cells: const [
                              DataCell(Text('4',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('Product4',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                              DataCell(Text('38',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                            ],
                            color: MaterialStateProperty.all(ColorsManager.gray),

                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 10.h,),
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
                          child: const Icon(Icons.keyboard_arrow_left,size: 35,),

                        ),
                        onTap: (){

                        },
                      ),
                      GestureDetector(
                        child: Container(
                          color: ColorsManager.mainBlue,
                          height: 40,
                          width: 40,
                          child: const Icon(Icons.keyboard_arrow_right,size: 35,),

                        ),
                        onTap: (){

                        },
                      ),

                    ],
                  ),
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
  void validateThenDoGetPurchaseOrder(BuildContext context) {
    if (context.read<GetPurchaseOrderDetailsCubit>().formKey.currentState!.validate()) {
      context.read<GetPurchaseOrderDetailsCubit>().emitLoginStates();
    }
  }
}
