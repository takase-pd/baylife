import '../auth/auth_util.dart';
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
import '../my_page_edit/my_page_edit_widget.dart';
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
  String choiceChipsValue;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SurveyResultPage'});
    textController = TextEditingController();
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
            logFirebaseEvent('Icon_Navigate-To');
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
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 10, 16),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).background,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          dateTimeFormat('yMMMd',
                                              columnSurveyRecord.startDate),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sLight,
                                                fontSize: 12,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'アジアン',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: Text(
                                                      '32.1 ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                  ),
                                                  Text(
                                                    '%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    columnSurveyRecord.comment,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .textDark,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (columnSurveyRecord.review ?? true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      if (columnSurveyRecord.review ?? true)
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Text(
                                                    'Hello World',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pDark,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 4, 12, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'オススメ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .textLight,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'username',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'date',
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
                                                      ],
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      buttonSize: 32,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .solidBell,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sLight,
                                                        size: 12,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'SURVEY_RESULT_solidBell_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_Show-Snack-Bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              '問題のあるコメントを通知',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textLight,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                            action:
                                                                SnackBarAction(
                                                              label: '通知',
                                                              textColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              onPressed:
                                                                  () async {
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('通知'),
                                                                              content: Text('問題のあるコメントを管理者に通知します。'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('キャンセル'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('通知'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
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
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 8),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .background,
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
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Text(
                                                '口コミ、コメントをお寄せください！',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'ログインして投稿',
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
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 8),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .background,
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
                                                  hintText: 'コメント',
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
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            FlutterFlowChoiceChips(
                                              initiallySelected: [
                                                choiceChipsValue
                                              ],
                                              options: [
                                                ChipData('オススメ'),
                                                ChipData('要望'),
                                                ChipData('その他')
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  choiceChipsValue = val.first),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .pDark,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textLight,
                                                iconSize: 18,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 8, 0),
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .pLight,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
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
                                              alignment: WrapAlignment.start,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 4),
                                              child: Text(
                                                'Hello World',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 24),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: '投稿',
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
                                                  borderRadius: 16,
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
                                                          'Text_Navigate-To');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyPageEditWidget(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      'コメントで表示されるユーザー名を変更する',
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
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
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
            ),
          );
        },
      ),
    );
  }
}
