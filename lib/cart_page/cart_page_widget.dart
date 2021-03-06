import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/stripe/payment_manager.dart';
import '../backend/backend.dart';
import '../backend/firebase_analytics/analytics_event_type.dart';
import '../components/billing_details_widget.dart';
import '../components/shipping_details_widget.dart';
import '../custom_code/widgets/index.dart';
import '../ecommerce_page/ecommerce_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_path.dart';
import '../login_page/login_page_widget.dart';
import '../../purchases_page/purchases_page_widget.dart';
import '../terms_page/terms_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stripe/flutter_stripe.dart'
    show ShippingDetails, BillingDetails;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({Key key}) : super(key: key);

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  String paymentId;
  String paymentMethodId;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<PlanData> cart;
  int subtotal = 0;
  int shippingTotal = 0;
  ShippingDetails shipping;
  BillingDetails billing;
  bool ageVerification = false;

  Future<List> _getCart() async {
    subtotal = 0;
    cart = [];
    if (!currentUser.loggedIn) return cart;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return cart;

    final apiCallOutput = await GetCartCall.call(
      uid: currentUserUid,
      accessToken: currentJwtToken,
      appCheckToken: _appCheckToken,
    );

    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    final success = _apiJson['success'] ?? false;
    if (!success) {
      String errorMessage = _apiJson['error'] ?? '?????????????????????????????????';
      showSnackbar(
        context,
        'Error: $errorMessage',
      );
      return cart;
    }

    subtotal = _apiJson['subtotal'];
    shippingTotal = _apiJson['shippingFee'];
    _apiJson['cart'].forEach((plan) {
      cart.add(PlanData(
        path: plan['path'],
        unitAmount: plan['unitAmount'],
        quantity: plan['quantity'],
        customerAge: plan['customerAge'] ?? 0,
        verifyAge: plan['verifyAge'] ?? false,
        name: plan['name'],
        // shippingFeeNormal: plan['shipping_fee_normal'],
        shippingEachFee: plan['shippingEachFee'],
      ));
    });

    final verifyAge = cart
        .where(
          (element) => element.verifyAge == true,
        )
        .length;
    ageVerification = verifyAge > 0 ? true : false;

    return cart;
  }

  bool verifyAge() {
    return ageVerification ? currentUserDocument.age >= 20 : true;
  }

  bool isEmpty() {
    if (cart == null) return true;
    if (cart.length == 0) return true;
    if (shipping == null || billing == null) return true;
    return false;
  }

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CartPage'});
  }

  @override
  Widget build(BuildContext context) {
    return currentUser.loggedIn
        ? Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0.4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '???????????????',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.95, 0.4),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'CART_PAGE_PAGE_Card_jcpc2xs3_ON_TAP');
                                logFirebaseEvent('CardNavigateBack');
                                Navigator.pop(context);
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: _getCart(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          '?????????',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (cart.isEmpty)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 32),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text('????????????????????????'),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (cart.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 24),
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: cart.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final _plan = cart[listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Slidable(
                                              actionPane:
                                                  const SlidableScrollActionPane(),
                                              secondaryActions: [
                                                IconSlideAction(
                                                  caption: '??????',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sLight,
                                                  icon: Icons
                                                      .delete_sweep_rounded,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SlidableActionWidgetON_TAP');

                                                    if (!currentUser.loggedIn) {
                                                      logFirebaseEvent(
                                                          'ButtonNavigateTo');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPageWidget(
                                                            pagePath:
                                                                LoginPagePath
                                                                    .cart_page,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final _appCheckToken =
                                                        await AppCheckAgent
                                                            .getToken(context);
                                                    if (_appCheckToken ==
                                                        null) {
                                                      CustomDialog.networkAlert(
                                                          context);
                                                      return;
                                                    }
                                                    logFirebaseEvent(
                                                        'SlidableActionWidgetBackendCall');
                                                    final apiCallOutput =
                                                        await DeletePlanCall
                                                            .call(
                                                      uid: currentUserUid,
                                                      plan: _plan.path,
                                                      accessToken:
                                                          currentJwtToken,
                                                      appCheckToken:
                                                          _appCheckToken,
                                                    );
                                                    final _apiJson =
                                                        getJsonField(
                                                            apiCallOutput
                                                                .jsonBody,
                                                            r'''$.result''');
                                                    final success =
                                                        _apiJson['success'] ??
                                                            false;
                                                    if (!success) {
                                                      String errorMessage =
                                                          _apiJson['error'] ??
                                                              '?????????????????????????????????';
                                                      showSnackbar(
                                                        context,
                                                        'Error: $errorMessage',
                                                      );
                                                      return;
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              ],
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<PlansRecord>(
                                                    future: PlansRecord
                                                        .getDocumentOnce(
                                                            FirebaseFirestore
                                                                .instance
                                                                .doc(_plan
                                                                    .path)),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      PlansRecord
                                                          imagePlansRecord =
                                                          snapshot.data;
                                                      return Image.network(
                                                        imagePlansRecord.banner,
                                                        width: 80,
                                                        height: 104,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 104,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .background,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 8, 8, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  _plan.name
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        12,
                                                                    replacement:
                                                                        '???',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1,
                                                                ),
                                                                Text(
                                                                  formatNumber(
                                                                    _plan
                                                                        .subtotal,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    currency:
                                                                        '???',
                                                                    format:
                                                                        '#,##0',
                                                                    locale:
                                                                        'ja_JP',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1,
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              16,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        formatNumber(
                                                                          _plan
                                                                              .unitAmount,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          currency:
                                                                              '?????????',
                                                                          format:
                                                                              '#,##0',
                                                                          locale:
                                                                              'ja_JP',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        _plan
                                                                            .quantity,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        currency:
                                                                            '?????? ',
                                                                        format:
                                                                            '#,##0',
                                                                        locale:
                                                                            'ja_JP',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                if (ageVerification)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 24),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '??????????????????',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '????????????????????????????????????????????????????????????20???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '????????????',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '??????',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                formatNumber(
                                                  subtotal,
                                                  formatType: FormatType.custom,
                                                  currency: '???',
                                                  format: '#,##0',
                                                  locale: 'ja_JP',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '??????',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                formatNumber(
                                                  shippingTotal,
                                                  formatType: FormatType.custom,
                                                  currency: '???',
                                                  format: '#,##0',
                                                  locale: 'ja_JP',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '??????',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                formatNumber(
                                                  subtotal + shippingTotal,
                                                  formatType: FormatType.custom,
                                                  currency: '???',
                                                  format: '#,##0',
                                                  locale: 'ja_JP',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '???????????????????????????',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: '?????????????????????',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: 'Stripe',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  await launchURL(
                                                      'https://stripe.com/jp');
                                                },
                                            ),
                                            TextSpan(
                                              text: '???????????????????????????????????????????????????',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                      ),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (verifyAge())
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent('ButtonON_TAP');
                                              logFirebaseEvent(
                                                'ButtonBottomSheet',
                                                parameters: {
                                                  AnalyticsPrams
                                                      .bottom_sheet_name
                                                      .label: 'ShippingDetails',
                                                },
                                              );
                                              var _shipping =
                                                  await showModalBottomSheet<
                                                      ShippingDetails>(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.9,
                                                      child:
                                                          ShippingDetailsWidget(
                                                              shipping:
                                                                  shipping),
                                                    ),
                                                  );
                                                },
                                              );
                                              setState(() {
                                                shipping = _shipping;
                                              });
                                            },
                                            text: '?????????',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .pDark,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textLight,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      if (verifyAge())
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent('ButtonON_TAP');
                                              logFirebaseEvent(
                                                'ButtonBottomSheet',
                                                parameters: {
                                                  AnalyticsPrams
                                                      .bottom_sheet_name
                                                      .label: 'BillingDetails',
                                                },
                                              );
                                              var _billing =
                                                  await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.9,
                                                      child:
                                                          BillingDetailsWidget(
                                                        shipping: shipping,
                                                        billing: billing,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                              setState(() {
                                                billing = _billing;
                                              });
                                            },
                                            text: '?????????',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .pDark,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textLight,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      if (isEmpty() && verifyAge())
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: FFButtonWidget(
                                            onPressed: () {},
                                            text: '??????????????????????????????????????????',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 64,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tDark,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sLight,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      if (!isEmpty() && verifyAge()) ...[
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: Container(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontSize: 12,
                                                              ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '???????????????????????????????????????????????????????????????????????????????????????????????????',
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '??????????????????????????????????????????',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontSize: 12,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap =
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              TermsPageWidget(
                                                                        termsUrl:
                                                                            'https://baylife.particledrawing.com/terms_ec.html',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                        ),
                                                        TextSpan(
                                                          text: '???',
                                                        ),
                                                        TextSpan(
                                                          text: '??????????????????????????????',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontSize: 12,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap =
                                                                    () async {
                                                                  await launchURL(
                                                                      'https://www.particledrawing.com/privacy');
                                                                },
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '?????????????????????????????????????????????????????????????????????',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent('ButtonON_TAP');
                                              logFirebaseEvent(
                                                  'ButtonStripePayment');
                                              final paymentResponse =
                                                  await processStripePayment(
                                                amount:
                                                    subtotal + shippingTotal,
                                                currency: 'JPY',
                                                customerEmail: currentUserEmail,
                                                customerName:
                                                    currentUserDisplayName,
                                                description: 'Bay Life ???????????????',
                                                allowGooglePay: true,
                                                allowApplePay: false,
                                                buttonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                shipping: shipping,
                                                billing: billing,
                                              );
                                              if (paymentResponse.paymentId ==
                                                  null) {
                                                if (paymentResponse
                                                        .errorMessage !=
                                                    null) {
                                                  showSnackbar(
                                                    context,
                                                    'Error: ${paymentResponse.errorMessage}',
                                                  );
                                                }
                                                return;
                                              }
                                              paymentId =
                                                  paymentResponse.paymentId;
                                              final payAmount =
                                                  paymentResponse.totalAmount;

                                              final _appCheckToken =
                                                  await AppCheckAgent.getToken(
                                                      context);
                                              if (_appCheckToken == null) {
                                                CustomDialog.networkAlert(
                                                    context);
                                                return;
                                              }
                                              final apiCallOutput =
                                                  await PaymentCall.call(
                                                uid: currentUserUid,
                                                paymentId: paymentId,
                                                payAmount: payAmount,
                                                date: dateTimeFormat(
                                                    'yMMMd h:mm a',
                                                    getCurrentTimestamp),
                                                accessToken: currentJwtToken,
                                                appCheckToken: _appCheckToken,
                                              );
                                              final _apiJson = getJsonField(
                                                  apiCallOutput.jsonBody,
                                                  r'''$.result''');
                                              final success =
                                                  _apiJson['success'] ?? false;
                                              if (!success) {
                                                String errorMessage =
                                                    // TODO correct to catch error message
                                                    // _apiJson['error'] ??
                                                    '?????????????????????????????????';
                                                showSnackbar(
                                                  context,
                                                  '?????????: $errorMessage',
                                                );
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'ThanksAlertDialog');
                                              showDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: Text(
                                                    currentUserDisplayName
                                                            .isNotEmpty
                                                        ? '$currentUserDisplayName ???????????????????????????????????????????????????'
                                                        : '??????????????????????????????????????????',
                                                    style:
                                                        CustomDialog.titleStyle(
                                                            context),
                                                  ),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 16),
                                                        child: Text(
                                                          '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n?????????????????????????????????????????????',
                                                          style: CustomDialog
                                                              .messageStyle(
                                                                  context),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 24,
                                                                    0, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.gift,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          size: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.24,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      child: Text(
                                                        'OK',
                                                        style: CustomDialog
                                                            .buttonStyle(
                                                                context),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PurchasesPageWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            text: '????????????',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 64,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ],
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CART_PAGE_PAGE_AddPlan_ButtonON_TAP');
                                          logFirebaseEvent('ButtonNavigateTo');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EcommercePageWidget(),
                                            ),
                                          );
                                        },
                                        text: '?????????????????????',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48,
                                          color: FlutterFlowTheme.of(context)
                                              .sLight,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitPulse(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                        }),
                  ]),
            ),
          )
        : LoginPageWidget(
            pagePath: LoginPagePath.cart_page,
          );
  }
}
