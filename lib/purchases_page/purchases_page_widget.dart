import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../payment_info_page/payment_info_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';
import '../custom_code/widgets/index.dart';

class PurchasesPageWidget extends StatefulWidget {
  const PurchasesPageWidget({Key key}) : super(key: key);

  @override
  _PurchasesPageWidgetState createState() => _PurchasesPageWidgetState();
}

class _PurchasesPageWidgetState extends State<PurchasesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List purchases;

  Future<List> _getPurchases() async {
    purchases = [];
    if (!currentUser.loggedIn) return purchases;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken != null) {
      final apiCallOutput = await GetPurchasesCall.call(
        uid: currentUserUid,
        accessToken: currentJwtToken,
        appCheckToken: _appCheckToken,
      );
      final _purchasesJson =
          getJsonField(apiCallOutput.jsonBody, r'''$.result''');
      _purchasesJson.forEach((_purchase) {
        purchases.add(new Purchase(
          plan: new PlanData(
            path: _purchase['path'],
            unitAmount: _purchase['unit_amount'],
            quantity: _purchase['quantity'],
            name: _purchase['name'],
            status: getShippingStatus(_purchase['status']),
          ),
          paymentId: _purchase['paymentId'],
          purchased: new Timestamp(_purchase['purchased']['_seconds'],
                  _purchase['purchased']['_nanoseconds'])
              .toDate(),
        ));
      });
    }
    return purchases;
  }

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PurchasesPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 56, 24, 24),
            child: Text(
              '購入済み',
              style: FlutterFlowTheme.of(context).title1,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getPurchases(),
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
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: purchases.length,
                  itemBuilder: (context, listViewIndex) {
                    final _purchase = purchases[listViewIndex];
                    final _plan = _purchase.plan;
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent('ContainerON_TAP');
                          logFirebaseEvent('ContainerNavigateTo');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentInfoPageWidget(
                                purchase: _purchase,
                                purchases: purchases,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<PlansRecord>(
                                  stream: PlansRecord.getDocument(
                                      FirebaseFirestore.instance
                                          .doc(_plan.path)),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
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
                                    PlansRecord imagePlansRecord =
                                        snapshot.data;
                                    return Image.network(
                                      imagePlansRecord.banner,
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 0),
                                              child: Text(
                                                _plan.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: Text(
                                                      formatNumber(
                                                        _plan.quantity,
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: '数量 ',
                                                        format: '#,##0',
                                                        locale: 'ja_JP',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      _plan.sum,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: '￥',
                                                      format: '#,##0',
                                                      locale: 'ja_JP',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 16, 0),
                                                  child: Text(
                                                    dateTimeFormat('MMM d, y',
                                                        _purchase.purchased),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Text(
                                                  _purchase.paymentId,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tDark,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        shippingStatusIcon(
                                            context, _plan.status),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
