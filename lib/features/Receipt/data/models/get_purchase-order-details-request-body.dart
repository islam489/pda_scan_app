import 'package:json_annotation/json_annotation.dart';

part 'get_purchase-order-details-request-body.g.dart';

@JsonSerializable()
class GetPurchaseOrderDetailsBody {
  String? poNumber;


  GetPurchaseOrderDetailsBody({this.poNumber});

  Map<String, dynamic> toJson() => _$GetPurchaseOrderDetailsBodyToJson(this);
}