import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_receipt_order_state.freezed.dart';

@freezed
class ConfirmReceiptOrderState<T> with _$ConfirmReceiptOrderState<T> {
  const factory ConfirmReceiptOrderState.initial() = _Initial;

  const factory ConfirmReceiptOrderState.loading() = Loading;

  const factory ConfirmReceiptOrderState.success(T data) = Success<T>;

  const factory ConfirmReceiptOrderState.error({required String error}) = Error;
}
