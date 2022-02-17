import 'package:bay_life/custom_code/widgets/survey_result.dart';

import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyResultPageWidget extends StatefulWidget {
  const SurveyResultPageWidget({
    Key key,
    this.surveyRef,
  }) : super(key: key);

  final DocumentReference surveyRef;

  @override
  _SurveyResultPageWidgetState createState() => _SurveyResultPageWidgetState();
}

class _SurveyResultPageWidgetState extends State<SurveyResultPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<MapEntry<String, double>> _getResultData(
      List choices, List results, int count) {
    if (choices.isEmpty || results.isEmpty) return [];
    if (choices.length != results.length) return [];
    if (count <= 0) return [];

    final List<MapEntry<String, double>> resultData = [];
    choices.asMap().forEach((index, value) {
      resultData.add(MapEntry(choices[index], results[index]));
    });

    return resultData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).textLight),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.of(context).textLight,
            size: 24,
          ),
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: StreamBuilder<SurveyRecord>(
              stream: SurveyRecord.getDocument(widget.surveyRef),
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
                final columnSurveyRecord = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  columnSurveyRecord.question,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  columnSurveyRecord.explanation,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      dateTimeFormat('yMMMd',
                                          columnSurveyRecord.startDate),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .sLight,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Builder(
                                  builder: (context) {
                                    final choices = columnSurveyRecord.choices
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    final results = columnSurveyRecord.results
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    final count = columnSurveyRecord.count;
                                    List<MapEntry<String, double>> resultData =
                                        _getResultData(choices, results, count);
                                    if (resultData.length == 0) {
                                      return Text(
                                        'アンケート結果が集計されていません。\n集計が完了するまでお待ちください。',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                      );
                                    } else {
                                      return Container(
                                        width: double.infinity,
                                        height: 240,
                                        child: custom_widgets.SurveyResult(
                                          resultData: resultData,
                                          animate: false,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Text(
                                columnSurveyRecord.comment,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color:
                                          FlutterFlowTheme.of(context).textDark,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 16),
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
