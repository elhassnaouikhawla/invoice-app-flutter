
import 'customer_model.dart';
import 'item_model.dart';
import 'package:flutter/services.dart';

class Invoice {
  String id;
  String date;
  Customer to;
  List<Item> items;
  String paymentInstructions;
  double total;
  ByteData signature;
  Invoice(
      {required this.id,
      required this.date,
      required this.to,
      required this.items,
      required this.paymentInstructions,
      required this.total,
      required this.signature});
}
