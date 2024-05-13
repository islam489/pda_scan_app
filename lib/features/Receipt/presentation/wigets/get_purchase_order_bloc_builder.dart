import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase_order_details_response.dart';

import '../../../../core/Theming/color.dart';
import '../../../../core/Theming/styles.dart';
import '../../logic/cubit/get_purchase_order_details_cubit.dart';
import '../../logic/cubit/get_purchase_order_details_state.dart';

class GetPurchaseOrderBlocBuilder extends StatefulWidget {
  const GetPurchaseOrderBlocBuilder({Key? key}) : super(key: key);

  @override
  State<GetPurchaseOrderBlocBuilder> createState() => _GetPurchaseOrderBlocBuilderState();
}

class _GetPurchaseOrderBlocBuilderState extends State<GetPurchaseOrderBlocBuilder> {
  bool loading = false;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: BlocBuilder<GetPurchaseOrderDetailsCubit,GetPurchaseOrderDetailsState>(builder: (context,state){
       if (state is Success) {
         loading = false;

       }
       return (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).isEmpty
           ? const SizedBox()
           : SizedBox(
         height: 400,
         child: DataTable(
           headingRowColor: MaterialStateProperty.all(ColorsManager.mainBlue),
           dividerThickness: 1.2,
           columns: const [
             DataColumn(
                 label: Text(
                   'Code',
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                 )),
             DataColumn(
                 label: Text(
                   'Product ',
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                 )),
             DataColumn(
                 label: Text(
                   'Quantity',
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                 )),
           ],
           rows: (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).map((e) => DataRow(
             cells: [
               DataCell(Text((e.whUnitsId ?? 0).toString(),
                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
               const DataCell(Text('product1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
               const DataCell(Text('10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
             ],
             color: MaterialStateProperty.all(ColorsManager.gray),
           )).toList(),
         ),
       );
     })
   );


  }
}



// (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).isEmpty
//     ? const SizedBox()
//     : SizedBox(
//   height: 400,
//   child: DataTable(
//     headingRowColor: MaterialStateProperty.all(ColorsManager.mainBlue),
//     dividerThickness: 1.2,
//     columns: const [
//       DataColumn(
//           label: Text(
//             'Code',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           )),
//       DataColumn(
//           label: Text(
//             'Product ',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           )),
//       DataColumn(
//           label: Text(
//             'Quantity',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           )),
//     ],
//     rows: (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).map((e) => DataRow(
//       cells: [
//         DataCell(Text((e.wh_units_id ?? 0).toString(),
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
//         const DataCell(Text('product1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
//         const DataCell(Text('10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
//       ],
//       color: MaterialStateProperty.all(ColorsManager.gray),
//     )).toList(),
//   ),
// );


