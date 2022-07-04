// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logoname_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LogonameRecord> _$logonameRecordSerializer =
    new _$LogonameRecordSerializer();

class _$LogonameRecordSerializer
    implements StructuredSerializer<LogonameRecord> {
  @override
  final Iterable<Type> types = const [LogonameRecord, _$LogonameRecord];
  @override
  final String wireName = 'LogonameRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, LogonameRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.second;
    if (value != null) {
      result
        ..add('second')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
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
  LogonameRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LogonameRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'second':
          result.second = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
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

class _$LogonameRecord extends LogonameRecord {
  @override
  final String first;
  @override
  final String second;
  @override
  final String version;
  @override
  final DocumentReference<Object> reference;

  factory _$LogonameRecord([void Function(LogonameRecordBuilder) updates]) =>
      (new LogonameRecordBuilder()..update(updates)).build();

  _$LogonameRecord._({this.first, this.second, this.version, this.reference})
      : super._();

  @override
  LogonameRecord rebuild(void Function(LogonameRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogonameRecordBuilder toBuilder() =>
      new LogonameRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogonameRecord &&
        first == other.first &&
        second == other.second &&
        version == other.version &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, first.hashCode), second.hashCode), version.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LogonameRecord')
          ..add('first', first)
          ..add('second', second)
          ..add('version', version)
          ..add('reference', reference))
        .toString();
  }
}

class LogonameRecordBuilder
    implements Builder<LogonameRecord, LogonameRecordBuilder> {
  _$LogonameRecord _$v;

  String _first;
  String get first => _$this._first;
  set first(String first) => _$this._first = first;

  String _second;
  String get second => _$this._second;
  set second(String second) => _$this._second = second;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  LogonameRecordBuilder() {
    LogonameRecord._initializeBuilder(this);
  }

  LogonameRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _second = $v.second;
      _version = $v.version;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogonameRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogonameRecord;
  }

  @override
  void update(void Function(LogonameRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogonameRecord build() {
    final _$result = _$v ??
        new _$LogonameRecord._(
            first: first,
            second: second,
            version: version,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
