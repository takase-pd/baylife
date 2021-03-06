import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_analytics/analytics_event_type.dart';
import '../backend/stripe/payment_manager.dart';
import '../custom_code/widgets/index.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bay_life/index.dart';

class PlanPageWidget extends StatefulWidget {
  const PlanPageWidget({
    Key key,
    @required this.planRef,
    this.quantity,
  }) : super(key: key);

  final DocumentReference planRef;
  final int quantity;

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
  int countControllerValue = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String paymentId;
  Future<PlanData> planData;
  String countAlert = '';
  TextEditingController customerAgeController;

  Future<PlanData> _getPlan() async {
    final _planData = await PlanData.create(widget.planRef.path, context);
    countControllerValue = _planData.quantity ?? widget.quantity ?? 0;
    return _planData;
  }

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlanPage'});
    customerAgeController = TextEditingController();
    planData = _getPlan();
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
                                  logFirebaseEvent('Card_NavigateBack');
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
                                  logFirebaseEvent('Card_NavigateTo');
                                  currentUser.loggedIn
                                      ? await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CartPageWidget(),
                                          ),
                                        )
                                      : await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPageWidget(
                                                    pagePath:
                                                        LoginPagePath.cart_page,
                                                  )),
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
                                    currency: '???',
                                    format: '#,##0',
                                    locale: 'ja_JP',
                                  ),
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    '??????',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                ),
                                Text(
                                  formatNumber(
                                    columnPlansRecord.shippingFeeNormal,
                                    formatType: FormatType.custom,
                                    currency: '???',
                                    format: '#,##0',
                                    locale: 'ja_JP',
                                  ),
                                  style: FlutterFlowTheme.of(context).title3,
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
                                Text(
                                  '????????????????????????',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                          if (columnPlansRecord.verifyAge ?? false)
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
                                              '??????????????????',
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
                                              '??????????????????????????????????????????20?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',
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
                                  '??????????????????',
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
                                  '????????????',
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
                                    '???????????????',
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
                      child: FutureBuilder<PlanData>(
                          future: planData,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final _plan = snapshot.data;
                              var cartButton =
                                  _plan == null ? '??????????????????' : '??????????????????';
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
                                        maximum: columnPlansRecord.quantityMax,
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
                                      '???????????????????????????????????????',
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
                                          '????????????',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent('ButtonON_TAP');
                                            if (countControllerValue == 0 &&
                                                _plan == null) {
                                              setState(() {
                                                countAlert = '????????????????????????????????????';
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
                                              logFirebaseEvent(
                                                'DeletePlan',
                                                parameters: {
                                                  AnalyticsPrams
                                                          .plan_name.label:
                                                      columnPlansRecord.name,
                                                },
                                              );
                                              final deletePlanResponce =
                                                  await deletePlan(
                                                      columnPlansRecord
                                                          .reference.path,
                                                      _appCheckToken);
                                              if (!deletePlanResponce) return;
                                            }

                                            if (countControllerValue > 0) {
                                              logFirebaseEvent(
                                                'AddPlan',
                                                parameters: {
                                                  AnalyticsPrams
                                                          .plan_name.label:
                                                      columnPlansRecord.name,
                                                },
                                              );
                                              final addPlanResponce =
                                                  await addPlan(
                                                      columnPlansRecord
                                                          .reference.path,
                                                      columnPlansRecord
                                                          .verifyAge,
                                                      _appCheckToken);
                                              if (!addPlanResponce) return;
                                            }
                                            setState(() {
                                              planData = _getPlan();
                                            });
                                          },
                                          text: cartButton,
                                          options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(12)),
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
                                          '???????????????',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent('ButtonON_TAP');
                                            if (countControllerValue == 0) {
                                              setState(() {
                                                countAlert = '????????????????????????????????????';
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
                                                    '????????????????????????',
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
                                                    label: '????????????',
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
                                                    '????????????????????????',
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
                                                    label: '??????',
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
                                                            '${columnPlansRecord.name}???????????????',
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
                                          text: '???????????????',
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
                                            borderRadius:
                                                BorderRadius.circular(12),
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

  Future<bool> _verifyAge() async {
    if (currentUserDocument.age >= 20) {
      customerAgeController =
          TextEditingController(text: currentUserDocument.age.toString());
      return true;
    }

    logFirebaseEvent('Button_AlertDialog');
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text(
                '????????????',
                style: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                    ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('??????????????????????????????????????????????????????20????????????????????????????????????????????????????????????????????????'),
                  TextFormField(
                    controller: customerAgeController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '??????',
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorStyle: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontSize: 20,
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).textDark,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (val) {
                      if (val == null || val.isEmpty) return '????????????????????????????????????????????????';
                      return null;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text(
                    '??????',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        color: FlutterFlowTheme.of(context).textDark),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text(
                    '??????',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        color: FlutterFlowTheme.of(context).textDark),
                  ),
                ),
              ],
            );
          },
        ) ??
        false;

    final customerAge = int.parse(customerAgeController.text) ?? 0;
    if (customerAge > 0 && customerAge != currentUserDocument.age)
      await currentUserReference.update(createUsersRecordData(
        age: int.parse(customerAgeController.text),
      ));

    return confirmDialogResponse && customerAge >= 20;
  }

  Future<bool> addPlan(
      String path, bool verifyAge, String appCheckToken) async {
    logFirebaseEvent('VerifyAge');
    final verifyAgeResponce = verifyAge ? await _verifyAge() : true;
    if (verifyAge && !verifyAgeResponce) {
      logFirebaseEvent('ButtonShowSnackBar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '?????????????????????????????????????????????????????????',
            style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).textLight),
          ),
          duration: Duration(milliseconds: 4800),
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        ),
      );
      return false;
    }

    logFirebaseEvent('ButtonBackendCall');
    final apiCallOutput = await AddPlanCall.call(
      uid: currentUserUid,
      plan: '/$path',
      quantity: countControllerValue,
      verifyAge: verifyAge,
      customerAge: verifyAge ? int.parse(customerAgeController.text) : 0,
      added: dateTimeFormat('yMMMd h:mm a', getCurrentTimestamp),
      accessToken: currentJwtToken,
      appCheckToken: appCheckToken,
    );
    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    final success = _apiJson['success'] ?? false;
    if (!success) {
      String errorMessage = _apiJson['error'] ?? '?????????????????????????????????';
      showSnackbar(
        context,
        '?????????: $errorMessage',
      );
      return false;
    }

    if (verifyAge && verifyAgeResponce) {
      logFirebaseEvent('ButtonShowSnackBar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '??????????????????????????????????????????????????????',
            style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).textLight),
          ),
          duration: Duration(milliseconds: 1600),
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          action: SnackBarAction(
            label: '????????????',
            textColor: FlutterFlowTheme.of(context).primaryColor,
            onPressed: () async {
              logFirebaseEvent('CardNavigateTo');
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPageWidget(),
                ),
              );
            },
          ),
        ),
      );
    }

    logFirebaseEvent('ButtonShowSnackBar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '??????????????????',
          style: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Open Sans',
              color: FlutterFlowTheme.of(context).textLight),
        ),
        duration: Duration(milliseconds: 4800),
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        action: SnackBarAction(
          label: '?????????',
          textColor: FlutterFlowTheme.of(context).primaryColor,
          onPressed: () async {
            logFirebaseEvent('CardNavigateTo');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPageWidget(),
              ),
            );
          },
        ),
      ),
    );
    return true;
  }

  Future<bool> deletePlan(String path, String appCheckToken) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          '??????????????????',
          style: CustomDialog.titleStyle(context),
        ),
        content: Text(
          '??????????????????????????????????????????????????????????????????????????????',
          style: CustomDialog.messageStyle(context),
        ),
        actions: [
          TextButton(
              child: Text(
                '??????',
                style: CustomDialog.buttonStyle(context),
              ),
              onPressed: () => Navigator.pop(context)),
          TextButton(
              child: Text(
                '??????',
                style: CustomDialog.buttonStyle(context),
              ),
              onPressed: () async {
                logFirebaseEvent('ButtonBackendCall');
                final apiCallOutput = await DeletePlanCall.call(
                  uid: currentUserUid,
                  plan: '/$path',
                  accessToken: currentJwtToken,
                  appCheckToken: appCheckToken,
                );
                final _apiJson =
                    getJsonField(apiCallOutput.jsonBody, r'''$.result''');
                final success = _apiJson['success'] ?? false;
                if (!success) {
                  String errorMessage = _apiJson['error'] ?? '?????????????????????????????????';
                  showSnackbar(
                    context,
                    'Error: $errorMessage',
                  );
                  return false;
                }

                Navigator.pop(context);
              })
        ],
      ),
    );
    return true;
  }
}
