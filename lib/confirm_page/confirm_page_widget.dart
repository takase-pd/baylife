import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_page_with_login/post_page_with_login_widget.dart';
import '../terms_page/terms_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPageWidget extends StatefulWidget {
  const ConfirmPageWidget({
    Key key,
    this.catName,
    this.catNameAdd,
    this.title,
    this.overview,
    this.detail,
    this.organizer,
    this.contact,
    this.homepage,
    this.postName,
    this.postEmail,
    this.postPhone,
    this.postOccupation,
    this.permission,
    this.address,
    this.startDay,
    this.finalDay,
    this.filePath,
    this.postRemarks,
  }) : super(key: key);

  final String catName;
  final String catNameAdd;
  final String title;
  final String overview;
  final String detail;
  final String organizer;
  final String contact;
  final String homepage;
  final String postName;
  final String postEmail;
  final String postPhone;
  final String postOccupation;
  final bool permission;
  final String address;
  final DateTime startDay;
  final DateTime finalDay;
  final String filePath;
  final String postRemarks;

  @override
  _ConfirmPageWidgetState createState() => _ConfirmPageWidgetState();
}

class _ConfirmPageWidgetState extends State<ConfirmPageWidget> {
  bool checkboxListTileValue;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '投稿 確認',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '投稿内容',
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '投稿に表示されます。秘密情報などは記載しないでください。',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.title,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.catName,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.catNameAdd,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.overview,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.detail,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Text(
                                            '添付画像',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Open Sans',
                                              color: FlutterFlowTheme.textDark,
                                            ),
                                          ),
                                        ),
                                        Image.network(
                                          valueOrDefault<String>(
                                            widget.filePath,
                                            'https://firebasestorage.googleapis.com/v0/b/baylife-ff782.appspot.com/o/assets%2FNoImage.png?alt=media&token=cfb3d70b-69d2-4f7f-be63-f429cc9872da',
                                          ),
                                          width: 100,
                                          height: 60,
                                          fit: BoxFit.cover,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Text(
                                            '開始日',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Open Sans',
                                              color: FlutterFlowTheme.textDark,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'yMMMd', widget.startDay),
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Text(
                                            '終了日',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Open Sans',
                                              color: FlutterFlowTheme.textDark,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'yMMMd', widget.finalDay),
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.address,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.homepage,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.organizer,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.contact,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '投稿者情報',
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '投稿には表示されません。投稿の確認、連絡などに使用します。',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postName,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postEmail,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postPhone,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postOccupation,
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 330,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postRemarks,
                                      style: FlutterFlowTheme.bodyText2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TermsPageWidget(),
                              ),
                            );
                          },
                          child: Text(
                            '＊利用規約に従い投稿します。',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.textDark,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: CheckboxListTile(
                            value: checkboxListTileValue ??= widget.permission,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue = newValue),
                            title: Text(
                              '上記内容に同意',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.textDark,
                              ),
                            ),
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 165,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: 165,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.95, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        text: '戻る',
                                        options: FFButtonOptions(
                                          width: 140,
                                          height: 60,
                                          color: FlutterFlowTheme.sLight,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textLight,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          elevation: 2,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 2,
                                          ),
                                          borderRadius: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 165,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: StreamBuilder<List<CategoriesRecord>>(
                                    stream: queryCategoriesRecord(
                                      queryBuilder: (categoriesRecord) =>
                                          categoriesRecord.where('cat_name',
                                              isEqualTo: widget.catName),
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
                                      List<CategoriesRecord>
                                          containerCategoriesRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final containerCategoriesRecord =
                                          containerCategoriesRecordList
                                                  .isNotEmpty
                                              ? containerCategoriesRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        width: 165,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.95, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await RegistContentsCall.call(
                                                catName: widget.catName,
                                                catNameAdd: widget.catNameAdd,
                                                title: widget.title,
                                                overview:
                                                    functions.getMultilineText(
                                                        widget.overview),
                                                detail:
                                                    functions.getMultilineText(
                                                        widget.detail),
                                                organizer: widget.organizer,
                                                contact: widget.contact,
                                                homepage: widget.homepage,
                                                postName: widget.postName,
                                                postEmail: widget.postEmail,
                                                postPhone: widget.postPhone,
                                                postOccupation:
                                                    widget.postOccupation,
                                                permission: widget.permission,
                                                address: widget.address,
                                                startDay: dateTimeFormat(
                                                    'yMMMd', widget.startDay),
                                                finalDay: dateTimeFormat(
                                                    'yMMMd', widget.finalDay),
                                                filePath: widget.filePath,
                                                postRemarks: widget.postRemarks,
                                                uid: currentUserUid,
                                              );
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('送信完了'),
                                                    content: Text(
                                                        '投稿ありがとうございます。投稿内容を審査しますので、お待ち下さい。'),
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
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PostPageWithLoginWidget(),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            text: '送信',
                                            options: FFButtonOptions(
                                              width: 140,
                                              height: 60,
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.textLight,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2,
                                              ),
                                              borderRadius: 8,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
