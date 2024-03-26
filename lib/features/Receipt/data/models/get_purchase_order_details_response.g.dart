// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_purchase_order_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPurchaseOrderDetailsResponse _$GetPurchaseOrderDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetPurchaseOrderDetailsResponse(
      whOrderId: json['whOrderId'] as int?,
      poNumber: json['poNumber'] as String?,
      supplier_name: json['supplier_name'] as int?,
      supplier_nameEn: json['supplier_nameEn'] as String?,
      orderItems: json['orderItems'] == null
          ? null
          : OrderItems.fromJson(json['orderItems'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$GetPurchaseOrderDetailsResponseToJson(
        GetPurchaseOrderDetailsResponse instance) =>
    <String, dynamic>{
      'whOrderId': instance.whOrderId,
      'poNumber': instance.poNumber,
      'supplier_name': instance.supplier_name,
      'supplier_nameEn': instance.supplier_nameEn,
      'orderItems': instance.orderItems,
      'message': instance.message,
      'status': instance.status,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
      wh_Order_id: json['wh_Order_id'] as int?,
      wh_OrderDtl_id: json['wh_OrderDtl_id'] as int?,
      wh_OrderDtl_lineno: json['wh_OrderDtl_lineno'] as int?,
      wh_Item_id: json['wh_Item_id'] as int?,
      wh_OrderDtl_Qty: json['wh_OrderDtl_Qty'] as int?,
      wh_units_name_ar: json['wh_units_name_ar'] as String?,
      wh_units_name_en: json['wh_units_name_en'] as String?,
      wh_item_barcodes_code: json['wh_item_barcodes_code'] as String?,
      wh_Item_name_ar: json['wh_Item_name_ar'] as String?,
      wh_Item_name_en: json['wh_Item_name_en'] as String?,
      supplier_name: json['supplier_name'] as String?,
      supplier_nameEn: json['supplier_nameEn'] as String?,
      wh_item_units_Factor: json['wh_item_units_Factor'] as int?,
      wh_units_id: json['wh_units_id'] as int?,
      has_serial: json['has_serial'] as bool?,
    );

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'wh_Order_id': instance.wh_Order_id,
      'wh_OrderDtl_id': instance.wh_OrderDtl_id,
      'wh_OrderDtl_lineno': instance.wh_OrderDtl_lineno,
      'wh_Item_id': instance.wh_Item_id,
      'wh_OrderDtl_Qty': instance.wh_OrderDtl_Qty,
      'wh_units_name_ar': instance.wh_units_name_ar,
      'wh_units_name_en': instance.wh_units_name_en,
      'wh_item_barcodes_code': instance.wh_item_barcodes_code,
      'wh_Item_name_ar': instance.wh_Item_name_ar,
      'wh_Item_name_en': instance.wh_Item_name_en,
      'supplier_name': instance.supplier_name,
      'supplier_nameEn': instance.supplier_nameEn,
      'wh_item_units_Factor': instance.wh_item_units_Factor,
      'wh_units_id': instance.wh_units_id,
      'has_serial': instance.has_serial,
    };
