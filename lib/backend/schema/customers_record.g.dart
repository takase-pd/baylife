// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomersRecord> _$customersRecordSerializer =
    new _$CustomersRecordSerializer();

class _$CustomersRecordSerializer
    implements StructuredSerializer<CustomersRecord> {
  @override
  final Iterable<Type> types = const [CustomersRecord, _$CustomersRecord];
  @override
  final String wireName = 'CustomersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CustomersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stripeId;
    if (value != null) {
      result
        ..add('stripeId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stripeLink;
    if (value != null) {
      result
        ..add('stripeLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  CustomersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stripeId':
          result.stripeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stripeLink':
          result.stripeLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$CustomersRecord extends CustomersRecord {
  @override
  final String email;
  @override
  final String stripeId;
  @override
  final String stripeLink;
  @override
  final DocumentReference<Object> reference;

  factory _$CustomersRecord([void Function(CustomersRecordBuilder) updates]) =>
      (new CustomersRecordBuilder()..update(updates)).build();

  _$CustomersRecord._(
      {this.email, this.stripeId, this.stripeLink, this.reference})
      : super._();

  @override
  CustomersRecord rebuild(void Function(CustomersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomersRecordBuilder toBuilder() =>
      new CustomersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomersRecord &&
        email == other.email &&
        stripeId == other.stripeId &&
        stripeLink == other.stripeLink &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, email.hashCode), stripeId.hashCode),
            stripeLink.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomersRecord')
          ..add('email', email)
          ..add('stripeId', stripeId)
          ..add('stripeLink', stripeLink)
          ..add('reference', reference))
        .toString();
  }
}

class CustomersRecordBuilder
    implements Builder<CustomersRecord, CustomersRecordBuilder> {
  _$CustomersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _stripeId;
  String get stripeId => _$this._stripeId;
  set stripeId(String stripeId) => _$this._stripeId = stripeId;

  String _stripeLink;
  String get stripeLink => _$this._stripeLink;
  set stripeLink(String stripeLink) => _$this._stripeLink = stripeLink;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CustomersRecordBuilder() {
    CustomersRecord._initializeBuilder(this);
  }

  CustomersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _stripeId = $v.stripeId;
      _stripeLink = $v.stripeLink;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomersRecord;
  }

  @override
  void update(void Function(CustomersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomersRecord build() {
    final _$result = _$v ??
        new _$CustomersRecord._(
            email: email,
            stripeId: stripeId,
            stripeLink: stripeLink,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
