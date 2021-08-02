// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TermsRecord> _$termsRecordSerializer = new _$TermsRecordSerializer();

class _$TermsRecordSerializer implements StructuredSerializer<TermsRecord> {
  @override
  final Iterable<Type> types = const [TermsRecord, _$TermsRecord];
  @override
  final String wireName = 'TermsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TermsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.contents;
    if (value != null) {
      result
        ..add('contents')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  TermsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'contents':
          result.contents = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$TermsRecord extends TermsRecord {
  @override
  final String contents;
  @override
  final int number;
  @override
  final String title;
  @override
  final DocumentReference<Object> reference;

  factory _$TermsRecord([void Function(TermsRecordBuilder) updates]) =>
      (new TermsRecordBuilder()..update(updates)).build();

  _$TermsRecord._({this.contents, this.number, this.title, this.reference})
      : super._();

  @override
  TermsRecord rebuild(void Function(TermsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsRecordBuilder toBuilder() => new TermsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsRecord &&
        contents == other.contents &&
        number == other.number &&
        title == other.title &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, contents.hashCode), number.hashCode), title.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TermsRecord')
          ..add('contents', contents)
          ..add('number', number)
          ..add('title', title)
          ..add('reference', reference))
        .toString();
  }
}

class TermsRecordBuilder implements Builder<TermsRecord, TermsRecordBuilder> {
  _$TermsRecord _$v;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  int _number;
  int get number => _$this._number;
  set number(int number) => _$this._number = number;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TermsRecordBuilder() {
    TermsRecord._initializeBuilder(this);
  }

  TermsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contents = $v.contents;
      _number = $v.number;
      _title = $v.title;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TermsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsRecord;
  }

  @override
  void update(void Function(TermsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TermsRecord build() {
    final _$result = _$v ??
        new _$TermsRecord._(
            contents: contents,
            number: number,
            title: title,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
