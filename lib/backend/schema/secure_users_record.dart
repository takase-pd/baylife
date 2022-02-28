import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'secure_users_record.g.dart';

abstract class SecureUsersRecord
    implements Built<SecureUsersRecord, SecureUsersRecordBuilder> {
  static Serializer<SecureUsersRecord> get serializer =>
      _$secureUsersRecordSerializer;

  @nullable
  String get area;

  @nullable
  String get sex;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SecureUsersRecordBuilder builder) => builder
    ..area = ''
    ..sex = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('secure_users');

  static Stream<SecureUsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SecureUsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SecureUsersRecord._();
  factory SecureUsersRecord([void Function(SecureUsersRecordBuilder) updates]) =
      _$SecureUsersRecord;

  static SecureUsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSecureUsersRecordData({
  String area,
  String sex,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        SecureUsersRecord.serializer,
        SecureUsersRecord((s) => s
          ..area = area
          ..sex = sex
          ..user = user));
