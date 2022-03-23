import '../backend/backend.dart';
import '../category_page/category_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CatRowWidget extends StatefulWidget {
  const CatRowWidget({Key key}) : super(key: key);

  @override
  _CatRowWidgetState createState() => _CatRowWidgetState();
}

class _CatRowWidgetState extends State<CatRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: StreamBuilder<List<CategoriesRecord>>(
        stream: queryCategoriesRecord(
          queryBuilder: (categoriesRecord) =>
              categoriesRecord.orderBy('cat_id'),
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
          List<CategoriesRecord> rowCategoriesRecordList = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children:
                  List.generate(rowCategoriesRecordList.length, (rowIndex) {
                final rowCategoriesRecord = rowCategoriesRecordList[rowIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('TextON_TAP');
                      logFirebaseEvent('TextNavigateTo');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPageWidget(
                            catRef: rowCategoriesRecord.reference,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      rowCategoriesRecord.catName,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).textDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
