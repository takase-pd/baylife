// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_dd_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CatDdRecord> _$catDdRecordSerializer = new _$CatDdRecordSerializer();

class _$CatDdRecordSerializer implements StructuredSerializer<CatDdRecord> {
  @override
  final Iterable<Type> types = const [CatDdRecord, _$CatDdRecord];
  @override
  final String wireName = 'CatDdRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CatDdRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.cats;
    if (value != null) {
      result
        ..add('cats')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  CatDdRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatDdRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'cats':
          result.cats.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$CatDdRecord extends CatDdRecord {
  @override
  final BuiltList<String> cats;
  @override
  final DocumentReference<Object> reference;

  factory _$CatDdRecord([void Function(CatDdRecordBuilder) updates]) =>
      (new CatDdRecordBuilder()..update(updates)).build();

  _$CatDdRecord._({this.cats, this.reference}) : super._();

  @override
  CatDdRecord rebuild(void Function(CatDdRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatDdRecordBuilder toBuilder() => new CatDdRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatDdRecord &&
        cats == other.cats &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, cats.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CatDdRecord')
          ..add('cats', cats)
          ..add('reference', reference))
        .toString();
  }
}

class CatDdRecordBuilder implements Builder<CatDdRecord, CatDdRecordBuilder> {
  _$CatDdRecord _$v;

  ListBuilder<String> _cats;
  ListBuilder<String> get cats => _$this._cats ??= new ListBuilder<String>();
  set cats(ListBuilder<String> cats) => _$this._cats = cats;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CatDdRecordBuilder() {
    CatDdRecord._initializeBuilder(this);
  }

  CatDdRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cats = $v.cats?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatDdRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CatDdRecord;
  }

  @override
  void update(void Function(CatDdRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CatDdRecord build() {
    _$CatDdRecord _$result;
    try {
      _$result = _$v ??
          new _$CatDdRecord._(cats: _cats?.build(), reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cats';
        _cats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CatDdRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
