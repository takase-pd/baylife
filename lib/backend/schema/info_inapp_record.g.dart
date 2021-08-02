// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_inapp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InfoInappRecord> _$infoInappRecordSerializer =
    new _$InfoInappRecordSerializer();

class _$InfoInappRecordSerializer
    implements StructuredSerializer<InfoInappRecord> {
  @override
  final Iterable<Type> types = const [InfoInappRecord, _$InfoInappRecord];
  @override
  final String wireName = 'InfoInappRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, InfoInappRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.postInfo;
    if (value != null) {
      result
        ..add('post_info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  InfoInappRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InfoInappRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'post_info':
          result.postInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$InfoInappRecord extends InfoInappRecord {
  @override
  final String postInfo;
  @override
  final DocumentReference reference;

  factory _$InfoInappRecord([void Function(InfoInappRecordBuilder) updates]) =>
      (new InfoInappRecordBuilder()..update(updates)).build();

  _$InfoInappRecord._({this.postInfo, this.reference}) : super._();

  @override
  InfoInappRecord rebuild(void Function(InfoInappRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InfoInappRecordBuilder toBuilder() =>
      new InfoInappRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InfoInappRecord &&
        postInfo == other.postInfo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, postInfo.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InfoInappRecord')
          ..add('postInfo', postInfo)
          ..add('reference', reference))
        .toString();
  }
}

class InfoInappRecordBuilder
    implements Builder<InfoInappRecord, InfoInappRecordBuilder> {
  _$InfoInappRecord _$v;

  String _postInfo;
  String get postInfo => _$this._postInfo;
  set postInfo(String postInfo) => _$this._postInfo = postInfo;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  InfoInappRecordBuilder() {
    InfoInappRecord._initializeBuilder(this);
  }

  InfoInappRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postInfo = $v.postInfo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InfoInappRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InfoInappRecord;
  }

  @override
  void update(void Function(InfoInappRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InfoInappRecord build() {
    final _$result = _$v ??
        new _$InfoInappRecord._(postInfo: postInfo, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
