import '../backend/backend.dart';
import '../category_page/category_page_widget.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentPageWidget extends StatefulWidget {
  ContentPageWidget({
    Key key,
    this.contentRef,
  }) : super(key: key);

  final DocumentReference contentRef;

  @override
  _ContentPageWidgetState createState() => _ContentPageWidgetState();
}

class _ContentPageWidgetState extends State<ContentPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.textSecondary),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.textSecondary,
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
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
              child: StreamBuilder<ContentsRecord>(
                stream: ContentsRecord.getDocument(widget.contentRef),
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
                  final columnContentsRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          columnContentsRecord.title,
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          columnContentsRecord.organizer,
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
                        child: StreamBuilder<CategoriesRecord>(
                          stream: CategoriesRecord.getDocument(
                              columnContentsRecord.category),
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
                            final containerCategoriesRecord = snapshot.data;
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryPageWidget(
                                      catRef:
                                          containerCategoriesRecord.reference,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.secondaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3, 3, 0, 0),
                                  child: Text(
                                    containerCategoriesRecord.catName,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          columnContentsRecord.overview,
                          style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Divider(
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: columnContentsRecord.showImage ?? true,
                            child: Image.network(
                              columnContentsRecord.filePath,
                              width: 300,
                              height: 300,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          columnContentsRecord.detail,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textPrimary,
                          ),
                        ),
                      ),
                      Divider(
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 3, 7, 0),
                              child: Icon(
                                Icons.today_sharp,
                                color: FlutterFlowTheme.textPrimary,
                                size: 16,
                              ),
                            ),
                            Text(
                              dateTimeFormat(
                                  'yMMMd', columnContentsRecord.startDay),
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.textPrimary,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(7, 3, 7, 0),
                              child: Icon(
                                Icons.double_arrow_sharp,
                                color: FlutterFlowTheme.textPrimary,
                                size: 16,
                              ),
                            ),
                            Text(
                              dateTimeFormat(
                                  'yMMMd', columnContentsRecord.finalDay),
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.textPrimary,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 3, 7, 0),
                              child: Icon(
                                Icons.place_outlined,
                                color: FlutterFlowTheme.textPrimary,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                columnContentsRecord.address,
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.textPrimary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 3, 7, 0),
                              child: Icon(
                                Icons.open_in_new_rounded,
                                color: FlutterFlowTheme.textPrimary,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      columnContentsRecord.homepage);
                                },
                                child: Text(
                                  columnContentsRecord.homepage,
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.textPrimary,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 3, 7, 0),
                              child: FaIcon(
                                FontAwesomeIcons.smile,
                                color: FlutterFlowTheme.textPrimary,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                columnContentsRecord.organizer,
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.textPrimary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 3, 7, 0),
                              child: Icon(
                                Icons.add_to_home_screen_outlined,
                                color: FlutterFlowTheme.textPrimary,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                columnContentsRecord.contact,
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.textPrimary,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: FlutterFlowAdBanner(
                width: MediaQuery.of(context).size.width,
                height: 50,
                showsTestAd: false,
                iOSAdUnitID: 'ca-app-pub-8134368906531041/4883719188',
              ),
            )
          ],
        ),
      ),
    );
  }
}
