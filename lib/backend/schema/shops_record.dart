import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shops_record.g.dart';

abstract class ShopsRecord implements Built<ShopsRecord, ShopsRecordBuilder> {
  static Serializer<ShopsRecord> get serializer => _$shopsRecordSerializer;

  @nullable
  DocumentReference get company;

  @nullable
  String get description;

  @nullable
  String get email;

  @nullable
  String get instagram;

  @nullable
  String get phone;

  @nullable
  String get twitter;

  @nullable
  String get web;

  @nullable
  @BuiltValueField(wireName: 'cat_main')
  DocumentReference get catMain;

  @nullable
  @BuiltValueField(wireName: 'shop_name')
  String get shopName;

  @nullable
  bool get display;

  @nullable
  String get banner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ShopsRecordBuilder builder) => builder
    ..description = ''
    ..email = ''
    ..instagram = ''
    ..phone = ''
    ..twitter = ''
    ..web = ''
    ..shopName = ''
    ..display = false
    ..banner = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shops');

  static Stream<ShopsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ShopsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ShopsRecord._();
  factory ShopsRecord([void Function(ShopsRecordBuilder) updates]) =
      _$ShopsRecord;

  static ShopsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createShopsRecordData({
  DocumentReference company,
  String description,
  String email,
  String instagram,
  String phone,
  String twitter,
  String web,
  DocumentReference catMain,
  String shopName,
  bool display,
  String banner,
}) =>
    serializers.toFirestore(
        ShopsRecord.serializer,
        ShopsRecord((s) => s
          ..company = company
          ..description = description
          ..email = email
          ..instagram = instagram
          ..phone = phone
          ..twitter = twitter
          ..web = web
          ..catMain = catMain
          ..shopName = shopName
          ..display = display
          ..banner = banner));
