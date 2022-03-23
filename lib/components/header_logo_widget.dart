import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLogoWidget extends StatefulWidget {
  const HeaderLogoWidget({Key key}) : super(key: key);

  @override
  _HeaderLogoWidgetState createState() => _HeaderLogoWidgetState();
}

class _HeaderLogoWidgetState extends State<HeaderLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LogonameRecord>>(
      stream: queryLogonameRecord(
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<LogonameRecord> columnLogonameRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final columnLogonameRecord = columnLogonameRecordList.isNotEmpty
            ? columnLogonameRecordList.first
            : null;
        return InkWell(
          onTap: () async {
            logFirebaseEvent('Column-ON_TAP');
            logFirebaseEvent('Column-Navigate-To');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomePage'),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Text(
                      columnLogonameRecord.second,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).textLight,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
