import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'get_purchase_order_details_response.dart';

part 'get_purchase_order_hive_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Order extends HiveObject {
  @HiveField(0)
  int? whOrderId;

  @HiveField(1)
  String? poNumber;

  @HiveField(2)
  String? supplier_name;

  @HiveField(3)
  String? supplier_nameEn;

  @HiveField(4)
  List<OrderItems>? orderItems;

  // Add other fields as needed

  Order({this.whOrderId, this.poNumber, this.supplier_name, this.supplier_nameEn, this.orderItems});
}


Future<void> saveDataLocally() async {
  var box = await Hive.openBox<Order>('orders');

  // Convert data into Order objects and save to Hive
  var order = Order(
    whOrderId: 20054,
    poNumber: 'PO220001000002',
    supplier_name: 'ZKONG',
    supplier_nameEn: 'ZKONG',
    orderItems: [],


  );

  await box.add(order);
}