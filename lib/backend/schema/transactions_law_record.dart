import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_law_record.g.dart';

abstract class TransactionsLawRecord
    implements Built<TransactionsLawRecord, TransactionsLawRecordBuilder> {
  static Serializer<TransactionsLawRecord> get serializer =>
      _$transactionsLawRecordSerializer;

  @nullable
  String get director;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(TransactionsLawRecordBuilder builder) =>
      builder..director = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('transactions_law')
          : FirebaseFirestore.instance.collectionGroup('transactions_law');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('transactions_law').doc();

  static Stream<TransactionsLawRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransactionsLawRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionsLawRecord._();
  factory TransactionsLawRecord(
          [void Function(TransactionsLawRecordBuilder) updates]) =
      _$TransactionsLawRecord;

  static TransactionsLawRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionsLawRecordData({
  String director,
}) =>
    serializers.toFirestore(TransactionsLawRecord.serializer,
        TransactionsLawRecord((t) => t..director = director));
