import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_purchase_order_details_state.freezed.dart';

@freezed
class GetPurchaseOrderDetailsState<T> with _$GetPurchaseOrderDetailsState<T> {
  const factory GetPurchaseOrderDetailsState.initial() = _Initial;
  const factory GetPurchaseOrderDetailsState.loading() = Loading;
  const factory GetPurchaseOrderDetailsState.success(T data) = Success<T>;
  const factory GetPurchaseOrderDetailsState.error({required String error}) = Error;
}