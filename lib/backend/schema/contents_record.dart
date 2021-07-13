import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'contents_record.g.dart';

abstract class ContentsRecord
    implements Built<ContentsRecord, ContentsRecordBuilder> {
  static Serializer<ContentsRecord> get serializer =>
      _$contentsRecordSerializer;

  @nullable
  String get title;

  @nullable
  @BuiltValueField(wireName: 'header_text')
  String get headerText;

  @nullable
  @BuiltValueField(wireName: 'info_text')
  String get infoText;

  @nullable
  String get sender;

  @nullable
  DateTime get period;

  @nullable
  DateTime get posted;

  @nullable
  bool get display;

  @nullable
  DocumentReference get category;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContentsRecordBuilder builder) => builder
    ..title = ''
    ..headerText = ''
    ..infoText = ''
    ..sender = ''
    ..display = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contents');

  static Stream<ContentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ContentsRecord._();
  factory ContentsRecord([void Function(ContentsRecordBuilder) updates]) =
      _$ContentsRecord;

  static ContentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createContentsRecordData({
  String title,
  String headerText,
  String infoText,
  String sender,
  DateTime period,
  DateTime posted,
  bool display,
  DocumentReference category,
}) =>
    serializers.toFirestore(
        ContentsRecord.serializer,
        ContentsRecord((c) => c
          ..title = title
          ..headerText = headerText
          ..infoText = infoText
          ..sender = sender
          ..period = period
          ..posted = posted
          ..display = display
          ..category = category));
