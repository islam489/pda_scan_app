import 'package:json_annotation/json_annotation.dart';

part 'confirm_receipt_order_response.g.dart';

@JsonSerializable()
class ConfirmReceiptOrderResponse {
  String? message;
  int? status;

  ConfirmReceiptOrderResponse({ this.message, this.status});

  factory ConfirmReceiptOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmReceiptOrderResponseFromJson(json);
}