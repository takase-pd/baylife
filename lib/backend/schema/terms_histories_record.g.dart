// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_histories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TermsHistoriesRecord> _$termsHistoriesRecordSerializer =
    new _$TermsHistoriesRecordSerializer();

class _$TermsHistoriesRecordSerializer
    implements StructuredSerializer<TermsHistoriesRecord> {
  @override
  final Iterable<Type> types = const [
    TermsHistoriesRecord,
    _$TermsHistoriesRecord
  ];
  @override
  final String wireName = 'TermsHistoriesRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TermsHistoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
  TermsHistoriesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsHistoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
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

class _$TermsHistoriesRecord extends TermsHistoriesRecord {
  @override
  final DateTime date;
  @override
  final String title;
  @override
  final DocumentReference<Object> reference;

  factory _$TermsHistoriesRecord(
          [void Function(TermsHistoriesRecordBuilder) updates]) =>
      (new TermsHistoriesRecordBuilder()..update(updates)).build();

  _$TermsHistoriesRecord._({this.date, this.title, this.reference}) : super._();

  @override
  TermsHistoriesRecord rebuild(
          void Function(TermsHistoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsHistoriesRecordBuilder toBuilder() =>
      new TermsHistoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsHistoriesRecord &&
        date == other.date &&
        title == other.title &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, date.hashCode), title.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TermsHistoriesRecord')
          ..add('date', date)
          ..add('title', title)
          ..add('reference', reference))
        .toString();
  }
}

class TermsHistoriesRecordBuilder
    implements Builder<TermsHistoriesRecord, TermsHistoriesRecordBuilder> {
  _$TermsHistoriesRecord _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TermsHistoriesRecordBuilder() {
    TermsHistoriesRecord._initializeBuilder(this);
  }

  TermsHistoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _title = $v.title;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TermsHistoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsHistoriesRecord;
  }

  @override
  void update(void Function(TermsHistoriesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TermsHistoriesRecord build() {
    final _$result = _$v ??
        new _$TermsHistoriesRecord._(
            date: date, title: title, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
