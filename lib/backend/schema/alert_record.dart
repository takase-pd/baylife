import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'alert_record.g.dart';

abstract class AlertRecord implements Built<AlertRecord, AlertRecordBuilder> {
  static Serializer<AlertRecord> get serializer => _$alertRecordSerializer;

  @nullable
  DocumentReference get sid;

  @nullable
  @BuiltValueField(wireName: 'alerted_by')
  String get alertedBy;

  @nullable
  @BuiltValueField(wireName: 'posted_by')
  String get postedBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AlertRecordBuilder builder) => builder
    ..alertedBy = ''
    ..postedBy = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alert');

  static Stream<AlertRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AlertRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AlertRecord._();
  factory AlertRecord([void Function(AlertRecordBuilder) updates]) =
      _$AlertRecord;

  static AlertRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAlertRecordData({
  DocumentReference sid,
  String alertedBy,
  String postedBy,
}) =>
    serializers.toFirestore(
        AlertRecord.serializer,
        AlertRecord((a) => a
          ..sid = sid
          ..alertedBy = alertedBy
          ..postedBy = postedBy));
