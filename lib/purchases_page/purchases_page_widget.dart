import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bay_life/index.dart';

import '../auth/firebase_user_provider.dart';
import '../custom_code/widgets/index.dart';

class PurchasesPageWidget extends StatefulWidget {
  const PurchasesPageWidget({Key key}) : super(key: key);

  @override
  _PurchasesPageWidgetState createState() => _PurchasesPageWidgetState();
}

class _PurchasesPageWidgetState extends State<PurchasesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<Purchase>> purchases;

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PurchasesPage'});
    purchases = Purchase.create(context);
  }

  @override
  Widget build(BuildContext context) {
    return currentUser.loggedIn
        ? Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            body: Column(
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
                              '購入済み',
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.95, 0.4),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent('CardON_TAP');
                            logFirebaseEvent('CardNavigateTo');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavBarPage(
                                  initialPage: 'EcommercePage',
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Purchase>>(
                    future: purchases,
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
                      final _purchases = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: _purchases.length,
                        itemBuilder: (context, listViewIndex) {
                          final _purchase = _purchases[listViewIndex];
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
                                      purchases: _purchases,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).background,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 12, 8),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    child: Text(
                                                      _plan.name
                                                          .maybeHandleOverflow(
                                                        maxChars: 12,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 16, 0),
                                                          child: Text(
                                                            formatNumber(
                                                              _plan.quantity,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              currency: '数量 ',
                                                              format: '#,##0',
                                                              locale: 'ja_JP',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
                                                          ),
                                                        ),
                                                        Text(
                                                          formatNumber(
                                                            _plan.subtotal,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: '￥',
                                                            format: '#,##0',
                                                            locale: 'ja_JP',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ],
                                                    ),
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
                                                          dateTimeFormat(
                                                              'MMM d, y h:mm a',
                                                              _purchase
                                                                  .purchased),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              FaIcon(
                                                _plan.status.icon,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                size: _plan.status.size,
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
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : LoginPageWidget(
            pagePath: LoginPagePath.purchases_page,
          );
  }
}
