// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlertRecord> _$alertRecordSerializer = new _$AlertRecordSerializer();

class _$AlertRecordSerializer implements StructuredSerializer<AlertRecord> {
  @override
  final Iterable<Type> types = const [AlertRecord, _$AlertRecord];
  @override
  final String wireName = 'AlertRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AlertRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.alertedBy;
    if (value != null) {
      result
        ..add('alerted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postedBy;
    if (value != null) {
      result
        ..add('posted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.sid;
    if (value != null) {
      result
        ..add('sid')
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
  AlertRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlertRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'alerted_by':
          result.alertedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'posted_by':
          result.postedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'sid':
          result.sid = serializers.deserialize(value,
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

class _$AlertRecord extends AlertRecord {
  @override
  final String alertedBy;
  @override
  final String postedBy;
  @override
  final DateTime date;
  @override
  final String sid;
  @override
  final DocumentReference<Object> reference;

  factory _$AlertRecord([void Function(AlertRecordBuilder) updates]) =>
      (new AlertRecordBuilder()..update(updates)).build();

  _$AlertRecord._(
      {this.alertedBy, this.postedBy, this.date, this.sid, this.reference})
      : super._();

  @override
  AlertRecord rebuild(void Function(AlertRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlertRecordBuilder toBuilder() => new AlertRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlertRecord &&
        alertedBy == other.alertedBy &&
        postedBy == other.postedBy &&
        date == other.date &&
        sid == other.sid &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, alertedBy.hashCode), postedBy.hashCode),
                date.hashCode),
            sid.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AlertRecord')
          ..add('alertedBy', alertedBy)
          ..add('postedBy', postedBy)
          ..add('date', date)
          ..add('sid', sid)
          ..add('reference', reference))
        .toString();
  }
}

class AlertRecordBuilder implements Builder<AlertRecord, AlertRecordBuilder> {
  _$AlertRecord _$v;

  String _alertedBy;
  String get alertedBy => _$this._alertedBy;
  set alertedBy(String alertedBy) => _$this._alertedBy = alertedBy;

  String _postedBy;
  String get postedBy => _$this._postedBy;
  set postedBy(String postedBy) => _$this._postedBy = postedBy;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  String _sid;
  String get sid => _$this._sid;
  set sid(String sid) => _$this._sid = sid;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AlertRecordBuilder() {
    AlertRecord._initializeBuilder(this);
  }

  AlertRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _alertedBy = $v.alertedBy;
      _postedBy = $v.postedBy;
      _date = $v.date;
      _sid = $v.sid;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlertRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlertRecord;
  }

  @override
  void update(void Function(AlertRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AlertRecord build() {
    final _$result = _$v ??
        new _$AlertRecord._(
            alertedBy: alertedBy,
            postedBy: postedBy,
            date: date,
            sid: sid,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
