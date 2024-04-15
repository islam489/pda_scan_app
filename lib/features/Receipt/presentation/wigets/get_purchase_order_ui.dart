import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Theming/color.dart';
import '../../logic/cubit/get_purchase_order_details_cubit.dart';
class GetPurchaseOrderDetailsUi extends StatelessWidget {
  const GetPurchaseOrderDetailsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 400,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(ColorsManager.mainBlue),
        dividerThickness: 1.2,
        columns: const [
          DataColumn(
            label: Text(
              'Code',
              maxLines: 2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Product ',
              maxLines: 2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Required',
              maxLines: 2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // DataColumn(
          //   label: Text(
          //     'Received',
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
        rows: (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? []).map((e) => DataRow(
          cells: [
            DataCell(Text((e.wh_item_barcodes_code ?? 0).toString(),
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17,),),),
             DataCell(Text((e.wh_Item_name_en ?? 0) .toString() ,
                 maxLines: 2,
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
             DataCell(Text((e.wh_OrderDtl_Qty ?? 0) .toString(),
                 maxLines: 2,
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
            // DataCell(Text('',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
          ],
          color: MaterialStateProperty.all(ColorsManager.lightGray),
        )).toList(),
      ),
    );
  }
}
