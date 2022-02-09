import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../survey_post_page/survey_post_page_widget.dart';
import '../survey_login_page/survey_login_page_widget.dart';
import '../survey_result_page/survey_result_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';

class SurveyPageWidget extends StatefulWidget {
  const SurveyPageWidget({Key key}) : super(key: key);

  @override
  _SurveyPageWidgetState createState() => _SurveyPageWidgetState();
}

class _SurveyPageWidgetState extends State<SurveyPageWidget> {
  List answers;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List> getAnswers() async {
    if (!currentUser.loggedIn) {
      answers = [];
    } else {
      final apiCallOutput = await AnswersCall.call(
        uid: currentUserUid,
      );
      answers = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    }
    return answers;
  }

  bool existsAnswer(String sid) {
    final exists = answers.contains(sid);
    return exists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.textLight),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.textLight,
            size: 24,
          ),
        ),
        title: HeaderLogoWidget(),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
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
                          color: FlutterFlowTheme.primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<SurveyRecord> listViewSurveyRecordList = snapshot.data;
                  return FutureBuilder(
                    future: getAnswers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewSurveyRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewSurveyRecord =
                                listViewSurveyRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
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
                                  color: FlutterFlowTheme.background,
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
                                            style: FlutterFlowTheme.subtitle1
                                                .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
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
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.bodyText1
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
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Open Sans',
                                                  color:
                                                      FlutterFlowTheme.sLight,
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '回答済み',
                                                    style: FlutterFlowTheme
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
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (!existsAnswer(
                                                        listViewSurveyRecord
                                                            .sid) &&
                                                    listViewSurveyRecord.open ??
                                                true)
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  if (currentUser.loggedIn) {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
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
                                                        builder: (context) =>
                                                            SurveyLoginPageWidget(
                                                          surveyRef:
                                                              listViewSurveyRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                text: '回答',
                                                options: FFButtonOptions(
                                                  width: 88,
                                                  height: 40,
                                                  color: FlutterFlowTheme.pDark,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Open Sans',
                                                    color: Colors.white,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 8,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
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
                              color: FlutterFlowTheme.primaryColor,
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
