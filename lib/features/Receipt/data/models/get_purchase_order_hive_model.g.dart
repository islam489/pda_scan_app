// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_purchase_order_hive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      whOrderId: json['whOrderId'] as int?,
      poNumber: json['poNumber'] as String?,
      supplier_name: json['supplier_name'] as String?,
      supplier_nameEn: json['supplier_nameEn'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'whOrderId': instance.whOrderId,
      'poNumber': instance.poNumber,
      'supplier_name': instance.supplier_name,
      'supplier_nameEn': instance.supplier_nameEn,
      'orderItems': instance.orderItems,
    };
