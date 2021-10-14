import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../confirm_page/confirm_page_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../terms_page/terms_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPageWithLoginWidget extends StatefulWidget {
  PostPageWithLoginWidget({Key key}) : super(key: key);

  @override
  _PostPageWithLoginWidgetState createState() =>
      _PostPageWithLoginWidgetState();
}

class _PostPageWithLoginWidgetState extends State<PostPageWithLoginWidget> {
  DateTime datePicked1;
  bool _loadingButton2 = false;
  String categoryValue;
  TextEditingController titleController;
  TextEditingController categoryAddController;
  TextEditingController overviewController;
  TextEditingController detailController;
  String uploadedFileUrl = '';
  bool _loadingButton1 = false;
  DateTime datePicked2;
  bool _loadingButton3 = false;
  TextEditingController addressController;
  TextEditingController homepageController;
  TextEditingController organizerController;
  TextEditingController contactController;
  TextEditingController postOccupationController;
  TextEditingController postPhoneController;
  TextEditingController postRemarksController;
  bool _loadingButton4 = false;
  bool checkboxListTileValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    categoryAddController = TextEditingController();
    titleController = TextEditingController();
    overviewController = TextEditingController();
    detailController = TextEditingController();
    homepageController = TextEditingController();
    organizerController = TextEditingController();
    contactController = TextEditingController();
    postOccupationController = TextEditingController();
    postPhoneController = TextEditingController();
    postRemarksController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          iconTheme: IconThemeData(color: FlutterFlowTheme.textPrimary),
          automaticallyImplyLeading: true,
          leading: InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: FlutterFlowTheme.secondaryColor,
              size: 24,
            ),
          ),
          title: HeaderLogoWidget(),
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        backgroundColor: FlutterFlowTheme.grayLight,
        endDrawer: Drawer(
          elevation: 16,
          child: EndDrawerWidget(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
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
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            );
                          }
                          List<InfoInappRecord> columnInfoInappRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final columnInfoInappRecord =
                              columnInfoInappRecordList.isNotEmpty
                                  ? columnInfoInappRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '投稿',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.textPrimary,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  columnInfoInappRecord.postInfo,
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.textPrimary,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  columnInfoInappRecord.postRule,
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '投稿内容',
                            style: FlutterFlowTheme.title2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.textPrimary,
                            ),
                          ),
                          Text(
                            '投稿に表示されます。秘密情報などは記載しないでください。',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: titleController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'タイトル  ＊必須',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'タイトルを入力してください。';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: StreamBuilder<List<CatDdRecord>>(
                                        stream: queryCatDdRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<CatDdRecord>
                                              categoryCatDdRecordList =
                                              snapshot.data;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data.isEmpty) {
                                            return Container();
                                          }
                                          final categoryCatDdRecord =
                                              categoryCatDdRecordList.isNotEmpty
                                                  ? categoryCatDdRecordList
                                                      .first
                                                  : null;
                                          return FlutterFlowDropDown(
                                            initialOption: categoryValue ??=
                                                'カテゴリー',
                                            options: categoryCatDdRecord.cats
                                                .toList(),
                                            onChanged: (val) => setState(
                                                () => categoryValue = val),
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.textDark,
                                            ),
                                            fillColor: Colors.white,
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 8, 4),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: categoryAddController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'その他の希望カテゴリー',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          hintText: '＊必ずしも反映されるわけではありません。',
                                          hintStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: overviewController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '概要 ＊必須',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          hintText: '投稿一覧ページに表示されます。',
                                          hintStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 3,
                                        keyboardType: TextInputType.multiline,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return '概要を入力してください。';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: detailController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '投稿詳細 ＊必須',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 30,
                                        keyboardType: TextInputType.multiline,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return '投稿詳細を入力してください。';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '添付画像 300X300px以内',
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      FlutterFlowTheme.textDark,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 3, 0, 0),
                                                child: Text(
                                                  '選択すると画像をアップロードします。',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme
                                                        .textDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              setState(
                                                  () => _loadingButton1 = true);
                                              try {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  maxWidth: 300.00,
                                                  maxHeight: 300.00,
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                );
                                                if (selectedMedia != null &&
                                                    validateFileFormat(
                                                        selectedMedia
                                                            .storagePath,
                                                        context)) {
                                                  showUploadMessage(context,
                                                      'Uploading file...',
                                                      showLoading: true);
                                                  final downloadUrl =
                                                      await uploadData(
                                                          selectedMedia
                                                              .storagePath,
                                                          selectedMedia.bytes);
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  if (downloadUrl != null) {
                                                    setState(() =>
                                                        uploadedFileUrl =
                                                            downloadUrl);
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    showUploadMessage(context,
                                                        'Failed to upload media');
                                                    return;
                                                  }
                                                }
                                              } finally {
                                                setState(() =>
                                                    _loadingButton1 = false);
                                              }
                                            },
                                            text: '画像',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 40,
                                              color: FlutterFlowTheme
                                                  .secondaryDark,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: FlutterFlowTheme
                                                    .textSecondary,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                            loading: _loadingButton1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '開始日 ＊必須',
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      FlutterFlowTheme.textDark,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'yMMMd', datePicked1),
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme
                                                        .textDark,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              setState(
                                                  () => _loadingButton2 = true);
                                              try {
                                                await DatePicker.showDatePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    setState(() =>
                                                        datePicked1 = date);
                                                  },
                                                  currentTime:
                                                      getCurrentTimestamp,
                                                );
                                              } finally {
                                                setState(() =>
                                                    _loadingButton2 = false);
                                              }
                                            },
                                            text: '日付',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 40,
                                              color: FlutterFlowTheme
                                                  .secondaryDark,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .textSecondary,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                            loading: _loadingButton2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '終了日 ＊必須',
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      FlutterFlowTheme.textDark,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'yMMMd', datePicked2),
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme
                                                        .textDark,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              setState(
                                                  () => _loadingButton3 = true);
                                              try {
                                                await DatePicker.showDatePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    setState(() =>
                                                        datePicked2 = date);
                                                  },
                                                  currentTime:
                                                      getCurrentTimestamp,
                                                );
                                              } finally {
                                                setState(() =>
                                                    _loadingButton3 = false);
                                              }
                                            },
                                            text: '日付',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 40,
                                              color: FlutterFlowTheme
                                                  .secondaryDark,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .textSecondary,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                            loading: _loadingButton3,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: addressController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '開催場所 ＊必須',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          hintText: '店舗、イベント会場等の住所等',
                                          hintStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return '開催場所を入力してください。';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: homepageController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ホームページ',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        keyboardType: TextInputType.url,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: organizerController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '主催 ＊必須',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return '主催者の名前を入力してください。';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: contactController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '問い合わせ先（担当者名・部署など） ＊必須',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return '問い合わせ先を入力してください。';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '投稿者情報',
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.textPrimary,
                                ),
                              )
                            ],
                          ),
                          Text(
                            '投稿には表示されません。管理者から投稿の確認、連絡などに使用します。',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          currentUserDisplayName,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          currentUserEmail,
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: postPhoneController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '電話番号',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        keyboardType: TextInputType.phone,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: postOccupationController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '所属',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: postRemarksController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '備考',
                                          labelStyle: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.textDark,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 20,
                                        keyboardType: TextInputType.multiline,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
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
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.textDark,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: CheckboxListTile(
                              value: checkboxListTileValue ??= false,
                              onChanged: (newValue) => setState(
                                  () => checkboxListTileValue = newValue),
                              title: Text(
                                '上記内容に同意',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.textDark,
                                ),
                              ),
                              tileColor: FlutterFlowTheme.grayLight,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 330,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.95, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(
                                              () => _loadingButton4 = true);
                                          try {
                                            if (!formKey.currentState
                                                .validate()) {
                                              return;
                                            }
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ConfirmPageWidget(
                                                  catName: categoryValue,
                                                  catNameAdd:
                                                      categoryAddController
                                                          .text,
                                                  title: titleController.text,
                                                  overview:
                                                      overviewController.text,
                                                  detail: detailController.text,
                                                  organizer:
                                                      organizerController.text,
                                                  contact:
                                                      contactController.text,
                                                  homepage:
                                                      homepageController.text,
                                                  postName:
                                                      currentUserDisplayName,
                                                  postEmail: currentUserEmail,
                                                  postPhone:
                                                      postPhoneController.text,
                                                  postOccupation:
                                                      postOccupationController
                                                          .text,
                                                  permission:
                                                      checkboxListTileValue,
                                                  address:
                                                      addressController.text,
                                                  startDay: datePicked1,
                                                  finalDay: datePicked2,
                                                  filePath:
                                                      valueOrDefault<String>(
                                                    uploadedFileUrl,
                                                    'https://firebasestorage.googleapis.com/v0/b/baylife-ff782.appspot.com/o/assets%2FNoImage.png?alt=media&token=cfb3d70b-69d2-4f7f-be63-f429cc9872da',
                                                  ),
                                                  postRemarks:
                                                      postRemarksController
                                                          .text,
                                                ),
                                              ),
                                            );
                                          } finally {
                                            setState(
                                                () => _loadingButton4 = false);
                                          }
                                        },
                                        text: '確認',
                                        options: FFButtonOptions(
                                          width: 140,
                                          height: 60,
                                          color: FlutterFlowTheme.secondaryDark,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color:
                                                FlutterFlowTheme.textSecondary,
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
                                        loading: _loadingButton4,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
