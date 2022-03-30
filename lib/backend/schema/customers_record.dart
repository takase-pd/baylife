import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'customers_record.g.dart';

abstract class CustomersRecord
    implements Built<CustomersRecord, CustomersRecordBuilder> {
  static Serializer<CustomersRecord> get serializer =>
      _$customersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get stripeId;

  @nullable
  String get stripeLink;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CustomersRecordBuilder builder) => builder
    ..email = ''
    ..stripeId = ''
    ..stripeLink = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customers');

  static Stream<CustomersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CustomersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CustomersRecord._();
  factory CustomersRecord([void Function(CustomersRecordBuilder) updates]) =
      _$CustomersRecord;

  static CustomersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCustomersRecordData({
  String email,
  String stripeId,
  String stripeLink,
}) =>
    serializers.toFirestore(
        CustomersRecord.serializer,
        CustomersRecord((c) => c
          ..email = email
          ..stripeId = stripeId
          ..stripeLink = stripeLink));
