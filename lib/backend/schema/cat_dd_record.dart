import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cat_dd_record.g.dart';

abstract class CatDdRecord implements Built<CatDdRecord, CatDdRecordBuilder> {
  static Serializer<CatDdRecord> get serializer => _$catDdRecordSerializer;

  @nullable
  BuiltList<String> get cats;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CatDdRecordBuilder builder) =>
      builder..cats = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cat_dd');

  static Stream<CatDdRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CatDdRecord._();
  factory CatDdRecord([void Function(CatDdRecordBuilder) updates]) =
      _$CatDdRecord;

  static CatDdRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCatDdRecordData() => serializers.toFirestore(
    CatDdRecord.serializer, CatDdRecord((c) => c..cats = null));
