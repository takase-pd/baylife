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

  PlanData({
    this.path,
    this.unitAmount,
    this.quantity,
    this.name,
    this.shippingFeeNormal,
    this.shippingEachFee,
    this.status,
  });

  int get subtotal => unitAmount * quantity;
}

class Purchase {
  final String paymentId;
  final PlanData plan;
  final DateTime purchased;

  Purchase({
    this.paymentId,
    this.plan,
    this.purchased,
  });

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
          status: getShippingStatus(_purchase['status']),
        ),
        paymentId: _purchase['paymentId'],
        purchased: Timestamp(
          _purchase['purchased']['_seconds'],
          _purchase['purchased']['_nanoseconds'],
        ).toDate(),
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

FaIcon shippingStatusIcon(BuildContext context, ShippingStatus _status) {
  IconData _icon;
  double _size;
  switch (_status) {
    case ShippingStatus.contacted:
      _icon = Icons.send_rounded;
      _size = 32;
      break;
    case ShippingStatus.shipping:
      _icon = FontAwesomeIcons.shippingFast;
      _size = 24;
      break;
    case ShippingStatus.shipped:
      _icon = FontAwesomeIcons.box;
      _size = 24;
      break;
    default:
      _icon = Icons.search_rounded;
      _size = 32;
      break;
  }
  return FaIcon(
    _icon,
    color: FlutterFlowTheme.of(context).secondaryColor,
    size: _size,
  );
}
