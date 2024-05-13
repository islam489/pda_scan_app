import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase_order_hive_model.dart';

import '../../../../core/Theming/color.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/Wigets/app_text_button.dart';
import '../../logic/cubit/get_purchase_order_details_cubit.dart';

class GetPurchaseOrderDetailsUi extends StatefulWidget {
  const GetPurchaseOrderDetailsUi({Key? key}) : super(key: key);

  @override
  State<GetPurchaseOrderDetailsUi> createState() =>
      _GetPurchaseOrderDetailsUiState();
}

class _GetPurchaseOrderDetailsUiState extends State<GetPurchaseOrderDetailsUi> {
  someFunction(GetPurchaseOrderDetailsCubit cubit) async {
    var box = await Hive.openBox<List<dynamic>>('Purchases');
    List<dynamic> purchases = box.get('allPurchases') ?? [];
    List<OrderResponse> typedPurchases = purchases.cast<OrderResponse>();

    final whOrderId = cubit.result?.whOrderId ?? 0;

    final orderItems = typedPurchases
        .where((element) => element.whOrderId == whOrderId)
        .first
        .orderItems;

    cubit.orderItems = orderItems;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: DataTable(
        columnSpacing: 5.5,
        headingRowColor: MaterialStateProperty.all(ColorsManager.mainBlue),
        dividerThickness: 2.5,
        columns: const [
          DataColumn(
            label: Text(
              'Code',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Product ',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Required',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Received',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: (context.read<GetPurchaseOrderDetailsCubit>().orderItems ?? [])
            .map((e) => DataRow(
                  cells: [
                    DataCell(
                      SizedBox(
                        width: 75,
                        child: FittedBox(
                          child: Text(
                            (e.whItemBarcodesCode ?? 0).toString(),
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(SizedBox(
                      width: 80,
                      child: FittedBox(
                        child: Text((e.whItemNameEn ?? 0).toString(),
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    )),
                    DataCell(SizedBox(
                      width: 75,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text((e.whOrderDtlQty ?? 0).toString(),
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    )),
                    DataCell(
                      SizedBox(
                        width: 50,
                        child: FittedBox(
                          child: Text(
                              e.receivedQty == 0
                                  ? ''
                                  : e.receivedQty.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                      onTap: () async {
                        final result = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ScannerDialog(
                                order: e,
                                orderId: e.whOrderId ?? 0,
                              );
                            }).whenComplete(() async {
                          await someFunction(
                              context.read<GetPurchaseOrderDetailsCubit>());
                          setState(() {});
                        });
                      },
                    ),
                  ],
                  color: MaterialStateProperty.all(ColorsManager.lightGray),
                ))
            .toList(),
      ),
    );
  }
}

class ScannerDialog extends StatefulWidget {
  final OrderItem order;
  final int orderId;

  ScannerDialog({required this.order, required this.orderId});

  @override
  State<ScannerDialog> createState() => _ScannerDialogState();
}

class _ScannerDialogState extends State<ScannerDialog> {
  List<String> barcodes = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        width: 300,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: MobileScanner(
                  allowDuplicates: true,
                  fit: BoxFit.contain,
                  controller: MobileScannerController(
                    facing: CameraFacing.back,
                    torchEnabled: true,
                  ),
                  onDetect: (barcode, args) {
                    try {
                      if (barcode.rawValue == null) {
                        debugPrint('Failed to scan Barcode');
                      } else {
                        final String code = barcode.rawValue!;
                        if (!barcodes.contains(barcode.rawValue)) {
                          setState(() {
                            barcodes.add(barcode.rawValue ?? '');
                          });
                        }
                        debugPrint('Barcode found! $code');
                      }
                    } catch (e) {}
                  }),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: barcodes.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Text(
                  barcodes[index],
                ),
              ),
            ),
            const SizedBox(height: 20),
            AppTextButton(
              buttonText: "Finish",
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () async {
                var box = await Hive.openBox<List<dynamic>>('Purchases');
                Set<String> uniqueSet = Set<String>.from(
                    barcodes); // Add barcodes to set to remove duplicates

                // Add oldBarcodes to set
                uniqueSet.addAll(widget.order.serialDetails ?? []);

                OrderItem updatedOrderItem = widget.order.copyWith(
                  receivedQty: uniqueSet.toList().length,
                  serialDetails: uniqueSet.toList(),
                );
                List<dynamic> purchases = box.get('allPurchases') ?? [];
                List<OrderResponse> typedPurchases =
                    purchases.cast<OrderResponse>();
                int index = typedPurchases
                    .indexWhere((item) => item.whOrderId == widget.orderId);
                List<OrderItem> newItems = [];
                for (OrderItem item
                    in (typedPurchases[index].orderItems ?? [])) {
                  if (item.whOrderDtlId == updatedOrderItem.whOrderDtlId) {
                    newItems.add(updatedOrderItem);
                  } else {
                    newItems.add(item);
                  }
                }

                typedPurchases[index] = typedPurchases[index].copyWith(
                  orderItems: newItems,
                );
                await box.put('allPurchases', typedPurchases);
                await box.close();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// var box = await Hive.openBox<List<dynamic>>('Purchases');
// OrderItem updatedOrderItem = widget.order.copyWith(
//   receivedQty: barcodes.length,
//   serialDetails: barcodes,
// );
// List<dynamic> purchases = box.get('allPurchases') ?? [];
// List<OrderResponse> typedPurchases =
// purchases.cast<OrderResponse>();
// int index = typedPurchases
//     .indexWhere((item) => item.whOrderId == widget.orderId);
// typedPurchases[index]; this the request
