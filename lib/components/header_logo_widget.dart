import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
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
                color: FlutterFlowTheme.primaryColor,
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
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageWidget(),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                columnLogonameRecord.first,
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.textLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Text(
                      columnLogonameRecord.second,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Open Sans',
                        color: FlutterFlowTheme.textLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    columnLogonameRecord.version,
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.textLight,
                      fontSize: 10,
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
