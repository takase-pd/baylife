import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'terms_record.g.dart';

abstract class TermsRecord implements Built<TermsRecord, TermsRecordBuilder> {
  static Serializer<TermsRecord> get serializer => _$termsRecordSerializer;

  @nullable
  String get contents;

  @nullable
  int get number;

  @nullable
  String get title;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TermsRecordBuilder builder) => builder
    ..contents = ''
    ..number = 0
    ..title = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('terms');

  static Stream<TermsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TermsRecord._();
  factory TermsRecord([void Function(TermsRecordBuilder) updates]) =
      _$TermsRecord;

  static TermsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTermsRecordData({
  String contents,
  int number,
  String title,
}) =>
    serializers.toFirestore(
        TermsRecord.serializer,
        TermsRecord((t) => t
          ..contents = contents
          ..number = number
          ..title = title));
