import '../backend/backend.dart';
import '../category_page/category_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatRowWidget extends StatefulWidget {
  CatRowWidget({Key key}) : super(key: key);

  @override
  _CatRowWidgetState createState() => _CatRowWidgetState();
}

class _CatRowWidgetState extends State<CatRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            );
          }
          List<CategoriesRecord> rowCategoriesRecordList = snapshot.data;
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(rowCategoriesRecordList.length, (rowIndex) {
              final rowCategoriesRecord = rowCategoriesRecordList[rowIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: InkWell(
                  onTap: () async {
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
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
