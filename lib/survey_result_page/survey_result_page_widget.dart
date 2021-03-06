import 'package:bay_life/custom_code/widgets/survey_result.dart';

import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../my_page_edit/my_page_edit_widget.dart';
import '../login_page/login_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';
import '../login_page/login_page_path.dart';
import '../custom_code/widgets/index.dart';

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
  String choiceChipsValue;
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<dynamic>> reviews;
  Stream<SurveyRecord> survey;
  String sid;
  String alertTag = '';

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

  Future<List> _getReviews(String sid) async {
    List<dynamic> _reviews = [];
    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken != null) {
      final apiCallOutput = await ReviewsCall.call(
        sid: sid,
        appCheckToken: _appCheckToken,
      );
      final _reviewsJson =
          getJsonField(apiCallOutput.jsonBody, r'''$.result''');
      _reviewsJson.forEach((review) {
        _reviews.add(ReviewData(
            comment: review['comment'],
            tag: review['tag'],
            uid: review['uid'],
            displayName: review['displayName'],
            date: DateTime.parse(review['date'])));
      });
    }
    return _reviews;
  }

  void getDocument() {
    survey = SurveyRecord.getDocument(widget.surveyRef);
    survey.forEach((element) {
      sid = element.sid;
      reviews = _getReviews(sid);
    });
  }

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SurveyResultPage'});
    textController = TextEditingController();
    getDocument();
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
            logFirebaseEvent('SURVEY_RESULT_Icon_6i2xkf2d_ON_TAP');
            logFirebaseEvent('Icon_NavigateTo');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'SurveyPage'),
              ),
            );
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
      body: StreamBuilder<SurveyRecord>(
        stream: survey,
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
          return SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 16),
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
                                        '??????????????????????????????????????????????????????\n???????????????????????????????????????????????????',
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
                    if (columnSurveyRecord.review ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FutureBuilder(
                                  future: reviews,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      final _reviews = snapshot.data;
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: _reviews.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 8, 8, 8),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 8),
                                                          child: Text(
                                                            _reviews[
                                                                    listViewIndex]
                                                                .comment,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 8),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .pDark,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    _reviews[
                                                                            listViewIndex]
                                                                        .tag,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textLight,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            _reviews[
                                                                    listViewIndex]
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  _reviews[
                                                                          listViewIndex]
                                                                      .date),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sLight,
                                                                  ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              buttonSize: 32,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidBell,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sLight,
                                                                size: 12,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'IconButtonON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButtonShowSnackBar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      '????????????????????????????????????',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                    action:
                                                                        SnackBarAction(
                                                                      label:
                                                                          '??????',
                                                                      textColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .pLight,
                                                                      onPressed:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('??????'),
                                                                              content: Text('????????????????????????????????????????????????????????????'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('???????????????'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () async {
                                                                                    Navigator.pop(alertDialogContext);

                                                                                    final alertCreateData = createAlertRecordData(
                                                                                      sid: columnSurveyRecord.sid,
                                                                                      alertedBy: currentUserUid,
                                                                                      postedBy: _reviews[listViewIndex].uid,
                                                                                      date: getCurrentTimestamp,
                                                                                    );
                                                                                    await AlertRecord.collection.doc().set(alertCreateData);
                                                                                  },
                                                                                  child: Text('??????'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
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
                                        ),
                                      );
                                    } else {
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
                                  }),
                              if (!currentUser.loggedIn)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              '???????????????????????????????????????????????????',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        fontSize: 14,
                                                      ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  settings: const RouteSettings(
                                                      name: 'SurveyResultPage'),
                                                  builder: (context) =>
                                                      LoginPageWidget(
                                                    pagePath: LoginPagePath
                                                        .survey_result_page,
                                                    pageRef: widget.surveyRef,
                                                  ),
                                                ),
                                              );
                                            },
                                            text: '????????????????????????',
                                            icon: Icon(
                                              Icons.rate_review_rounded,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (currentUser.loggedIn)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Form(
                                      key: formKey,
                                      autovalidateMode: AutovalidateMode.always,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: TextFormField(
                                                controller: textController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: '?????????????????????????????????',
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(8, 0, 8, 0),
                                                  errorStyle: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor),
                                                  errorBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor)),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                validator: (val) {
                                                  if (val.isEmpty) {
                                                    return '??????????????????????????????????????????????????????';
                                                  }
                                                  if (val.length < 1) {
                                                    return 'Requires at least 1 characters.';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: FlutterFlowChoiceChips(
                                                initiallySelected: [
                                                  choiceChipsValue
                                                ],
                                                options: [
                                                  ChipData('????????????'),
                                                  ChipData('??????'),
                                                  ChipData('?????????')
                                                ],
                                                onChanged: (val) =>
                                                    setState(() {
                                                  choiceChipsValue = val.first;
                                                  alertTag = '';
                                                }),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .pDark,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .textLight,
                                                  iconSize: 18,
                                                  labelPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(8, 0, 8, 0),
                                                  elevation: 4,
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .pLight,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textLight,
                                                      ),
                                                  iconColor: Color(0x00000000),
                                                  iconSize: 18,
                                                  elevation: 4,
                                                ),
                                                chipSpacing: 8,
                                                multiselect: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 4),
                                              child: Text(
                                                alertTag,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 24),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (choiceChipsValue ==
                                                      null) {
                                                    setState(() => alertTag =
                                                        '????????????????????????????????????');
                                                  }
                                                  if (textController
                                                          .text.isEmpty ||
                                                      choiceChipsValue ==
                                                          null) {
                                                    return;
                                                  }
                                                  final _appCheckToken =
                                                      await AppCheckAgent
                                                          .getToken(context);
                                                  if (_appCheckToken != null) {
                                                    await AddReviewCall.call(
                                                      uid: currentUserUid,
                                                      sid: columnSurveyRecord
                                                          .sid,
                                                      date: dateTimeFormat(
                                                          'yMMMd',
                                                          getCurrentTimestamp),
                                                      comment:
                                                          textController.text,
                                                      tag: choiceChipsValue,
                                                      accessToken:
                                                          currentJwtToken,
                                                    );
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('??????????????????'),
                                                          content: Text(
                                                              '???????????????????????????????????????????????????'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('OK'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SurveyResultPageWidget(
                                                          surveyRef:
                                                              widget.surveyRef,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                text: '??????',
                                                icon: Icon(
                                                  Icons.rate_review_rounded,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SURVEY_RESULT_Text_vxdlpouf_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_NavigateTo');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyPageEditWidget(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      '????????????????????????????????????????????????????????????',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
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
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FlutterFlowAdBanner(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  showsTestAd: false,
                  iOSAdUnitID: 'ca-app-pub-8134368906531041/4883719188',
                  androidAdUnitID: 'ca-app-pub-8134368906531041/3047893333',
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}

class ReviewData {
  final String comment;
  final String tag;
  final String uid;
  final String displayName;
  final DateTime date;

  ReviewData({this.comment, this.tag, this.uid, this.displayName, this.date});
}
