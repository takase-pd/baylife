import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../my_page/my_page_widget.dart';
import '../terms_page/terms_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/firebase_analytics/analytics.dart';
import '../backend/firebase_analytics/analytics_event_type.dart';

class EndDrawerWidget extends StatefulWidget {
  const EndDrawerWidget({Key key}) : super(key: key);

  @override
  _EndDrawerWidgetState createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiaryColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 200, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_COMP_ListTile_hyxd1vcp_ON_TAP');
                        logFirebaseEvent('ListTile_NavigateTo');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings: const RouteSettings(name: 'MyPage'),
                            builder: (context) => MyPageWidget(),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          '???????????????',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_COMP_ListTile_c79bmzob_ON_TAP');
                        logFirebaseEvent('ListTile_NavigateTo');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TermsPageWidget(
                              termsUrl:
                                  'https://baylife.particledrawing.com/terms.html',
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          '????????????',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_COMP_ListTile_b8m04f2i_ON_TAP');
                        logFirebaseEvent('ListTile_LaunchURL');
                        await launchURL(
                            'https://www.particledrawing.com/privacy');
                      },
                      child: ListTile(
                        title: Text(
                          '??????????????????????????????',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_COMP_ListTile_r9bl6iug_ON_TAP');
                        logFirebaseEvent('ListTile_AlertDialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('????????????'),
                                  content: Text(
                                      '????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('???????????????'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('??????'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('ListTile_BackendCall');
                          await currentUserReference.delete();
                        }
                        logFirebaseEvent('ListTile_NavigateTo');
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'HomePage'),
                          ),
                          (r) => false,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          '??????',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('END_DRAWER_COMP_ListTile_5rwzbsll_ON_TAP');
                  logFirebaseEvent('ListTile_Auth');
                  await signOut();
                  var _analyticsParam = {'uid': currentUserUid};
                  Analytics.analyticsLogEvent(
                      AnalyticsEventType.logout_user, _analyticsParam);
                  logFirebaseEvent('ListTile_NavigateTo');
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(initialPage: 'HomePage'),
                    ),
                    (r) => false,
                  );
                },
                child: ListTile(
                  title: Text(
                    '???????????????',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 20,
                  ),
                  dense: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
