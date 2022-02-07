import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../survey_login_page/survey_login_page_widget.dart';
import '../survey_result_page/survey_result_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyPageWidget extends StatefulWidget {
  const SurveyPageWidget({Key key}) : super(key: key);

  @override
  _SurveyPageWidgetState createState() => _SurveyPageWidgetState();
}

class _SurveyPageWidgetState extends State<SurveyPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                stream: querySurveyRecord(),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.background,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      listViewSurveyRecord.question,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (listViewSurveyRecord.open ?? true)
                                        FFButtonWidget(
                                          onPressed: () async {
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
                                          },
                                          text: '回答',
                                          options: FFButtonOptions(
                                            width: 88,
                                            height: 32,
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
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SurveyResultPageWidget(
                                                surveyRef: listViewSurveyRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        text: '結果',
                                        options: FFButtonOptions(
                                          width: 88,
                                          height: 32,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
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
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
            child: FlutterFlowAdBanner(
              width: MediaQuery.of(context).size.width,
              height: 50,
              showsTestAd: false,
              iOSAdUnitID: 'ca-app-pub-8134368906531041/4883719188',
              androidAdUnitID: 'ca-app-pub-8134368906531041/3047893333',
            ),
          ),
        ],
      ),
    );
  }
}
