import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/stripe/payment_manager.dart';
import '../cart_page/cart_page_widget.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPageWidget extends StatefulWidget {
  const PlanPageWidget({
    Key key,
    this.planRef,
  }) : super(key: key);

  final DocumentReference planRef;

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
  String paymentId;
  int countControllerValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlanPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: StreamBuilder<PlansRecord>(
        stream: PlansRecord.getDocument(widget.planRef),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
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
          final columnPlansRecord = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Stack(
                          alignment: AlignmentDirectional(-0.95, -0.7),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Image.network(
                                columnPlansRecord.banner,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, -0.55),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PLAN_PAGE_PAGE_Card_nj7kako9_ON_TAP');
                                  logFirebaseEvent('Card_Navigate-Back');
                                  Navigator.pop(context);
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
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
                            Align(
                              alignment: AlignmentDirectional(0.95, -0.55),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PLAN_PAGE_PAGE_Card_w2htuil8_ON_TAP');
                                  logFirebaseEvent('Card_Navigate-To');
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartPageWidget(),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Icon(
                                      Icons.shopping_cart_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              columnPlansRecord.name,
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              columnPlansRecord.description,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  formatNumber(
                                    columnPlansRecord.unitAmount,
                                    formatType: FormatType.custom,
                                    currency: '￥',
                                    format: '#,##0',
                                    locale: 'ja_JP',
                                  ),
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    '送料',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                ),
                                Text(
                                  formatNumber(
                                    columnPlansRecord.shippingFeeNormal,
                                    formatType: FormatType.custom,
                                    currency: '￥',
                                    format: '#,##0',
                                    locale: 'ja_JP',
                                  ),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ],
                            ),
                          ),
                          if (columnPlansRecord.verifyAge ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '年齢確認商品',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
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
                                              'この商品は年齢確認商品です。20才以上の年齢であることを確認できない場合には販売いたしません。年齢確認をさせていただいておりますので、ご了承ください。',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '配送について',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '通常配送',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    columnPlansRecord.shippingNormal,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (columnPlansRecord.activeQuick ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'お急ぎ配送',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (columnPlansRecord.activeQuick ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      columnPlansRecord.shippingQuick,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).tDark,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minusCircle,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryColor
                                      : FlutterFlowTheme.of(context).tDark,
                                  size: 32,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plusCircle,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).pDark
                                      : FlutterFlowTheme.of(context).tDark,
                                  size: 32,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                count: countControllerValue ??= 0,
                                updateCount: (count) => setState(
                                    () => countControllerValue = count),
                                stepSize: 1,
                                minimum: 0,
                                maximum: 5,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                            child: Text(
                              '＊注文数に上限があります。',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '通常配送',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PLAN_PAGE_PAGE_カートに追加_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPageWidget(),
                                      ),
                                    );
                                    logFirebaseEvent('Button_Alert-Dialog');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('年齢確認'),
                                                  content: Text(
                                                      'この商品は年齢確認が必要な商品です。お客様の年齢をご入力ください。'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('戻る'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('送信'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      logFirebaseEvent('Button_Backend-Call');
                                      await AddPlanCall.call(
                                        uid: currentUserUid,
                                        quantity: countControllerValue,
                                      );
                                    }
                                  },
                                  text: 'カートに追加',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (columnPlansRecord.activeQuick ?? true)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'お急ぎ配送',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PLAN_PAGE_PAGE_すぐに注文_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPageWidget(),
                                      ),
                                    );
                                    logFirebaseEvent('Button_Show-Snack-Bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'お急ぎ配達で注文します。',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textLight,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 10000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                        action: SnackBarAction(
                                          label: '注文を確定する',
                                          textColor: Color(0x00000000),
                                          onPressed: () async {
                                            final paymentResponse =
                                                await processStripePayment(
                                              amount:
                                                  columnPlansRecord.unitAmount,
                                              currency: 'JPY',
                                              customerEmail: currentUserEmail,
                                              customerName:
                                                  currentUserDisplayName,
                                              description:
                                                  '${columnPlansRecord.name}お急ぎ配達',
                                              allowGooglePay: true,
                                              allowApplePay: false,
                                              buttonColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
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
                                          },
                                        ),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                  text: 'すぐに注文',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
