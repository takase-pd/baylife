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
  @BuiltValueField(wireName: 'pub_date')
  DateTime get pubDate;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'active_quick')
  bool get activeQuick;

  @nullable
  @BuiltValueField(wireName: 'delivery_normal')
  String get deliveryNormal;

  @nullable
  @BuiltValueField(wireName: 'delivery_quick')
  String get deliveryQuick;

  @nullable
  String get banner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PlansRecordBuilder builder) => builder
    ..active = false
    ..name = ''
    ..unitAmount = 0
    ..description = ''
    ..activeQuick = false
    ..deliveryNormal = ''
    ..deliveryQuick = ''
    ..banner = '';

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
  DateTime pubDate,
  String description,
  bool activeQuick,
  String deliveryNormal,
  String deliveryQuick,
  String banner,
}) =>
    serializers.toFirestore(
        PlansRecord.serializer,
        PlansRecord((p) => p
          ..active = active
          ..name = name
          ..shop = shop
          ..unitAmount = unitAmount
          ..pubDate = pubDate
          ..description = description
          ..activeQuick = activeQuick
          ..deliveryNormal = deliveryNormal
          ..deliveryQuick = deliveryQuick
          ..banner = banner));
