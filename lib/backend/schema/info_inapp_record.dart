import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'info_inapp_record.g.dart';

abstract class InfoInappRecord
    implements Built<InfoInappRecord, InfoInappRecordBuilder> {
  static Serializer<InfoInappRecord> get serializer =>
      _$infoInappRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'post_info')
  String get postInfo;

  @nullable
  @BuiltValueField(wireName: 'post_rule')
  String get postRule;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InfoInappRecordBuilder builder) => builder
    ..postInfo = ''
    ..postRule = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('info_inapp');

  static Stream<InfoInappRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<InfoInappRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  InfoInappRecord._();
  factory InfoInappRecord([void Function(InfoInappRecordBuilder) updates]) =
      _$InfoInappRecord;

  static InfoInappRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createInfoInappRecordData({
  String postInfo,
  String postRule,
}) =>
    serializers.toFirestore(
        InfoInappRecord.serializer,
        InfoInappRecord((i) => i
          ..postInfo = postInfo
          ..postRule = postRule));
