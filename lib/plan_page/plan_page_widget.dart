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
                                'https://picsum.photos/seed/538/600',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, -0.55),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent('Card-ON_TAP');
                                  logFirebaseEvent('Card-Navigate-Back');
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
                                  logFirebaseEvent('Card-ON_TAP');
                                  logFirebaseEvent('Card-Navigate-To');
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
                                  style: FlutterFlowTheme.of(context).subtitle1,
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
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
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
                                    columnPlansRecord.deliveryQuick,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryColor
                                      : Color(0xFFEEEEEE),
                                  size: 16,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).pDark
                                      : Color(0xFFEEEEEE),
                                  size: 16,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                count: countControllerValue ??= 0,
                                updateCount: (count) => setState(
                                    () => countControllerValue = count),
                                stepSize: 1,
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
                                    logFirebaseEvent('Button-ON_TAP');
                                    logFirebaseEvent('Button-Backend-Call');
                                    await AddPlanCall.call(
                                      uid: currentUserUid,
                                      pid: columnPlansRecord.pid,
                                      quantity: countControllerValue,
                                      unitAmount: columnPlansRecord.unitAmount,
                                      date: dateTimeFormat(
                                          'yMMMd', getCurrentTimestamp),
                                    );
                                    logFirebaseEvent('Button-Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPageWidget(),
                                      ),
                                    );
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
                                          color: Colors.white,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'お急ぎ配送',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent('Button-ON_TAP');
                                    logFirebaseEvent('Button-Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPageWidget(),
                                      ),
                                    );
                                    logFirebaseEvent('Button-Show-Snack-Bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'お急ぎ配達で注文します。',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        duration: Duration(milliseconds: 10000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).tLight,
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
                                          color: Colors.white,
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
