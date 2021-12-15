import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsPageWidget extends StatefulWidget {
  const TermsPageWidget({Key key}) : super(key: key);

  @override
  _TermsPageWidgetState createState() => _TermsPageWidgetState();
}

class _TermsPageWidgetState extends State<TermsPageWidget> {
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
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            child: InkWell(
              onTap: () async {
                await launchURL('https://baylife-ff782.web.app/terms.html');
              },
              child: Text(
                '表示されない場合はこちらをクリック',
                style: FlutterFlowTheme.bodyText2.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.textDark,
                ),
              ),
            ),
          ),
          FlutterFlowWebView(
            url: 'https://baylife-ff782.web.app/terms.html',
            bypass: false,
            height: MediaQuery.of(context).size.height * 0.9,
            verticalScroll: false,
            horizontalScroll: false,
          ),
        ],
      ),
    );
  }
}
