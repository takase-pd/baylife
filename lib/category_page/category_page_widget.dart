import '../backend/backend.dart';
import '../components/cat_row_widget.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../content_page/content_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../post_page_with_login/post_page_with_login_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/firebase_user_provider.dart';
import '../login_page/login_page_path.dart';

class CategoryPageWidget extends StatefulWidget {
  const CategoryPageWidget({
    Key key,
    this.catRef,
  }) : super(key: key);

  final DocumentReference catRef;

  @override
  _CategoryPageWidgetState createState() => _CategoryPageWidgetState();
}

class _CategoryPageWidgetState extends State<CategoryPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CategoryPage'});
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
            logFirebaseEvent('CATEGORY_PAGE_PAGE_Icon_xfzu8cvb_ON_TAP');
            logFirebaseEvent('Icon_NavigateBack');
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('CATEGORY_FloatingActionButton_vpbl2xjc_O');
          logFirebaseEvent('FloatingActionButton_NavigateTo');
          await Navigator.push(
            context,
            MaterialPageRoute(
              settings: const RouteSettings(name: 'PostPageWithLogin'),
              builder: (context) {
                if (currentUser.loggedIn) return PostPageWithLoginWidget();
                return LoginPageWidget(
                    pagePath: LoginPagePath.post_page_with_login);
              },
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        elevation: 8,
        child: Icon(
          Icons.post_add_sharp,
          color: FlutterFlowTheme.of(context).textLight,
          size: 24,
        ),
      ),
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerWidget(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CatRowWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: StreamBuilder<List<ContentsRecord>>(
                stream: queryContentsRecord(
                  queryBuilder: (contentsRecord) => contentsRecord
                      .where('category', isEqualTo: widget.catRef)
                      .where('display', isEqualTo: true)
                      .where('permission', isEqualTo: true),
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
                  List<ContentsRecord> listViewContentsRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewContentsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewContentsRecord =
                          listViewContentsRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'CATEGORY_PAGE_PAGE_Card_21biz0hq_ON_TAP');
                            logFirebaseEvent('Card_NavigateTo');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContentPageWidget(
                                  contentRef: listViewContentsRecord.reference,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).background,
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
                                      listViewContentsRecord.title,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .textDark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      listViewContentsRecord.overview,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .textDark,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<CategoriesRecord>(
                                    stream: CategoriesRecord.getDocument(
                                        widget.catRef),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitPulse(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      final rowCategoriesRecord = snapshot.data;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Text(
                                                    listViewContentsRecord
                                                        .organizer,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textDark,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CATEGORY_Container_r0i3e7d0_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_NavigateTo');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CategoryPageWidget(
                                                            catRef:
                                                                rowCategoriesRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 70,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3, 3, 0, 0),
                                                        child: Text(
                                                          rowCategoriesRecord
                                                              .catName,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textLight,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (listViewContentsRecord
                                                  .showImage ??
                                              true)
                                            Expanded(
                                              flex: 3,
                                              child: Image.network(
                                                listViewContentsRecord.filePath,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                        ],
                                      );
                                    },
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
        ],
      ),
    );
  }
}
