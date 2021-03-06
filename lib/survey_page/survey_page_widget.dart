import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../survey_post_page/survey_post_page_widget.dart';
import '../login_page/login_page_widget.dart';
import '../survey_result_page/survey_result_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';
import '../login_page/login_page_path.dart';
import '../custom_code/widgets/index.dart';

class SurveyPageWidget extends StatefulWidget {
  const SurveyPageWidget({
    Key key,
  }) : super(key: key);

  @override
  _SurveyPageWidgetState createState() => _SurveyPageWidgetState();
}

class _SurveyPageWidgetState extends State<SurveyPageWidget> {
  List answers;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List> getAnswers() async {
    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (!currentUser.loggedIn || _appCheckToken == null) return answers = [];

    final apiCallOutput = await AnswersCall.call(
      uid: currentUserUid,
      accessToken: currentJwtToken,
      appCheckToken: _appCheckToken,
    );
    answers = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    return answers;
  }

  bool existsAnswer(String sid) {
    final exists = answers.contains(sid);
    return exists;
  }

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SurveyPage'});
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: StreamBuilder<List<SurveyRecord>>(
                stream: querySurveyRecord(
                  queryBuilder: (surveyRecord) =>
                      surveyRecord.orderBy('startDate', descending: true),
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
                  List<SurveyRecord> listViewSurveyRecordList = snapshot.data;
                  return FutureBuilder(
                    future: getAnswers(),
                    builder: (context, snapshot) {
                      String buttonText = '????????????????????????';
                      double buttonWidth = 160;
                      if (currentUser.loggedIn) {
                        buttonText = '??????';
                        buttonWidth = 120;
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewSurveyRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewSurveyRecord =
                                listViewSurveyRecordList[listViewIndex];
                            return Visibility(
                              visible: listViewSurveyRecord.display ?? true,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('CardON_TAP');
                                    logFirebaseEvent('CardNavigateTo');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        settings: const RouteSettings(
                                            name: 'SurveyResultPage'),
                                        builder: (context) =>
                                            SurveyResultPageWidget(
                                          surveyRef:
                                              listViewSurveyRecord.reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              listViewSurveyRecord.question,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              listViewSurveyRecord.explanation
                                                  .maybeHandleOverflow(
                                                maxChars: 56,
                                                replacement: '???',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dateTimeFormat(
                                                      'yMMMd',
                                                      listViewSurveyRecord
                                                          .startDate),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sLight,
                                                        fontSize: 12,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (existsAnswer(
                                                  listViewSurveyRecord.sid))
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '????????????',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (!existsAnswer(
                                                          listViewSurveyRecord
                                                              .sid) &&
                                                      listViewSurveyRecord
                                                          .open ??
                                                  true)
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ButtonON_TAP');
                                                    logFirebaseEvent(
                                                        'ButtonNavigateTo');
                                                    if (currentUser.loggedIn) {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          settings:
                                                              const RouteSettings(
                                                                  name:
                                                                      'SurveyPostPage'),
                                                          builder: (context) =>
                                                              SurveyPostPageWidget(
                                                            surveyRef:
                                                                listViewSurveyRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          settings:
                                                              const RouteSettings(
                                                                  name:
                                                                      'SurveyPostPage'),
                                                          builder: (context) =>
                                                              LoginPageWidget(
                                                            pagePath: LoginPagePath
                                                                .survey_post_page,
                                                            pageRef:
                                                                listViewSurveyRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  text: buttonText,
                                                  options: FFButtonOptions(
                                                    width: buttonWidth,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
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
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
