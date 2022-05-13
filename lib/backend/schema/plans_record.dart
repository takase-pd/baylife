import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'plans_record.g.dart';

abstract class PlansRecord implements Built<PlansRecord, PlansRecordBuilder> {
  static Serializer<PlansRecord> get serializer => _$plansRecordSerializer;

  @nullable
  bool get active;

  @nullable
  String get name;

  @nullable
  DocumentReference get shop;

  @nullable
  @BuiltValueField(wireName: 'unit_amount')
  int get unitAmount;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'active_quick')
  bool get activeQuick;

  @nullable
  String get banner;

  @nullable
  @BuiltValueField(wireName: 'shipping_normal')
  String get shippingNormal;

  @nullable
  @BuiltValueField(wireName: 'shipping_quick')
  String get shippingQuick;

  @nullable
  @BuiltValueField(wireName: 'shipping_fee_normal')
  int get shippingFeeNormal;

  @nullable
  DateTime get published;

  @nullable
  @BuiltValueField(wireName: 'quantity_max')
  int get quantityMax;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PlansRecordBuilder builder) => builder
    ..active = false
    ..name = ''
    ..unitAmount = 0
    ..description = ''
    ..activeQuick = false
    ..banner = ''
    ..shippingNormal = ''
    ..shippingQuick = ''
    ..shippingFeeNormal = 0
    ..quantityMax = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PlansRecord._();
  factory PlansRecord([void Function(PlansRecordBuilder) updates]) =
      _$PlansRecord;

  static PlansRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPlansRecordData({
  bool active,
  String name,
  DocumentReference shop,
  int unitAmount,
  String description,
  bool activeQuick,
  String banner,
  String shippingNormal,
  String shippingQuick,
  int shippingFeeNormal,
  DateTime published,
  int quantityMax,
}) =>
    serializers.toFirestore(
        PlansRecord.serializer,
        PlansRecord((p) => p
          ..active = active
          ..name = name
          ..shop = shop
          ..unitAmount = unitAmount
          ..description = description
          ..activeQuick = activeQuick
          ..banner = banner
          ..shippingNormal = shippingNormal
          ..shippingQuick = shippingQuick
          ..shippingFeeNormal = shippingFeeNormal
          ..published = published
          ..quantityMax = quantityMax));
