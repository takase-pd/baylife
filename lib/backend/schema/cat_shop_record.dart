import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cat_shop_record.g.dart';

abstract class CatShopRecord
    implements Built<CatShopRecord, CatShopRecordBuilder> {
  static Serializer<CatShopRecord> get serializer => _$catShopRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'cat_name')
  String get catName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CatShopRecordBuilder builder) =>
      builder..catName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cat_shop');

  static Stream<CatShopRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CatShopRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CatShopRecord._();
  factory CatShopRecord([void Function(CatShopRecordBuilder) updates]) =
      _$CatShopRecord;

  static CatShopRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCatShopRecordData({
  String catName,
}) =>
    serializers.toFirestore(
        CatShopRecord.serializer, CatShopRecord((c) => c..catName = catName));
