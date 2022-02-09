import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';

class SurveyPostPageWidget extends StatefulWidget {
  const SurveyPostPageWidget({
    Key key,
    this.surveyRef,
  }) : super(key: key);

  final DocumentReference surveyRef;

  @override
  _SurveyPostPageWidgetState createState() => _SurveyPostPageWidgetState();
}

class _SurveyPostPageWidgetState extends State<SurveyPostPageWidget> {
  String sid;
  List answers;
  ApiCallResponse apiCallOutput1;
  String radioButtonValue;
  String radioButtonAlert = '';
  TextEditingController textController;
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

  bool existsAnswer() {
    final exists = answers.contains(widget.surveyRef.id);
    return exists;
  }

  void sendAnswer() async {
    if (radioButtonValue == null) {
      setState(() => radioButtonAlert = '＊必ず1つ選択してください。');
    } else {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('回答送信'),
            content: Text('ご回答ありがとうございます。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      await AddSurveyAnswerCall.call(
        uid: currentUserUid,
        sid: sid,
        choice: radioButtonValue,
        freeAnswer: textController.text,
        date: dateTimeFormat('yMMMd h:mm a', getCurrentTimestamp),
      );
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => NavBarPage(initialPage: 'SurveyPage'),
        ),
        (r) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
                        color: FlutterFlowTheme.primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                final columnSurveyRecord = snapshot.data;
                sid = columnSurveyRecord.sid;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.background,
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
                                  style: FlutterFlowTheme.subtitle1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      dateTimeFormat('yMMMd',
                                          columnSurveyRecord.startDate),
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.sLight,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  columnSurveyRecord.explanation,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: FlutterFlowRadioButton(
                                  options: columnSurveyRecord.choices.toList(),
                                  onChanged: (value) {
                                    setState(() => radioButtonValue = value);
                                  },
                                  optionHeight: 40,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.black,
                                  ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:
                                      FlutterFlowTheme.primaryColor,
                                  inactiveRadioButtonColor:
                                      FlutterFlowTheme.sLight,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 0, 40),
                                child: Text(
                                  radioButtonAlert,
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  '選択肢以外の回答があれば、ご記入ください。',
                                  style: FlutterFlowTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 16, 40),
                                child: Container(
                                  width: double.infinity,
                                  height: 48,
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<List<InfoInappRecord>>(
                                    stream: queryInfoInappRecord(
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
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<InfoInappRecord>
                                          textFieldInfoInappRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final textFieldInfoInappRecord =
                                          textFieldInfoInappRecordList
                                                  .isNotEmpty
                                              ? textFieldInfoInappRecordList
                                                  .first
                                              : null;
                                      return TextFormField(
                                        controller: textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.bodyText1,
                                        textAlign: TextAlign.start,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FutureBuilder(
                                      future: getAnswers(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          if (!existsAnswer()) {
                                            return // Generated code for this Button Widget...
                                                FFButtonWidget(
                                              onPressed: () => {sendAnswer()},
                                              text: '送信',
                                              options: FFButtonOptions(
                                                width: 88,
                                                height: 40,
                                                color: FlutterFlowTheme.pDark,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme
                                                      .textLight,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 8,
                                              ),
                                            );
                                          } else {
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '回答済み',
                                                  style: FlutterFlowTheme
                                                      .subtitle2,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Icon(
                                                    Icons.check_circle_rounded,
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        } else {
                                          return CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.pDark,
                                            ),
                                          );
                                        }
                                      }),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: '戻る',
                                      options: FFButtonOptions(
                                        width: 88,
                                        height: 40,
                                        color: FlutterFlowTheme.sLight,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<List<InfoInappRecord>>(
                      stream: queryInfoInappRecord(
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
                                color: FlutterFlowTheme.primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<InfoInappRecord> textInfoInappRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final textInfoInappRecord =
                            textInfoInappRecordList.isNotEmpty
                                ? textInfoInappRecordList.first
                                : null;
                        return Text(
                          textInfoInappRecord.surveyAgree,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.bodyText1,
                        );
                      },
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
