import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchasesPageWidget extends StatefulWidget {
  const PurchasesPageWidget({Key key}) : super(key: key);

  @override
  _PurchasesPageWidgetState createState() => _PurchasesPageWidgetState();
}

class _PurchasesPageWidgetState extends State<PurchasesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            padding: EdgeInsetsDirectional.fromSTEB(24, 32, 24, 24),
            child: Text(
              '購入済み',
              style: FlutterFlowTheme.of(context).title1,
            ),
          ),
          Expanded(
            child: FutureBuilder<ApiCallResponse>(
              future: GetCartCall.call(),
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
                final listViewGetCartResponse = snapshot.data;
                return ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).background,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<PlansRecord>>(
                                stream: queryPlansRecord(
                                  queryBuilder: (plansRecord) => plansRecord
                                      .where('name', isEqualTo: 'aaa'),
                                  singleRecord: true,
                                ),
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
                                  List<PlansRecord> imagePlansRecordList =
                                      snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final imagePlansRecord =
                                      imagePlansRecordList.isNotEmpty
                                          ? imagePlansRecordList.first
                                          : null;
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Text(
                                                    '商品名',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ),
                                                Text(
                                                  '金額',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 16, 0),
                                                  child: Text(
                                                    '点数',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 2, 0),
                                                      child: Text(
                                                        '￥',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 16, 0),
                                                      child: Text(
                                                        '単価',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                    ),
                                                  ],
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
                                                  '注文日',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Payment ID',
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
                                      FaIcon(
                                        FontAwesomeIcons.box,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
