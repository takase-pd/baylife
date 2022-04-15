class PlanData {
  final String plan;
  final int unitAmount;
  final int quantity;
  final String name;
  final ShippingStatus status;

  PlanData({this.plan, this.unitAmount, this.quantity, this.name, this.status});
}

class Purchase {
  final String paymentId;
  final PlanData plan;
  final DateTime purchased;

  Purchase({this.paymentId, this.plan, this.purchased});
}

enum ShippingStatus {
  contacted,
  shipping,
  shipped,
  confirming,
}

ShippingStatus getShippingStatus(String status) {
  switch (status) {
    case 'contacted':
      return ShippingStatus.contacted;
      break;
    case 'shipping':
      return ShippingStatus.shipping;
      break;
    case 'shipped':
      return ShippingStatus.shipped;
      break;
    default:
      return ShippingStatus.confirming;
      break;
  }
}
