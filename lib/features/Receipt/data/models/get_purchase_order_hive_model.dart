import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_purchase_order_hive_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class OrderResponse extends HiveObject {
  @HiveField(0)
  int? whOrderId;

  @HiveField(1)
  String? poNumber;

  @HiveField(2)
  String? supplierName;

  @HiveField(3)
  String? supplierNameEn;

  @HiveField(4)
  List<OrderItem>? orderItems;

  @HiveField(5)
  String? message;

  @HiveField(6)
  int? status;

  OrderResponse(
      {required this.whOrderId,
      required this.poNumber,
      required this.supplierName,
      required this.supplierNameEn,
      required this.orderItems,
      required this.message,
      required this.status});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      whOrderId: json['whOrderId'],
      poNumber: json['poNumber'],
      supplierName: json['supplier_name'],
      supplierNameEn: json['supplier_nameEn'],
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        "whOrderId": whOrderId,
        "poNumber": poNumber,
        "supplier_name": supplierName,
        "supplier_nameEn": supplierNameEn,
        "orderItems": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };

  OrderResponse copyWith({
    int? whOrderId,
    String? poNumber,
    String? supplierName,
    String? supplierNameEn,
    List<OrderItem>? orderItems,
    String? message,
    int? status,
  }) {
    return OrderResponse(
      whOrderId: whOrderId ?? this.whOrderId,
      poNumber: poNumber ?? this.poNumber,
      supplierName: supplierName ?? this.supplierName,
      supplierNameEn: supplierNameEn ?? this.supplierNameEn,
      orderItems: orderItems ?? this.orderItems,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 4)
class OrderItem extends HiveObject {
  @HiveField(0)
  int? whOrderId;

  @HiveField(1)
  int? whOrderDtlId;

  @HiveField(2)
  int? whOrderDtlLineno;

  @HiveField(3)
  int? whItemId;

  @HiveField(4)
  double? whOrderDtlQty;

  @HiveField(5)
  String? whUnitsNameAr;

  @HiveField(6)
  String? whUnitsNameEn;

  @HiveField(7)
  String? whItemBarcodesCode;

  @HiveField(8)
  String? whItemNameAr;

  @HiveField(9)
  String? whItemNameEn;

  @HiveField(10)
  String? supplierName;

  @HiveField(11)
  String? supplierNameEn;

  @HiveField(12)
  int? whItemUnitsFactor;

  @HiveField(13)
  int? whUnitsId;

  @HiveField(14)
  String? hasSerial;

  @HiveField(15)
  List<String>? serialDetails;

  @HiveField(16)
  num? receivedQty;

  OrderItem({
    required this.whOrderId,
    required this.whOrderDtlId,
    required this.whOrderDtlLineno,
    required this.whItemId,
    required this.whOrderDtlQty,
    required this.whUnitsNameAr,
    required this.whUnitsNameEn,
    required this.whItemBarcodesCode,
    required this.whItemNameAr,
    required this.whItemNameEn,
    required this.supplierName,
    required this.supplierNameEn,
    required this.whItemUnitsFactor,
    required this.whUnitsId,
    required this.hasSerial,
    required this.receivedQty,
    required this.serialDetails,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      whOrderId: json['wh_Order_id'],
      whOrderDtlId: json['wh_OrderDtl_id'],
      whOrderDtlLineno: json['wh_OrderDtl_lineno'],
      whItemId: json['wh_Item_id'],
      whOrderDtlQty: json['wh_OrderDtl_Qty'],
      whUnitsNameAr: json['wh_units_name_ar'],
      whUnitsNameEn: json['wh_units_name_en'],
      whItemBarcodesCode: json['wh_item_barcodes_code'],
      whItemNameAr: json['wh_Item_name_ar'],
      whItemNameEn: json['wh_Item_name_en'],
      supplierName: json['supplier_name'],
      supplierNameEn: json['supplier_nameEn'],
      whItemUnitsFactor: json['wh_item_units_Factor'],
      whUnitsId: json['wh_units_id'],
      hasSerial: json['has_serial'],
      serialDetails: json['serial_details'] ?? [],
      receivedQty: json['receivedQty'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "wh_Order_id": whOrderId,
        "wh_OrderDtl_id": whOrderDtlId,
        "wh_OrderDtl_lineno": whOrderDtlLineno,
        "wh_Item_id": whItemId,
        "wh_OrderDtl_Qty": whOrderDtlQty,
        "wh_units_name_ar": whUnitsNameAr,
        "wh_units_name_en": whUnitsNameEn,
        "wh_item_barcodes_code": whItemBarcodesCode,
        "wh_Item_name_ar": whItemNameAr,
        "wh_Item_name_en": whItemNameEn,
        "supplier_name": supplierName,
        "supplier_nameEn": supplierNameEn,
        "wh_item_units_Factor": whItemUnitsFactor,
        "wh_units_id": whUnitsId,
        "has_serial": hasSerial,
        'serial_details': hasSerial == 'Y' ? serialDetails : [],
        "receivedQty": receivedQty,
      };

  OrderItem copyWith({
    int? whOrderId,
    int? whOrderDtlId,
    int? whOrderDtlLineno,
    int? whItemId,
    double? whOrderDtlQty,
    String? whUnitsNameAr,
    String? whUnitsNameEn,
    String? whItemBarcodesCode,
    String? whItemNameAr,
    String? whItemNameEn,
    String? supplierName,
    String? supplierNameEn,
    int? whItemUnitsFactor,
    int? whUnitsId,
    String? hasSerial,
    List<String>? serialDetails,
    num? receivedQty,
  }) {
    return OrderItem(
      whOrderId: whOrderId ?? this.whOrderId,
      whOrderDtlId: whOrderDtlId ?? this.whOrderDtlId,
      whOrderDtlLineno: whOrderDtlLineno ?? this.whOrderDtlLineno,
      whItemId: whItemId ?? this.whItemId,
      whOrderDtlQty: whOrderDtlQty ?? this.whOrderDtlQty,
      whUnitsNameAr: whUnitsNameAr ?? this.whUnitsNameAr,
      whUnitsNameEn: whUnitsNameEn ?? this.whUnitsNameEn,
      whItemBarcodesCode: whItemBarcodesCode ?? this.whItemBarcodesCode,
      whItemNameAr: whItemNameAr ?? this.whItemNameAr,
      whItemNameEn: whItemNameEn ?? this.whItemNameEn,
      supplierName: supplierName ?? this.supplierName,
      supplierNameEn: supplierNameEn ?? this.supplierNameEn,
      whItemUnitsFactor: whItemUnitsFactor ?? this.whItemUnitsFactor,
      whUnitsId: whUnitsId ?? this.whUnitsId,
      hasSerial: hasSerial ?? this.hasSerial,
      serialDetails: serialDetails ?? this.serialDetails,
      receivedQty: receivedQty ?? this.receivedQty,
    );
  }
}

Future<void> saveDataLocally(OrderResponse? purchase) async {
  if (purchase == null) {
    // Show alert
    return;
  }
  var box = await Hive.openBox<List<OrderResponse>>('Purchases');
  List<OrderResponse>? purchases = box.get('allPurchases') ?? [];
  purchases.add(purchase);
  box.clear();
  await box.put('allPurchases', purchases);
  await box.close();
}

Future<void> saveDataLocally1(OrderResponse? purchase) async {
  if (purchase == null) {
    // Show alert or handle the null case
    return;
  }
  print('succccccccces1');
  var box = await Hive.openBox<List<dynamic>>(
      'Purchases'); // Open box of dynamic list
  List<dynamic> purchases =
      box.get('allPurchases') ?? []; // Retrieve as dynamic list
  // Convert dynamic list to List<OrderResponse>
  List<OrderResponse> typedPurchases = purchases.cast<OrderResponse>();
  bool itemExists =
      typedPurchases.any((item) => item.whOrderId == purchase.whOrderId);
  if (itemExists) {
    // If it exists, find the index of the existing item and replace it
    int index = typedPurchases
        .indexWhere((item) => item.whOrderId == purchase.whOrderId);
    typedPurchases[index] = purchase;
  } else {
    typedPurchases.add(purchase);
  }
  await box.put('allPurchases', typedPurchases);
  await box.close();
}
