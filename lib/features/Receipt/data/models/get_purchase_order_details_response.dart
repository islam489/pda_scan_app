import 'package:json_annotation/json_annotation.dart';

part 'get_purchase_order_details_response.g.dart';

@JsonSerializable()
class GetPurchaseOrderDetailsResponse {
  int? whOrderId;
  String? poNumber;
  String? supplier_name;
  String? supplier_nameEn;
  List<OrderItems>? orderItems;
  String? message;
  int? status;

  GetPurchaseOrderDetailsResponse({this.whOrderId, this.poNumber, this.supplier_name, this.supplier_nameEn, this.orderItems, this.message, this.status});

  factory GetPurchaseOrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPurchaseOrderDetailsResponseFromJson(json);
}


@JsonSerializable()
class OrderItems {
  int? wh_Order_id;
  int? wh_OrderDtl_id;
  int? wh_OrderDtl_lineno;
  int? wh_Item_id;
  double? wh_OrderDtl_Qty;
  String? wh_units_name_ar;
  String? wh_units_name_en;
  String? wh_item_barcodes_code;
  String? wh_Item_name_ar;
  String? wh_Item_name_en;
  String? supplier_name;
  String? supplier_nameEn;
  int? wh_item_units_Factor;
  int? wh_units_id;
  String? has_serial;
  OrderItems({this.wh_Order_id, this.wh_OrderDtl_id, this.wh_OrderDtl_lineno, this.wh_Item_id,
  this.wh_OrderDtl_Qty, this.wh_units_name_ar, this.wh_units_name_en,
  this.wh_item_barcodes_code, this.wh_Item_name_ar, this.wh_Item_name_en, this.supplier_name,
  this.supplier_nameEn, this.wh_item_units_Factor, this.wh_units_id,this.has_serial});

  factory OrderItems.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsFromJson(json);
}