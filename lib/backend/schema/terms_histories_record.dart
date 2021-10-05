import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'terms_histories_record.g.dart';

abstract class TermsHistoriesRecord
    implements Built<TermsHistoriesRecord, TermsHistoriesRecordBuilder> {
  static Serializer<TermsHistoriesRecord> get serializer =>
      _$termsHistoriesRecordSerializer;

  @nullable
  DateTime get date;

  @nullable
  String get title;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TermsHistoriesRecordBuilder builder) =>
      builder..title = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('terms_histories');

  static Stream<TermsHistoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TermsHistoriesRecord._();
  factory TermsHistoriesRecord(
          [void Function(TermsHistoriesRecordBuilder) updates]) =
      _$TermsHistoriesRecord;

  static TermsHistoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTermsHistoriesRecordData({
  DateTime date,
  String title,
}) =>
    serializers.toFirestore(
        TermsHistoriesRecord.serializer,
        TermsHistoriesRecord((t) => t
          ..date = date
          ..title = title));
