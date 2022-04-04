class PlanData {
  final String pid;
  final int unitAmount;
  final int quantity;
  final String name;

  PlanData({this.pid, this.unitAmount, this.quantity, this.name});
}

class ShippingDetails {
  final Address address;
  final String name;
  final String phone;

  ShippingDetails({
    this.address,
    this.name,
    this.phone,
  });
}

class Address {
  final String line2;
  final String line1;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  Address({
    this.line2,
    this.line1,
    this.city,
    this.state,
    this.country,
    this.postalCode,
  });
}
