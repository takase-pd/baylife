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

import '../auth/firebase_user_provider.dart';
import '../login_page/login_page_path.dart';
import '../custom_code/widgets/index.dart';

class PlanPageWidget extends StatefulWidget {
  const PlanPageWidget({Key key, @required this.planRef, this.quantity})
      : super(key: key);

  final DocumentReference planRef;
  final int quantity;

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
  String paymentId;
  int countControllerValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<PlanData> planData;
  String countAlert = '';

  Future<PlanData> _getPlan() async {
    PlanData _planData;
    if (!currentUser.loggedIn) return _planData;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken != null) {
      final apiCallOutput = await GetPlanCall.call(
        uid: currentUserUid,
        pid: widget.planRef.id,
        accessToken: currentJwtToken,
        appCheckToken: _appCheckToken,
      );
      final _planJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
      if (_planJson != null)
        _planData = new PlanData(
            pid: _planJson['pid'],
            unitAmount: _planJson['unit_amount'],
            quantity: _planJson['quantity']);
    }
    return _planData;
  }

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlanPage'});
    planData = _getPlan();
    planData.then((plan) => {
          plan != null
              ? countControllerValue = plan.quantity
              : countControllerValue = widget.quantity ?? 0
        });
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
                                'https://i.picsum.photos/id/163/2000/1333.jpg?hmac=htdHeSJwlYOxS8b0TTpz2s8tD_QDlmsd3JHYa_HGrg8',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, -0.55),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent('CardON_TAP');
                                  logFirebaseEvent('CardNavigateBack');
                                  Navigator.pop(context);
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
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
                                  logFirebaseEvent('CardON_TAP');
                                  logFirebaseEvent('CardNavigateTo');
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
                              columnPlansRecord.description.maybeHandleOverflow(
                                maxChars: 56,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                  style: FlutterFlowTheme.of(context).subtitle2,
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
                                Text(
                                  columnPlansRecord.deliveryNormal,
                                  style: FlutterFlowTheme.of(context).bodyText1,
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
                                      columnPlansRecord.deliveryQuick,
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
                      child: FutureBuilder(
                          future: planData,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final _plan = snapshot.data;
                              var cartButton =
                                  _plan == null ? 'カートに追加' : 'カートを更新';
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 8),
                                    child: Container(
                                      width: double.infinity,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tDark,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minusCircle,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryColor
                                              : FlutterFlowTheme.of(context)
                                                  .tDark,
                                          size: 32,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plusCircle,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .pDark
                                              : FlutterFlowTheme.of(context)
                                                  .tDark,
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
                                        updateCount: (count) => setState(() => {
                                              countControllerValue = count,
                                              if (count > 0) countAlert = ''
                                            }),
                                        stepSize: 1,
                                        minimum: 0,
                                        maximum: 5,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16, 0, 16, 0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: Text(
                                      '＊注文数に上限があります。',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 24),
                                    child: Text(
                                      countAlert,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 24),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '通常配送',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent('ButtonON_TAP');
                                            if (countControllerValue == 0 &&
                                                _plan == null) {
                                              setState(() {
                                                countAlert = '個数を選択してください。';
                                              });
                                              return;
                                            }

                                            if (!currentUser.loggedIn) {
                                              logFirebaseEvent(
                                                  'ButtonNavigateTo');
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPageWidget(
                                                    pagePath:
                                                        LoginPagePath.plan_page,
                                                    pageRef: widget.planRef,
                                                    planQuantity:
                                                        countControllerValue,
                                                  ),
                                                ),
                                              );
                                            }

                                            final _appCheckToken =
                                                await AppCheckAgent.getToken(
                                                    context);
                                            if (_appCheckToken == null) {
                                              CustomDialog.networkAlert(
                                                  context);
                                              return;
                                            }

                                            if (countControllerValue == 0 &&
                                                _plan != null) {
                                              await showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) =>
                                                        new AlertDialog(
                                                  title: Text(
                                                    'カートを更新',
                                                    style:
                                                        CustomDialog.titleStyle(
                                                            context),
                                                  ),
                                                  content: Text(
                                                    'カートから商品を削除します。お間違いないでしょうか？',
                                                    style: CustomDialog
                                                        .messageStyle(context),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        child: Text(
                                                          '戻る',
                                                          style: CustomDialog
                                                              .buttonStyle(
                                                                  context),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context)),
                                                    TextButton(
                                                        child: Text(
                                                          '削除',
                                                          style: CustomDialog
                                                              .buttonStyle(
                                                                  context),
                                                        ),
                                                        onPressed: () async => {
                                                              logFirebaseEvent(
                                                                  'ButtonBackendCall'),
                                                              await DeletePlanCall
                                                                  .call(
                                                                uid:
                                                                    currentUserUid,
                                                                pid:
                                                                    columnPlansRecord
                                                                        .pid,
                                                                accessToken:
                                                                    currentJwtToken,
                                                                appCheckToken:
                                                                    _appCheckToken,
                                                              ),
                                                              Navigator.pop(
                                                                  context),
                                                            })
                                                  ],
                                                ),
                                              );
                                            }
                                            if (countControllerValue > 0) {
                                              logFirebaseEvent(
                                                  'ButtonBackendCall');
                                              _plan == null
                                                  ? await AddPlanCall.call(
                                                      uid: currentUserUid,
                                                      pid:
                                                          columnPlansRecord.pid,
                                                      quantity:
                                                          countControllerValue,
                                                      unitAmount:
                                                          columnPlansRecord
                                                              .unitAmount,
                                                      date: dateTimeFormat(
                                                          'yMMMd h:mm a',
                                                          getCurrentTimestamp),
                                                      accessToken:
                                                          currentJwtToken,
                                                      appCheckToken:
                                                          _appCheckToken,
                                                    )
                                                  : await UpdatePlanCall.call(
                                                      uid: currentUserUid,
                                                      pid:
                                                          columnPlansRecord.pid,
                                                      quantity:
                                                          countControllerValue,
                                                      unitAmount:
                                                          columnPlansRecord
                                                              .unitAmount,
                                                      date: dateTimeFormat(
                                                          'yMMMd h:mm a',
                                                          getCurrentTimestamp),
                                                      accessToken:
                                                          currentJwtToken,
                                                      appCheckToken:
                                                          _appCheckToken,
                                                    );
                                              logFirebaseEvent(
                                                  'ButtonShowSnackBar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'カートを確認',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textLight),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4800),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  action: SnackBarAction(
                                                    label: 'カート',
                                                    textColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'CardNavigateTo');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartPageWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            }
                                            setState(() {
                                              planData = _getPlan();
                                            });
                                          },
                                          text: cartButton,
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
                                            borderRadius: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (columnPlansRecord.activeQuick ?? true)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'お急ぎ配送',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            print(countControllerValue);
                                            logFirebaseEvent('ButtonON_TAP');
                                            if (countControllerValue == 0) {
                                              setState(() {
                                                countAlert = '個数を選択してください。';
                                              });
                                              return;
                                            }

                                            if (!currentUser.loggedIn) {
                                              logFirebaseEvent(
                                                  'ButtonShowSnackBar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'ログインして注文',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textLight),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 10000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  action: SnackBarAction(
                                                    label: 'ログイン',
                                                    textColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ButtonNavigateTo');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPageWidget(
                                                            pagePath:
                                                                LoginPagePath
                                                                    .plan_page,
                                                            pageRef:
                                                                widget.planRef,
                                                            planQuantity:
                                                                countControllerValue,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'ButtonShowSnackBar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'お急ぎ配達で注文',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textLight),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 10000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                  action: SnackBarAction(
                                                    label: '注文',
                                                    textColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    onPressed: () async {
                                                      final paymentResponse =
                                                          await processStripePayment(
                                                        amount:
                                                            columnPlansRecord
                                                                .unitAmount,
                                                        currency: 'JPY',
                                                        customerEmail:
                                                            currentUserEmail,
                                                        customerName:
                                                            currentUserDisplayName,
                                                        description:
                                                            '${columnPlansRecord.name}お急ぎ配達',
                                                        allowGooglePay: true,
                                                        allowApplePay: false,
                                                      );
                                                      if (paymentResponse
                                                              .paymentId ==
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
                                                          paymentResponse
                                                              .paymentId;
                                                    },
                                                  ),
                                                ),
                                              );
                                            }

                                            setState(() {});
                                          },
                                          text: 'すぐに注文',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
                                            borderRadius: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              );
                            } else {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                          }),
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

class PlanData {
  final String pid;
  final int unitAmount;
  final int quantity;

  PlanData({this.pid, this.unitAmount, this.quantity});
}
