import '../../auth/auth_util.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../backend/backend.dart';
import '../../custom_code/widgets/index.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;

class PlanData {
  final String path;
  final int unitAmount;
  final int quantity;
  final String name;
  final int shippingFeeNormal;
  final bool shippingEachFee;
  final ShippingStatus status;
  final int trackingIndex;

  PlanData({
    this.path,
    this.unitAmount,
    this.quantity,
    this.name,
    this.shippingFeeNormal,
    this.shippingEachFee,
    this.status,
    this.trackingIndex,
  });

  int get subtotal => unitAmount * quantity;
}

class Purchase {
  final String paymentId;
  final PlanData plan;
  final DateTime purchased;
  final int subtotal;
  final int shippingFee;
  final DateTime updated;

  Purchase({
    this.paymentId,
    this.plan,
    this.purchased,
    this.subtotal,
    this.shippingFee,
    this.updated,
  });

  int get totalAmount => subtotal + shippingFee;

  static Future<List<Purchase>> create(
    BuildContext context,
  ) async {
    List<Purchase> purchases = [];
    if (!currentUser.loggedIn) return purchases;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return purchases;

    final apiCallOutput = await GetPurchasesCall.call(
      uid: currentUserUid,
      accessToken: currentJwtToken,
      appCheckToken: _appCheckToken,
    );
    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    final success = _apiJson['success'] ?? false;
    if (!success) {
      String errorMessage = _apiJson['error'] ?? '原因不明のエラーが発生';
      showSnackbar(
        context,
        'Error: $errorMessage',
      );
      return purchases;
    }

    _apiJson['purchases'].forEach((_purchase) {
      purchases.add(Purchase(
        plan: PlanData(
          path: _purchase['path'],
          unitAmount: _purchase['unit_amount'],
          quantity: _purchase['quantity'],
          name: _purchase['name'],
          status: ShippingStatusExt.create(_purchase['status']),
          trackingIndex: _purchase['trackingIndex'] ?? 0,
        ),
        paymentId: _purchase['paymentId'],
        purchased: Timestamp(
          _purchase['purchased']['_seconds'],
          _purchase['purchased']['_nanoseconds'],
        ).toDate(),
        subtotal: _purchase['subtotal'],
        shippingFee: _purchase['shipping_fee'],
      ));
    });

    purchases.sort(((a, b) => b.purchased.compareTo(a.purchased)));

    return purchases;
  }
}

class PaymentDetails {
  final stripe.ShippingDetails shipping;
  final stripe.BillingDetails billing;
  final stripe.Card card;

  PaymentDetails({
    this.shipping,
    this.billing,
    this.card,
  });

  static Future<PaymentDetails> create(
    String paymentId,
    BuildContext context,
  ) async {
    PaymentDetails payment;
    stripe.ShippingDetails _shipping;
    stripe.BillingDetails _billing;
    stripe.Card _card;

    if (!currentUser.loggedIn) return payment;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return payment;

    final apiCallOutput = await GetPaymentDetailsCall.call(
      paymentId: paymentId,
      accessToken: currentJwtToken,
      appCheckToken: _appCheckToken,
    );
    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    if (_apiJson['success']) {
      _shipping = stripe.ShippingDetails(
        address: stripe.Address(
          country: _apiJson['shipping']['address']['country'],
          state: _apiJson['shipping']['address']['state'],
          city: _apiJson['shipping']['address']['city'],
          line1: _apiJson['shipping']['address']['line1'],
          line2: _apiJson['shipping']['address']['line2'],
          postalCode: _apiJson['shipping']['address']['postal_code'],
        ),
        name: _apiJson['shipping']['name'],
        phone: _apiJson['shipping']['phone'],
        carrier: _apiJson['shipping']['carrier'] ?? '',
        trackingNumber: _apiJson['shipping']['tracking_number'] ?? '',
      );
      _billing = stripe.BillingDetails(
        address: stripe.Address(
          country: _apiJson['paymentMethod']['billing_details']['address']
              ['country'],
          state: _apiJson['paymentMethod']['billing_details']['address']
              ['state'],
          city: _apiJson['paymentMethod']['billing_details']['address']['city'],
          line1: _apiJson['paymentMethod']['billing_details']['address']
              ['line1'],
          line2: _apiJson['paymentMethod']['billing_details']['address']
              ['line2'],
          postalCode: _apiJson['paymentMethod']['billing_details']['address']
              ['postal_code'],
        ),
        name: _apiJson['paymentMethod']['billing_details']['name'],
        phone: _apiJson['paymentMethod']['billing_details']['phone'],
        email: _apiJson['paymentMethod']['billing_details']['email'],
      );
      _card = stripe.Card(
        brand: _apiJson['paymentMethod']['card']['brand'],
        last4: _apiJson['paymentMethod']['card']['last4'],
      );
    }

    return PaymentDetails(
      shipping: _shipping,
      billing: _billing,
      card: _card,
    );
  }
}

class TransactionsLaw {
  final String director;

  TransactionsLaw({
    this.director,
  });

  static Future<TransactionsLaw> create(
    DocumentReference shopRef,
    BuildContext context,
  ) async {
    TransactionsLaw law;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return law;

    // final apiCallOutput = await GetPaymentDetailsCall.call(
    //   paymentId: paymentId,
    //   accessToken: currentJwtToken,
    //   appCheckToken: _appCheckToken,
    // );
    // final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');

    law = TransactionsLaw(director: 'test');
    return law;
  }
}

enum ShippingStatus {
  ordered,
  shipping,
  shipped,
  confirming,
}

extension ShippingStatusExt on ShippingStatus {
  static final _label = {
    ShippingStatus.ordered: '注文',
    ShippingStatus.confirming: '確認中',
    ShippingStatus.shipping: '発送済',
    ShippingStatus.shipped: '到着',
  };

  static final _icon = {
    ShippingStatus.ordered: Icons.send_rounded,
    ShippingStatus.confirming: Icons.search_rounded,
    ShippingStatus.shipping: FontAwesomeIcons.truckFast,
    ShippingStatus.shipped: FontAwesomeIcons.box,
  };

  static final _size = {
    ShippingStatus.ordered: 32.0,
    ShippingStatus.confirming: 32.0,
    ShippingStatus.shipping: 24.0,
    ShippingStatus.shipped: 24.0,
  };

  static List<String> get labelList =>
      _label.entries.map((e) => _label[e.key]).toList();

  static ShippingStatus create(String status) {
    switch (status) {
      case '確認中':
        return ShippingStatus.confirming;
        break;
      case '発送済':
        return ShippingStatus.shipping;
        break;
      case '到着':
        return ShippingStatus.shipped;
        break;
      default:
        return ShippingStatus.ordered;
        break;
    }
  }

  String get label => _label[this];

  IconData get icon => _icon[this];

  double get size => _size[this];
}

enum ShippingCarrier {
  yamato,
  sagawa,
  japanpost,
  inhouse,
  other,
}

extension ShippingCarrierExt on ShippingCarrier {
  static final _label = {
    ShippingCarrier.yamato: 'クロネコヤマト',
    ShippingCarrier.sagawa: '佐川急便',
    ShippingCarrier.japanpost: '日本郵便',
    ShippingCarrier.inhouse: '自社配送',
    ShippingCarrier.other: 'その他',
  };

  static List<String> get labelList =>
      _label.entries.map((e) => _label[e.key]).toList();
}

extension PlansRecordExt on PlansRecord {
  Future<String> getShopName() async {
    final shop = await ShopsRecord.getDocumentOnce(this.shop);
    return shop.shopName;
  }
}
