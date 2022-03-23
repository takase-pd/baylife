import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsPageWidget extends StatefulWidget {
  const TermsPageWidget({
    Key key,
    this.termsUrl,
  }) : super(key: key);

  final String termsUrl;

  @override
  _TermsPageWidgetState createState() => _TermsPageWidgetState();
}

class _TermsPageWidgetState extends State<TermsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TermsPage'});
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
            logFirebaseEvent('Icon-ON_TAP');
            logFirebaseEvent('Icon-Navigate-Back');
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
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('Text-ON_TAP');
                logFirebaseEvent('Text-Launch-U-R-L');
                await launchURL(widget.termsUrl);
              },
              child: Text(
                '表示されない場合はこちらをクリック',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.of(context).textDark,
                    ),
              ),
            ),
          ),
          Expanded(
            child: FlutterFlowWebView(
              url: widget.termsUrl,
              bypass: false,
              verticalScroll: false,
              horizontalScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
