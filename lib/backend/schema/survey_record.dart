import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'survey_record.g.dart';

abstract class SurveyRecord
    implements Built<SurveyRecord, SurveyRecordBuilder> {
  static Serializer<SurveyRecord> get serializer => _$surveyRecordSerializer;

  @nullable
  int get id;

  @nullable
  String get question;

  @nullable
  BuiltList<String> get choices;

  @nullable
  bool get status;

  @nullable
  DateTime get startDate;

  @nullable
  DateTime get endDate;

  @nullable
  BuiltList<double> get results;

  @nullable
  String get sid;

  @nullable
  String get comment;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SurveyRecordBuilder builder) => builder
    ..id = 0
    ..question = ''
    ..choices = ListBuilder()
    ..status = false
    ..results = ListBuilder()
    ..sid = ''
    ..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('survey');

  static Stream<SurveyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SurveyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SurveyRecord._();
  factory SurveyRecord([void Function(SurveyRecordBuilder) updates]) =
      _$SurveyRecord;

  static SurveyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSurveyRecordData({
  int id,
  String question,
  bool status,
  DateTime startDate,
  DateTime endDate,
  String sid,
  String comment,
}) =>
    serializers.toFirestore(
        SurveyRecord.serializer,
        SurveyRecord((s) => s
          ..id = id
          ..question = question
          ..choices = null
          ..status = status
          ..startDate = startDate
          ..endDate = endDate
          ..results = null
          ..sid = sid
          ..comment = comment));
