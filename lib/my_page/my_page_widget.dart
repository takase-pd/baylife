import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/firebase_analytics/analytics_event_type.dart';
import '../login_page/login_page_path.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../my_page_edit/my_page_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPageWidget extends StatefulWidget {
  const MyPageWidget({
    Key key,
    this.surveyRef,
  }) : super(key: key);

  final DocumentReference surveyRef;

  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).textLight),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('MY_PAGE_PAGE_Icon_04c46r7o_ON_TAP');
            logFirebaseEvent('Icon_NavigateTo');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomePage'),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.of(context).textLight,
            size: 24,
          ),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentUser.loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('MY_PAGE_PAGE_Text_okyjyohg_ON_TAP');
                      logFirebaseEvent('Text_Auth');
                      await signOut();
                      var _analyticsParam = {'uid': currentUserUid};
                      Analytics.analyticsLogEvent(
                          AnalyticsEventType.logout_user, _analyticsParam);
                      logFirebaseEvent('Text_NavigateTo');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'HomePage'),
                        ),
                      );
                    },
                    child: Text(
                      '???????????????',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).textLight,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuthUserStreamWidget(
                        child: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              currentUserPhoto,
                              'https://firebasestorage.googleapis.com/v0/b/baylifedev.appspot.com/o/assets%2Fuser-circle.png?alt=media&token=f4feafa1-f433-486d-a24a-be2ec1a6b5a4',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!currentUser.loggedIn)
                              Text(
                                '??????????????????????????????',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                    ),
                              ),
                            if (currentUser.loggedIn)
                              AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .textLight,
                                      ),
                                ),
                              ),
                            if (currentUser.loggedIn)
                              Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).tertiaryColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48),
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Text(
                        '????????????',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Open Sans',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).background,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: 288,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '??????',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    AuthUserStreamWidget(
                                      child: Text(
                                        valueOrDefault<String>(
                                          // TODO
                                          valueOrDefault(
                                              currentUserDocument?.sex, ''),
                                          '?????????',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).background,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: 288,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '??????',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    AuthUserStreamWidget(
                                      child: Text(
                                        currentUserDocument?.age == null ||
                                                currentUserDocument?.age == 0
                                            ? '?????????'
                                            : currentUserDocument.age
                                                .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).background,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: 288,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '?????????',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    AuthUserStreamWidget(
                                      child: Text(
                                        valueOrDefault<String>(
                                          // TODO
                                          valueOrDefault(
                                              currentUserDocument?.area, ''),
                                          '?????????',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (currentUser.loggedIn)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'MY_PAGE_PAGE_Text_8jhwgbc9_ON_TAP');
                            logFirebaseEvent('Text_NavigateTo');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings:
                                    const RouteSettings(name: 'MyPageEdit'),
                                builder: (context) => MyPageEditWidget(),
                              ),
                            );
                          },
                          child: Text(
                            '??????',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ),
                    if (!currentUser.loggedIn)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('ButtonON_TAP');
                            logFirebaseEvent('ButtonNavigateTo');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPageWidget(
                                  pagePath: LoginPagePath.my_page,
                                ),
                              ),
                            );
                          },
                          text: '????????????',
                          options: FFButtonOptions(
                            width: 240,
                            height: 48,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).textLight,
                                ),
                            elevation: 4,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
