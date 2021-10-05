import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'logoname_record.g.dart';

abstract class LogonameRecord
    implements Built<LogonameRecord, LogonameRecordBuilder> {
  static Serializer<LogonameRecord> get serializer =>
      _$logonameRecordSerializer;

  @nullable
  String get first;

  @nullable
  String get second;

  @nullable
  String get version;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LogonameRecordBuilder builder) => builder
    ..first = ''
    ..second = ''
    ..version = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logoname');

  static Stream<LogonameRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LogonameRecord._();
  factory LogonameRecord([void Function(LogonameRecordBuilder) updates]) =
      _$LogonameRecord;

  static LogonameRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLogonameRecordData({
  String first,
  String second,
  String version,
}) =>
    serializers.toFirestore(
        LogonameRecord.serializer,
        LogonameRecord((l) => l
          ..first = first
          ..second = second
          ..version = version));
