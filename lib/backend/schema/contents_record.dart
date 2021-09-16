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
  DateTime get posted;

  @nullable
  bool get display;

  @nullable
  DocumentReference get category;

  @nullable
  @BuiltValueField(wireName: 'cat_add')
  String get catAdd;

  @nullable
  String get contact;

  @nullable
  String get detail;

  @nullable
  String get homepage;

  @nullable
  String get organizer;

  @nullable
  String get overview;

  @nullable
  bool get permission;

  @nullable
  @BuiltValueField(wireName: 'post_name')
  String get postName;

  @nullable
  @BuiltValueField(wireName: 'post_email')
  String get postEmail;

  @nullable
  @BuiltValueField(wireName: 'post_phone')
  String get postPhone;

  @nullable
  @BuiltValueField(wireName: 'post_occupation')
  String get postOccupation;

  @nullable
  String get to;

  @nullable
  BuiltList<String> get bccUids;

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: 'start_day')
  DateTime get startDay;

  @nullable
  @BuiltValueField(wireName: 'final_day')
  DateTime get finalDay;

  @nullable
  @BuiltValueField(wireName: 'file_path')
  String get filePath;

  @nullable
  @BuiltValueField(wireName: 'post_remarks')
  String get postRemarks;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContentsRecordBuilder builder) => builder
    ..title = ''
    ..display = false
    ..catAdd = ''
    ..contact = ''
    ..detail = ''
    ..homepage = ''
    ..organizer = ''
    ..overview = ''
    ..permission = false
    ..postName = ''
    ..postEmail = ''
    ..postPhone = ''
    ..postOccupation = ''
    ..to = ''
    ..bccUids = ListBuilder()
    ..address = ''
    ..filePath = ''
    ..postRemarks = '';

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
  DateTime posted,
  bool display,
  DocumentReference category,
  String catAdd,
  String contact,
  String detail,
  String homepage,
  String organizer,
  String overview,
  bool permission,
  String postName,
  String postEmail,
  String postPhone,
  String postOccupation,
  String to,
  String address,
  DateTime startDay,
  DateTime finalDay,
  String filePath,
  String postRemarks,
}) =>
    serializers.toFirestore(
        ContentsRecord.serializer,
        ContentsRecord((c) => c
          ..title = title
          ..posted = posted
          ..display = display
          ..category = category
          ..catAdd = catAdd
          ..contact = contact
          ..detail = detail
          ..homepage = homepage
          ..organizer = organizer
          ..overview = overview
          ..permission = permission
          ..postName = postName
          ..postEmail = postEmail
          ..postPhone = postPhone
          ..postOccupation = postOccupation
          ..to = to
          ..bccUids = null
          ..address = address
          ..startDay = startDay
          ..finalDay = finalDay
          ..filePath = filePath
          ..postRemarks = postRemarks));
