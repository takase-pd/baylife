import 'package:bay_life/custom_code/widgets/ecommerce.dart';
import 'package:bay_life/ecommerce_page/ecommerce_page_widget.dart';

import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/stripe/payment_manager.dart';
import '../components/shipping_detail_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../shop_page/shop_page_widget.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';
import '../login_page/login_page_path.dart';
import '../custom_code/widgets/index.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({Key key}) : super(key: key);

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  String paymentId;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List cart;
  int subtoral = 0;
  int shippingAmount = 500;
  ShippingDetails shipping;

  Future<List> _getCart() async {
    subtoral = 0;
    cart = [];
    if (!currentUser.loggedIn) return cart;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken != null) {
      final apiCallOutput = await GetCartCall.call(
        uid: currentUserUid,
        accessToken: currentJwtToken,
        appCheckToken: _appCheckToken,
      );
      final _cartJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
      _cartJson.forEach((plan) {
        subtoral += plan['unit_amount'] * plan['quantity'];
        cart.add(new PlanData(
          pid: plan['pid'],
          unitAmount: plan['unit_amount'],
          quantity: plan['quantity'],
          name: plan['name'],
        ));
      });
    }
    return cart;
  }

  bool isEmpty() {
    if (cart == null) return true;
    if (cart.length == 0) return true;
    return false;
  }

  @override
  void initState() {
    // TODO if not logged in, open the Login page
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CartPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: FutureBuilder(
          future: _getCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 56, 24, 24),
                      child: Text(
                        '注文の確認',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Text(
                      'カート',
                      style: FlutterFlowTheme.of(context).title2,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.length,
                          itemBuilder: (context, listViewIndex) {
                            final _pid = cart[listViewIndex].pid;
                            final _unitAmount = cart[listViewIndex].unitAmount;
                            final _quantity = cart[listViewIndex].quantity;
                            final _name = cart[listViewIndex].name;
                            final _sum = _unitAmount * _quantity;
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                              child: Slidable(
                                actionPane: const SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: '削除',
                                    color: FlutterFlowTheme.of(context).sLight,
                                    icon: Icons.delete_sweep_rounded,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SlidableActionWidgetON_TAP');

                                      if (!currentUser.loggedIn) {
                                        logFirebaseEvent('ButtonNavigateTo');
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPageWidget(
                                              pagePath: LoginPagePath.cart_page,
                                            ),
                                          ),
                                        );
                                      }

                                      final _appCheckToken =
                                          await AppCheckAgent.getToken(context);
                                      if (_appCheckToken == null) {
                                        CustomDialog.networkAlert(context);
                                        return;
                                      }

                                      logFirebaseEvent(
                                          'SlidableActionWidgetBackendCall');
                                      await DeletePlanCall.call(
                                        uid: currentUserUid,
                                        pid: _pid,
                                        accessToken: currentJwtToken,
                                        appCheckToken: _appCheckToken,
                                      );
                                      setState(() {});
                                    },
                                  ),
                                ],
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/963/600',
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    16, 0),
                                                        child: Text(
                                                          formatNumber(
                                                            _unitAmount,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: '￥',
                                                            format: '#,##0',
                                                            locale: 'ja_JP',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          _quantity,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '数量 ',
                                                          format: '#,##0',
                                                          locale: 'ja_JP',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                formatNumber(
                                                  _sum,
                                                  formatType: FormatType.custom,
                                                  currency: '￥',
                                                  format: '#,##0',
                                                  locale: 'ja_JP',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    'お支払い',
                                    style: FlutterFlowTheme.of(context).title2,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Text(
                                '合計金額',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '商品金額',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    formatNumber(
                                      subtoral,
                                      formatType: FormatType.custom,
                                      currency: '￥',
                                      format: '#,##0',
                                      locale: 'ja_JP',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '配送金額',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    formatNumber(
                                      shippingAmount,
                                      formatType: FormatType.custom,
                                      currency: '￥',
                                      format: '#,##0',
                                      locale: 'ja_JP',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '合計',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    formatNumber(
                                      subtoral + shippingAmount,
                                      formatType: FormatType.custom,
                                      currency: '￥',
                                      format: '#,##0',
                                      locale: 'ja_JP',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '＊お支払い方法は、Stripeによる決済をご利用ください。',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('ButtonON_TAP');
                                logFirebaseEvent('ButtonBottomSheet');
                                var _shipping =
                                    await showModalBottomSheet<ShippingDetails>(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        child: ShippingDetailWidget(
                                            shipping: shipping),
                                      ),
                                    );
                                  },
                                );
                                setState(() {
                                  shipping = _shipping;
                                });
                              },
                              text: '配送先',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48,
                                color: FlutterFlowTheme.of(context).pDark,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: checkboxListTileValue ??= true,
                                onChanged: (newValue) => setState(
                                    () => checkboxListTileValue = newValue),
                                title: Text(
                                  '請求先は配送住所と同じにする',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                tileColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('ButtonON_TAP');
                                logFirebaseEvent('Butto-NavigateTo');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBarPage(
                                        initialPage: 'EcommercePage'),
                                  ),
                                );
                              },
                              text: '請求先',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48,
                                color: FlutterFlowTheme.of(context).pDark,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                          if (!isEmpty())
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent('ButtonON_TAP');
                                  logFirebaseEvent('ButtonStripePayment');
                                  final paymentResponse =
                                      await processStripePayment(
                                    amount: subtoral + shippingAmount,
                                    currency: 'JPY',
                                    customerEmail: currentUserEmail,
                                    customerName: currentUserDisplayName,
                                    description: 'ご注文の品',
                                    allowGooglePay: true,
                                    allowApplePay: false,
                                    buttonColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  );
                                  if (paymentResponse.paymentId == null) {
                                    if (paymentResponse.errorMessage != null) {
                                      showSnackbar(
                                        context,
                                        'Error: ${paymentResponse.errorMessage}',
                                      );
                                    }
                                    return;
                                  }
                                  paymentId = paymentResponse.paymentId;

                                  setState(() {});
                                },
                                text: '注文する',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 64,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('ButtonON_TAP');
                              logFirebaseEvent('ButtonNavigateTo');
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EcommercePageWidget(),
                                ),
                              );
                            },
                            text: '商品を追加する',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48,
                              color: FlutterFlowTheme.of(context).sLight,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitPulse(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 50,
                  ),
                ),
              );
            }
          }),
    );
  }
}
