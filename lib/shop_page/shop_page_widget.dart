import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../backend/firebase_analytics/analytics_event_type.dart';
import '../cart_page/cart_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_path.dart';
import '../login_page/login_page_widget.dart';
import '../plan_page/plan_page_widget.dart';
import '../transactions_law_page/transactions_law_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPageWidget extends StatefulWidget {
  const ShopPageWidget({
    Key key,
    this.shopRef,
  }) : super(key: key);

  final DocumentReference shopRef;

  @override
  _ShopPageWidgetState createState() => _ShopPageWidgetState();
}

class _ShopPageWidgetState extends State<ShopPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ShopPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: StreamBuilder<ShopsRecord>(
        stream: ShopsRecord.getDocument(widget.shopRef),
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
          final columnShopsRecord = snapshot.data;
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
                                columnShopsRecord.banner,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, -0.55),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SHOP_PAGE_PAGE_Card_0r00mcej_ON_TAP');
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
                                      'SHOP_PAGE_PAGE_Card_d239ipdz_ON_TAP');
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
                              columnShopsRecord.shopName,
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              columnShopsRecord.description,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 8, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (columnShopsRecord.instagram == null ||
                                    columnShopsRecord.instagram.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                          'OPEN_SHOP_LINK_Instagram',
                                          parameters: {
                                            AnalyticsPrams.shop_link.label:
                                                columnShopsRecord.shopName,
                                          },
                                        );
                                        if (!await launch(
                                            'instagram://user?username=${columnShopsRecord.instagram}'))
                                          throw 'Instagram?????????????????????';
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        color:
                                            FlutterFlowTheme.of(context).sLight,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                if (columnShopsRecord.twitter == null ||
                                    columnShopsRecord.twitter.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                          'OPEN_SHOP_LINK_Twitter',
                                          parameters: {
                                            AnalyticsPrams.shop_link.label:
                                                columnShopsRecord.shopName,
                                          },
                                        );
                                        if (!await launch(
                                            'twitter://user?screen_name=${columnShopsRecord.twitter}'))
                                          throw 'Twitter?????????????????????';
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.twitter,
                                        color:
                                            FlutterFlowTheme.of(context).sLight,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                if (columnShopsRecord.web == null ||
                                    columnShopsRecord.web.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                          'OPEN_SHOP_LINK_Homepage',
                                          parameters: {
                                            AnalyticsPrams.shop_link.label:
                                                columnShopsRecord.shopName,
                                          },
                                        );
                                        if (!await launch(
                                            columnShopsRecord.web))
                                          throw '???????????????????????????????????????';
                                      },
                                      child: FaIcon(
                                        Icons.home_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).sLight,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 16, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                        'SEND_SHOP_Mail',
                                        parameters: {
                                          AnalyticsPrams.shop_link.label:
                                              columnShopsRecord.shopName,
                                        },
                                      );
                                      final title = Uri.encodeComponent(
                                          '??????????????? (Bay Life)');
                                      final body = Uri.encodeComponent(
                                          '${columnShopsRecord.shopName}  ???');
                                      if (!await launch(
                                          'mailto:${columnShopsRecord.email}?subject=$title&body=$body'))
                                        throw '??????????????????????????????';
                                    },
                                    child: FaIcon(
                                      Icons.mail_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).sLight,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                        'CALL_SHOP',
                                        parameters: {
                                          AnalyticsPrams.shop_link.label:
                                              columnShopsRecord.shopName,
                                        },
                                      );
                                      await launch(
                                          'tel:${columnShopsRecord.phone}');
                                    },
                                    child: Container(
                                      child: FaIcon(
                                        Icons.phone_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).sLight,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                StreamBuilder<CatShopRecord>(
                                  stream: CatShopRecord.getDocument(
                                      columnShopsRecord.catMain),
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
                                    final textCatShopRecord = snapshot.data;
                                    return Text(
                                      textCatShopRecord.catName,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: StreamBuilder<List<PlansRecord>>(
                    stream: queryPlansRecord(
                      queryBuilder: (plansRecord) =>
                          plansRecord.where('shop', isEqualTo: widget.shopRef),
                    ),
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
                      List<PlansRecord> wrapPlansRecordList = snapshot.data
                          .where((element) => element.active == true)
                          .toList();
                      wrapPlansRecordList
                          .sort(((a, b) => b.published.compareTo(a.published)));
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(wrapPlansRecordList.length,
                            (wrapIndex) {
                          final wrapPlansRecord =
                              wrapPlansRecordList[wrapIndex];
                          return Container(
                            width: wrapPlansRecordList.length == 1
                                ? MediaQuery.of(context).size.width * 0.88
                                : MediaQuery.of(context).size.width * 0.44,
                            height: 240,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: wrapPlansRecord.active ?? true,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:
                                      FlutterFlowTheme.of(context).background,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Visibility(
                                    visible: wrapPlansRecord.active ?? true,
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                          'SHOP_PAGE_PAGE_Column_jdzhq0yg_ON_TAP',
                                          parameters: {
                                            AnalyticsPrams.plan_name.label:
                                                wrapPlansRecord.name,
                                          },
                                        );
                                        logFirebaseEvent('Column_NavigateTo');
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PlanPageWidget(
                                              planRef:
                                                  wrapPlansRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            wrapPlansRecord.banner,
                                            width: double.infinity,
                                            height: 104,
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 8, 16, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Text(
                                                    wrapPlansRecord.name
                                                        .maybeHandleOverflow(
                                                      maxChars: 16,
                                                      replacement: '???',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        formatNumber(
                                                          wrapPlansRecord
                                                              .unitAmount,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '???',
                                                          format: '#,##0',
                                                          locale: 'ja_JP',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize: 16,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'yMMMd',
                                                            wrapPlansRecord
                                                                .published),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                            'SHOP_PAGE_PAGE_Text_3g4yt3pe_ON_TAP',
                            parameters: {
                              AnalyticsPrams.shop_name.label:
                                  columnShopsRecord.shopName,
                            },
                          );
                          logFirebaseEvent('Text_NavigateTo');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionsLawPageWidget(
                                shopRef: widget.shopRef,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          '????????????????????????????????????',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
