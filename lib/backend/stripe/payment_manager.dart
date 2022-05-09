import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../flutter_flow/flutter_flow_util.dart';

import '../cloud_functions/cloud_functions.dart';

final _isProd = false;

// Stripe Credentials
const _kProdStripePublishableKey =
    'pk_live_51ITgUwGe7bJktEzTV9JKjfxalYAeUKUwp6TmSEjVeAq2C72Jfl4b8THbkFVCvzwXSoa9fM7DuhgbHeWf4mcFLc3300emg1a6e4';
const _kTestStripePublishableKey =
    'pk_test_51ITgUwGe7bJktEzT6F1RcOf7aH2lrjK1jlIne0tpyoWXbdxAa0GpTBjyJp1CIn4EElYQFA7T39wLpRzdBlBCj1zg00TPUJYvsl';
const _kAppleMerchantId = '';

String stripePublishableKey() =>
    _isProd ? _kProdStripePublishableKey : _kTestStripePublishableKey;
String merchantIdentifier() => isAndroid ? '' : _kAppleMerchantId;

Future initializeStripe() async {
  if (kIsWeb) {
    return;
  }
  Stripe.publishableKey = stripePublishableKey();
  if (merchantIdentifier().isNotEmpty) {
    Stripe.merchantIdentifier = merchantIdentifier();
  }
  await Stripe.instance.applySettings();
}

class StripePaymentResponse {
  const StripePaymentResponse({
    this.paymentId,
    this.totalAmount,
    this.errorMessage,
  });
  final String paymentId;
  final int totalAmount;
  final String errorMessage;
}

Future<StripePaymentResponse> processStripePayment({
  @required num amount,
  @required String currency,
  @required String customerEmail,
  String customerName = '',
  String description = '',
  bool allowGooglePay = false,
  bool allowApplePay = false,
  ThemeMode themeStyle = ThemeMode.system,
  Color buttonColor,
  ShippingDetails shipping,
  BillingDetails billing,
}) async {
  if (kIsWeb) {
    return StripePaymentResponse(
      errorMessage: 'Stripe payments not yet supported on web.',
    );
  }
  try {
    final callName = _isProd
        ? 'stripe-initStripePaymentV0'
        : 'stripe-initStripeTestPaymentV0';
    final totalAmount = amount.round();
    final response = await makeCloudCall(
      callName,
      'asia-northeast1',
      {
        'amount': totalAmount,
        'currency': currency,
        'email': customerEmail,
        'name': customerName,
        'description': description,
        'receipt_email': billing.email,
        'shipping': {
          'name': shipping.name,
          'phone': shipping.phone,
          'address': {
            'line2': shipping.address.line2,
            'line1': shipping.address.line1,
            'city': shipping.address.city,
            'state': shipping.address.state,
            'country': shipping.address.country,
            'postal_code': shipping.address.postalCode,
          }
        },
      },
    );
    final success = response['success'] ?? false;
    if (!success || !response.containsKey('paymentId')) {
      return StripePaymentResponse(
          errorMessage: response['error'] ?? 'Unkown error occured');
    }
    // Initialize the Stripe payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: response['paymentIntent'],
        customerEphemeralKeySecret: response['ephemeralKey'],
        customerId: response['customer'],
        merchantDisplayName: 'Bay Life（運営 Particle Drawing LLC）',
        merchantCountryCode: 'JPN',
        testEnv: !_isProd,
        googlePay: allowGooglePay,
        applePay: allowApplePay,
        style: themeStyle,
        primaryButtonColor: buttonColor,
        billingDetails: billing,
      ),
    );
    // Show the payment sheet and confirm payment
    await Stripe.instance.presentPaymentSheet();

    final updateResponse = await makeCloudCall(
      'stripe-updateBillingDetailsV0',
      'asia-northeast1',
      {
        'paymentId': response['paymentId'],
        'billing': {
          'address': {
            'city': billing.address.city,
            'country': billing.address.country,
            'line1': billing.address.line1,
            'line2': billing.address.line2,
            'postal_code': billing.address.postalCode,
            'state': billing.address.state
          },
          'email': billing.email,
          'name': billing.name,
          'phone': billing.phone,
        },
      },
    );
    final updateSuccess = updateResponse['success'] ?? false;
    if (!updateSuccess || !updateResponse.containsKey('paymentId')) {
      return StripePaymentResponse(
          errorMessage: response['error'] ?? 'Unkown error occured');
    }

    // Return the id of the completed payment to add record in the app.
    return StripePaymentResponse(
      paymentId: response['paymentId'],
      totalAmount: totalAmount,
    );
  } catch (e) {
    if (e is StripeException && e.error.code == FailureCode.Canceled) {
      return StripePaymentResponse();
    }
    return StripePaymentResponse(errorMessage: '$e');
  }
}
