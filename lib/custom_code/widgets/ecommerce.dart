import 'package:cloud_firestore/cloud_firestore.dart';

class PlanData {
  final DocumentReference plan;
  final int unitAmount;
  final int quantity;
  final String name;

  PlanData({this.plan, this.unitAmount, this.quantity, this.name});
}
