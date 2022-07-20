import '../backend/backend.dart';
import '../backend/firebase_analytics/analytics_event_type.dart';
import '../cart_page/cart_page_widget.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/custom_functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../purchases_page/purchases_page_widget.dart';
import '../shop_page/shop_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EcommercePageWidget extends StatefulWidget {
  const EcommercePageWidget({Key key}) : super(key: key);

  @override
  _EcommercePageWidgetState createState() => _EcommercePageWidgetState();
}

class _EcommercePageWidgetState extends State<EcommercePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EcommercePage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).textLight),
        automaticallyImplyLeading: true,
        title: HeaderLogoWidget(),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerWidget(),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
        child: FutureBuilder<StateEc>(
          future: StateEc.create(),
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
            StateEc ec = snapshot.data;
            return ec.state
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ECOMMERCE_PAGE_PAGE_Row_j3w0s5jf_ON_TAP');
                                          logFirebaseEvent('Row_NavigateTo');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CartPageWidget(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'カート',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ECOMMERCE_PAGE_PAGE_Row_8tje70hv_ON_TAP');
                                          logFirebaseEvent('Row_NavigateTo');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PurchasesPageWidget(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '購入履歴',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: StreamBuilder<List<ShopsRecord>>(
                            stream: queryShopsRecord(),
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
                              List<ShopsRecord> listViewShopsRecordList =
                                  snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewShopsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewShopsRecord =
                                      listViewShopsRecordList[listViewIndex];
                                  return Visibility(
                                    visible:
                                        listViewShopsRecord.display ?? true,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                            'ECOMMERCE_PAGE_PAGE_Card_hdqmvbf8_ON_TAP',
                                            parameters: {
                                              AnalyticsPrams.shop_name.label:
                                                  listViewShopsRecord.shopName,
                                            },
                                          );
                                          logFirebaseEvent('Card_NavigateTo');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ShopPageWidget(
                                                shopRef: listViewShopsRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                listViewShopsRecord.banner,
                                                width: double.infinity,
                                                height: 160,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 16),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        listViewShopsRecord
                                                            .shopName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        listViewShopsRecord
                                                            .description
                                                            .maybeHandleOverflow(
                                                          maxChars: 56,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize: 12,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          StreamBuilder<
                                                              CatShopRecord>(
                                                            stream: CatShopRecord
                                                                .getDocument(
                                                                    listViewShopsRecord
                                                                        .catMain),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 50,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final textCatShopRecord =
                                                                  snapshot.data;
                                                              return Text(
                                                                textCatShopRecord
                                                                    .catName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sLight,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
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
                  )
                : SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                              child: Text('メンテナンスのお知らせ',
                                  style: FlutterFlowTheme.of(context).title1),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Text('${ec.message}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyText1),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text('終了予定：',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Text('${ec.estimated}',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 48, 0, 16),
                                  child: FaIcon(
                                    FontAwesomeIcons.cat,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    size: MediaQuery.of(context).size.width *
                                        0.36,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Text('Sorry...',
                                      style:
                                          FlutterFlowTheme.of(context).title2),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
