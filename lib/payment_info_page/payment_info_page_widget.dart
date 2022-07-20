import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart';
import '../index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bay_life/custom_code/widgets/index.dart';

class PaymentInfoPageWidget extends StatefulWidget {
  const PaymentInfoPageWidget({
    Key key,
    this.purchase,
    this.purchases,
  }) : super(key: key);

  final Purchase purchase;
  final List<Purchase> purchases;

  @override
  _PaymentInfoPageWidgetState createState() => _PaymentInfoPageWidgetState();
}

class _PaymentInfoPageWidgetState extends State<PaymentInfoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<PaymentDetails> payment;

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaymentInfoPage'});
    final paymentId = widget.purchase.paymentId;
    payment = PaymentDetails.create(paymentId, context);
  }

  @override
  Widget build(BuildContext context) {
    final _purchase = widget.purchase;
    final _plan = _purchase.plan;
    final _purchases = widget.purchases;
    final _puchasedWith = _purchases
        .where((purchase) => purchase.paymentId == _purchase.paymentId)
        .toList();
    _puchasedWith
        .removeWhere((purchase) => purchase.plan.path == _purchase.plan.path);
    return currentUser.loggedIn
        ? Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0.4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '購入内容',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.95, 0.4),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent('CardON_TAP');
                              logFirebaseEvent('CardNavigateBack');
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PurchasesPageWidget(),
                                ),
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).background,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<PlansRecord>(
                              stream: PlansRecord.getDocument(
                                  FirebaseFirestore.instance.doc(_plan.path)),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                PlansRecord imagePlansRecord = snapshot.data;
                                return Image.network(
                                  imagePlansRecord.banner,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Text(
                                            _plan.name.maybeHandleOverflow(
                                              maxChars: 12,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child: Text(
                                                  formatNumber(
                                                    _plan.quantity,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '数量 ',
                                                    format: '#,##0',
                                                    locale: 'ja_JP',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  _plan.subtotal,
                                                  formatType: FormatType.custom,
                                                  currency: '￥',
                                                  format: '#,##0',
                                                  locale: 'ja_JP',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'MMM d, y h:mm a',
                                                    _purchase.purchased),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    FaIcon(
                                      _plan.status.icon,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: _plan.status.size,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Text(
                      'お支払い情報',
                      style: FlutterFlowTheme.of(context).title2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).background,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: FutureBuilder<PaymentDetails>(
                          future: payment,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final _payment = snapshot.data;
                              final _billing = _payment.billing;
                              final _card = _payment.card;
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              "お支払い金額",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Text(
                                              "合計：" +
                                                  formatNumber(
                                                    _purchase.totalAmount,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '￥',
                                                    format: '#,##0',
                                                    locale: 'ja_JP',
                                                  ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Text(
                                              "（",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Text(
                                              "商品：" +
                                                  formatNumber(
                                                    _purchase.subtotal,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '￥',
                                                    format: '#,##0',
                                                    locale: 'ja_JP',
                                                  ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Text(
                                              "送料：" +
                                                  formatNumber(
                                                    _purchase.shippingFee,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '￥',
                                                    format: '#,##0',
                                                    locale: 'ja_JP',
                                                  ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Text(
                                              "）",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              "お支払い方法",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              _card.brand.toUpperCase(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              "末尾 " + _card.last4,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              "お支払い者様",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              _billing.address.postalCode,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              _billing.address.state +
                                                  _billing.address.city +
                                                  _billing.address.line1 +
                                                  _billing.address.line2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              _billing.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              _billing.phone,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              _billing.email,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Text(
                      'お届け情報',
                      style: FlutterFlowTheme.of(context).title2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).background,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: FutureBuilder<PaymentDetails>(
                          future: payment,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final payment = snapshot.data;
                              final shipping = payment.shipping;
                              final trackingNumbers = payment
                                  .shipping.trackingNumber
                                  .split(',')
                                  .toList();
                              final code = trackingNumbers.firstWhere(
                                  (element) => element.contains(_plan.id),
                                  orElse: () => '');
                              final trackingNumber = code.isEmpty
                                  ? ''
                                  : code.split(':').toList().last;
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              "配送",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              '状況：' + _plan.status.label,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Text(
                                              shipping.carrier == null ||
                                                      shipping.carrier.length ==
                                                          0
                                                  ? '配送業者未設定'
                                                  : shipping.carrier,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 0),
                                            child: Text(
                                              trackingNumber.isNotEmpty
                                                  ? '追跡番号：' + trackingNumber
                                                  : '追跡番号なし',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              "お届け先",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              shipping.address.postalCode,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              shipping.address.state +
                                                  shipping.address.city +
                                                  shipping.address.line1 +
                                                  shipping.address.line2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              shipping.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              shipping.phone ?? '',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  if (_puchasedWith.isNotEmpty)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              '一緒に注文した商品',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _puchasedWith.length,
                            itemBuilder: (context, listViewIndex) {
                              final _purchase = _puchasedWith[listViewIndex];
                              final _plan = _purchase.plan;
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('ContainerON_TAP');
                                    logFirebaseEvent('ContainerNavigateTo');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentInfoPageWidget(
                                          purchase: _purchase,
                                          purchases: _purchases,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 12, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          StreamBuilder<PlansRecord>(
                                            stream: PlansRecord.getDocument(
                                                FirebaseFirestore.instance
                                                    .doc(_plan.path)),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitPulse(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              PlansRecord imagePlansRecord =
                                                  snapshot.data;
                                              return Image.network(
                                                imagePlansRecord.banner,
                                                width: 64,
                                                height: 64,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 8, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 8, 0),
                                                        child: Text(
                                                          _plan.name
                                                              .maybeHandleOverflow(
                                                            maxChars: 12,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Text(
                                                                formatNumber(
                                                                  _plan
                                                                      .quantity,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  currency:
                                                                      '数量 ',
                                                                  format:
                                                                      '#,##0',
                                                                  locale:
                                                                      'ja_JP',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                              ),
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                _plan.subtotal,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency: '￥',
                                                                format: '#,##0',
                                                                locale: 'ja_JP',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        16,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'MMM d, y',
                                                                  _purchase
                                                                      .purchased),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  FaIcon(
                                                    _plan.status.icon,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: _plan.status.size,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        : LoginPageWidget(
            pagePath: LoginPagePath.purchases_page,
          );
  }
}
