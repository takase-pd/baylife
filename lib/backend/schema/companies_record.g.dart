// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompaniesRecord> _$companiesRecordSerializer =
    new _$CompaniesRecordSerializer();

class _$CompaniesRecordSerializer
    implements StructuredSerializer<CompaniesRecord> {
  @override
  final Iterable<Type> types = const [CompaniesRecord, _$CompaniesRecord];
  @override
  final String wireName = 'CompaniesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CompaniesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.web;
    if (value != null) {
      result
        ..add('web')
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
  CompaniesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompaniesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'web':
          result.web = serializers.deserialize(value,
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

class _$CompaniesRecord extends CompaniesRecord {
  @override
  final String name;
  @override
  final String web;
  @override
  final DocumentReference<Object> reference;

  factory _$CompaniesRecord([void Function(CompaniesRecordBuilder) updates]) =>
      (new CompaniesRecordBuilder()..update(updates)).build();

  _$CompaniesRecord._({this.name, this.web, this.reference}) : super._();

  @override
  CompaniesRecord rebuild(void Function(CompaniesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompaniesRecordBuilder toBuilder() =>
      new CompaniesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompaniesRecord &&
        name == other.name &&
        web == other.web &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), web.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompaniesRecord')
          ..add('name', name)
          ..add('web', web)
          ..add('reference', reference))
        .toString();
  }
}

class CompaniesRecordBuilder
    implements Builder<CompaniesRecord, CompaniesRecordBuilder> {
  _$CompaniesRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _web;
  String get web => _$this._web;
  set web(String web) => _$this._web = web;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CompaniesRecordBuilder() {
    CompaniesRecord._initializeBuilder(this);
  }

  CompaniesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _web = $v.web;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompaniesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompaniesRecord;
  }

  @override
  void update(void Function(CompaniesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompaniesRecord build() {
    final _$result = _$v ??
        new _$CompaniesRecord._(name: name, web: web, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
