// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_purchase_order_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderResponseAdapter extends TypeAdapter<OrderResponse> {
  @override
  final int typeId = 3;

  @override
  OrderResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderResponse(
      whOrderId: fields[0] as int?,
      poNumber: fields[1] as String?,
      supplierName: fields[2] as String?,
      supplierNameEn: fields[3] as String?,
      orderItems: (fields[4] as List?)?.cast<OrderItem>(),
      message: fields[5] as String?,
      status: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderResponse obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.whOrderId)
      ..writeByte(1)
      ..write(obj.poNumber)
      ..writeByte(2)
      ..write(obj.supplierName)
      ..writeByte(3)
      ..write(obj.supplierNameEn)
      ..writeByte(4)
      ..write(obj.orderItems)
      ..writeByte(5)
      ..write(obj.message)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderItemAdapter extends TypeAdapter<OrderItem> {
  @override
  final int typeId = 4;

  @override
  OrderItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItem(
      whOrderId: fields[0] as int?,
      whOrderDtlId: fields[1] as int?,
      whOrderDtlLineno: fields[2] as int?,
      whItemId: fields[3] as int?,
      whOrderDtlQty: fields[4] as double?,
      whUnitsNameAr: fields[5] as String?,
      whUnitsNameEn: fields[6] as String?,
      whItemBarcodesCode: fields[7] as String?,
      whItemNameAr: fields[8] as String?,
      whItemNameEn: fields[9] as String?,
      supplierName: fields[10] as String?,
      supplierNameEn: fields[11] as String?,
      whItemUnitsFactor: fields[12] as int?,
      whUnitsId: fields[13] as int?,
      hasSerial: fields[14] as String?,
      receivedQty: fields[16] as num?,
      serialDetails: (fields[15] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderItem obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.whOrderId)
      ..writeByte(1)
      ..write(obj.whOrderDtlId)
      ..writeByte(2)
      ..write(obj.whOrderDtlLineno)
      ..writeByte(3)
      ..write(obj.whItemId)
      ..writeByte(4)
      ..write(obj.whOrderDtlQty)
      ..writeByte(5)
      ..write(obj.whUnitsNameAr)
      ..writeByte(6)
      ..write(obj.whUnitsNameEn)
      ..writeByte(7)
      ..write(obj.whItemBarcodesCode)
      ..writeByte(8)
      ..write(obj.whItemNameAr)
      ..writeByte(9)
      ..write(obj.whItemNameEn)
      ..writeByte(10)
      ..write(obj.supplierName)
      ..writeByte(11)
      ..write(obj.supplierNameEn)
      ..writeByte(12)
      ..write(obj.whItemUnitsFactor)
      ..writeByte(13)
      ..write(obj.whUnitsId)
      ..writeByte(14)
      ..write(obj.hasSerial)
      ..writeByte(15)
      ..write(obj.serialDetails)
      ..writeByte(16)
      ..write(obj.receivedQty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      whOrderId: (json['whOrderId'] as num?)?.toInt(),
      poNumber: json['poNumber'] as String?,
      supplierName: json['supplierName'] as String?,
      supplierNameEn: json['supplierNameEn'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'whOrderId': instance.whOrderId,
      'poNumber': instance.poNumber,
      'supplierName': instance.supplierName,
      'supplierNameEn': instance.supplierNameEn,
      'orderItems': instance.orderItems,
      'message': instance.message,
      'status': instance.status,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      whOrderId: (json['whOrderId'] as num?)?.toInt(),
      whOrderDtlId: (json['whOrderDtlId'] as num?)?.toInt(),
      whOrderDtlLineno: (json['whOrderDtlLineno'] as num?)?.toInt(),
      whItemId: (json['whItemId'] as num?)?.toInt(),
      whOrderDtlQty: (json['whOrderDtlQty'] as num?)?.toDouble(),
      whUnitsNameAr: json['whUnitsNameAr'] as String?,
      whUnitsNameEn: json['whUnitsNameEn'] as String?,
      whItemBarcodesCode: json['whItemBarcodesCode'] as String?,
      whItemNameAr: json['whItemNameAr'] as String?,
      whItemNameEn: json['whItemNameEn'] as String?,
      supplierName: json['supplierName'] as String?,
      supplierNameEn: json['supplierNameEn'] as String?,
      whItemUnitsFactor: (json['whItemUnitsFactor'] as num?)?.toInt(),
      whUnitsId: (json['whUnitsId'] as num?)?.toInt(),
      hasSerial: json['hasSerial'] as String?,
      receivedQty: json['receivedQty'] as num?,
      serialDetails: (json['serialDetails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'whOrderId': instance.whOrderId,
      'whOrderDtlId': instance.whOrderDtlId,
      'whOrderDtlLineno': instance.whOrderDtlLineno,
      'whItemId': instance.whItemId,
      'whOrderDtlQty': instance.whOrderDtlQty,
      'whUnitsNameAr': instance.whUnitsNameAr,
      'whUnitsNameEn': instance.whUnitsNameEn,
      'whItemBarcodesCode': instance.whItemBarcodesCode,
      'whItemNameAr': instance.whItemNameAr,
      'whItemNameEn': instance.whItemNameEn,
      'supplierName': instance.supplierName,
      'supplierNameEn': instance.supplierNameEn,
      'whItemUnitsFactor': instance.whItemUnitsFactor,
      'whUnitsId': instance.whUnitsId,
      'hasSerial': instance.hasSerial,
      'serialDetails': instance.serialDetails,
      'receivedQty': instance.receivedQty,
    };
