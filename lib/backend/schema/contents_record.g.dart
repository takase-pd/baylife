// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContentsRecord> _$contentsRecordSerializer =
    new _$ContentsRecordSerializer();

class _$ContentsRecordSerializer
    implements StructuredSerializer<ContentsRecord> {
  @override
  final Iterable<Type> types = const [ContentsRecord, _$ContentsRecord];
  @override
  final String wireName = 'ContentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ContentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headerText;
    if (value != null) {
      result
        ..add('header_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.infoText;
    if (value != null) {
      result
        ..add('info_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.period;
    if (value != null) {
      result
        ..add('period')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.posted;
    if (value != null) {
      result
        ..add('posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.display;
    if (value != null) {
      result
        ..add('display')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
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
  ContentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'header_text':
          result.headerText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'info_text':
          result.infoText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'period':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'posted':
          result.posted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'display':
          result.display = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
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

class _$ContentsRecord extends ContentsRecord {
  @override
  final String title;
  @override
  final String headerText;
  @override
  final String infoText;
  @override
  final String sender;
  @override
  final DateTime period;
  @override
  final DateTime posted;
  @override
  final bool display;
  @override
  final DocumentReference category;
  @override
  final DocumentReference reference;

  factory _$ContentsRecord([void Function(ContentsRecordBuilder) updates]) =>
      (new ContentsRecordBuilder()..update(updates)).build();

  _$ContentsRecord._(
      {this.title,
      this.headerText,
      this.infoText,
      this.sender,
      this.period,
      this.posted,
      this.display,
      this.category,
      this.reference})
      : super._();

  @override
  ContentsRecord rebuild(void Function(ContentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentsRecordBuilder toBuilder() =>
      new ContentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentsRecord &&
        title == other.title &&
        headerText == other.headerText &&
        infoText == other.infoText &&
        sender == other.sender &&
        period == other.period &&
        posted == other.posted &&
        display == other.display &&
        category == other.category &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, title.hashCode),
                                    headerText.hashCode),
                                infoText.hashCode),
                            sender.hashCode),
                        period.hashCode),
                    posted.hashCode),
                display.hashCode),
            category.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentsRecord')
          ..add('title', title)
          ..add('headerText', headerText)
          ..add('infoText', infoText)
          ..add('sender', sender)
          ..add('period', period)
          ..add('posted', posted)
          ..add('display', display)
          ..add('category', category)
          ..add('reference', reference))
        .toString();
  }
}

class ContentsRecordBuilder
    implements Builder<ContentsRecord, ContentsRecordBuilder> {
  _$ContentsRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _headerText;
  String get headerText => _$this._headerText;
  set headerText(String headerText) => _$this._headerText = headerText;

  String _infoText;
  String get infoText => _$this._infoText;
  set infoText(String infoText) => _$this._infoText = infoText;

  String _sender;
  String get sender => _$this._sender;
  set sender(String sender) => _$this._sender = sender;

  DateTime _period;
  DateTime get period => _$this._period;
  set period(DateTime period) => _$this._period = period;

  DateTime _posted;
  DateTime get posted => _$this._posted;
  set posted(DateTime posted) => _$this._posted = posted;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  DocumentReference _category;
  DocumentReference get category => _$this._category;
  set category(DocumentReference category) => _$this._category = category;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  ContentsRecordBuilder() {
    ContentsRecord._initializeBuilder(this);
  }

  ContentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _headerText = $v.headerText;
      _infoText = $v.infoText;
      _sender = $v.sender;
      _period = $v.period;
      _posted = $v.posted;
      _display = $v.display;
      _category = $v.category;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContentsRecord;
  }

  @override
  void update(void Function(ContentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContentsRecord build() {
    final _$result = _$v ??
        new _$ContentsRecord._(
            title: title,
            headerText: headerText,
            infoText: infoText,
            sender: sender,
            period: period,
            posted: posted,
            display: display,
            category: category,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
