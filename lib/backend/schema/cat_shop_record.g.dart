// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_shop_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CatShopRecord> _$catShopRecordSerializer =
    new _$CatShopRecordSerializer();

class _$CatShopRecordSerializer implements StructuredSerializer<CatShopRecord> {
  @override
  final Iterable<Type> types = const [CatShopRecord, _$CatShopRecord];
  @override
  final String wireName = 'CatShopRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CatShopRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.catName;
    if (value != null) {
      result
        ..add('cat_name')
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
  CatShopRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatShopRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'cat_name':
          result.catName = serializers.deserialize(value,
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

class _$CatShopRecord extends CatShopRecord {
  @override
  final String catName;
  @override
  final DocumentReference<Object> reference;

  factory _$CatShopRecord([void Function(CatShopRecordBuilder) updates]) =>
      (new CatShopRecordBuilder()..update(updates)).build();

  _$CatShopRecord._({this.catName, this.reference}) : super._();

  @override
  CatShopRecord rebuild(void Function(CatShopRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatShopRecordBuilder toBuilder() => new CatShopRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatShopRecord &&
        catName == other.catName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, catName.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CatShopRecord')
          ..add('catName', catName)
          ..add('reference', reference))
        .toString();
  }
}

class CatShopRecordBuilder
    implements Builder<CatShopRecord, CatShopRecordBuilder> {
  _$CatShopRecord _$v;

  String _catName;
  String get catName => _$this._catName;
  set catName(String catName) => _$this._catName = catName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CatShopRecordBuilder() {
    CatShopRecord._initializeBuilder(this);
  }

  CatShopRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _catName = $v.catName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatShopRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CatShopRecord;
  }

  @override
  void update(void Function(CatShopRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CatShopRecord build() {
    final _$result =
        _$v ?? new _$CatShopRecord._(catName: catName, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
