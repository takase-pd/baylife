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
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.catAdd;
    if (value != null) {
      result
        ..add('cat_add')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contact;
    if (value != null) {
      result
        ..add('contact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homepage;
    if (value != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organizer;
    if (value != null) {
      result
        ..add('organizer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.permission;
    if (value != null) {
      result
        ..add('permission')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.postName;
    if (value != null) {
      result
        ..add('post_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postEmail;
    if (value != null) {
      result
        ..add('post_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postPhone;
    if (value != null) {
      result
        ..add('post_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postOccupation;
    if (value != null) {
      result
        ..add('post_occupation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bccUids;
    if (value != null) {
      result
        ..add('bccUids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDay;
    if (value != null) {
      result
        ..add('start_day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.finalDay;
    if (value != null) {
      result
        ..add('final_day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.filePath;
    if (value != null) {
      result
        ..add('file_path')
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
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'cat_add':
          result.catAdd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact':
          result.contact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organizer':
          result.organizer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'permission':
          result.permission = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'post_name':
          result.postName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_email':
          result.postEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_phone':
          result.postPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_occupation':
          result.postOccupation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bccUids':
          result.bccUids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'start_day':
          result.startDay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'final_day':
          result.finalDay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'file_path':
          result.filePath = serializers.deserialize(value,
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

class _$ContentsRecord extends ContentsRecord {
  @override
  final String title;
  @override
  final DateTime posted;
  @override
  final bool display;
  @override
  final DocumentReference<Object> category;
  @override
  final String catAdd;
  @override
  final String contact;
  @override
  final String detail;
  @override
  final String homepage;
  @override
  final String organizer;
  @override
  final String overview;
  @override
  final bool permission;
  @override
  final String postName;
  @override
  final String postEmail;
  @override
  final String postPhone;
  @override
  final String postOccupation;
  @override
  final String to;
  @override
  final BuiltList<String> bccUids;
  @override
  final String address;
  @override
  final DateTime startDay;
  @override
  final DateTime finalDay;
  @override
  final String filePath;
  @override
  final DocumentReference<Object> reference;

  factory _$ContentsRecord([void Function(ContentsRecordBuilder) updates]) =>
      (new ContentsRecordBuilder()..update(updates)).build();

  _$ContentsRecord._(
      {this.title,
      this.posted,
      this.display,
      this.category,
      this.catAdd,
      this.contact,
      this.detail,
      this.homepage,
      this.organizer,
      this.overview,
      this.permission,
      this.postName,
      this.postEmail,
      this.postPhone,
      this.postOccupation,
      this.to,
      this.bccUids,
      this.address,
      this.startDay,
      this.finalDay,
      this.filePath,
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
        posted == other.posted &&
        display == other.display &&
        category == other.category &&
        catAdd == other.catAdd &&
        contact == other.contact &&
        detail == other.detail &&
        homepage == other.homepage &&
        organizer == other.organizer &&
        overview == other.overview &&
        permission == other.permission &&
        postName == other.postName &&
        postEmail == other.postEmail &&
        postPhone == other.postPhone &&
        postOccupation == other.postOccupation &&
        to == other.to &&
        bccUids == other.bccUids &&
        address == other.address &&
        startDay == other.startDay &&
        finalDay == other.finalDay &&
        filePath == other.filePath &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, title.hashCode), posted.hashCode), display.hashCode),
                                                                                category.hashCode),
                                                                            catAdd.hashCode),
                                                                        contact.hashCode),
                                                                    detail.hashCode),
                                                                homepage.hashCode),
                                                            organizer.hashCode),
                                                        overview.hashCode),
                                                    permission.hashCode),
                                                postName.hashCode),
                                            postEmail.hashCode),
                                        postPhone.hashCode),
                                    postOccupation.hashCode),
                                to.hashCode),
                            bccUids.hashCode),
                        address.hashCode),
                    startDay.hashCode),
                finalDay.hashCode),
            filePath.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentsRecord')
          ..add('title', title)
          ..add('posted', posted)
          ..add('display', display)
          ..add('category', category)
          ..add('catAdd', catAdd)
          ..add('contact', contact)
          ..add('detail', detail)
          ..add('homepage', homepage)
          ..add('organizer', organizer)
          ..add('overview', overview)
          ..add('permission', permission)
          ..add('postName', postName)
          ..add('postEmail', postEmail)
          ..add('postPhone', postPhone)
          ..add('postOccupation', postOccupation)
          ..add('to', to)
          ..add('bccUids', bccUids)
          ..add('address', address)
          ..add('startDay', startDay)
          ..add('finalDay', finalDay)
          ..add('filePath', filePath)
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

  DateTime _posted;
  DateTime get posted => _$this._posted;
  set posted(DateTime posted) => _$this._posted = posted;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  DocumentReference<Object> _category;
  DocumentReference<Object> get category => _$this._category;
  set category(DocumentReference<Object> category) =>
      _$this._category = category;

  String _catAdd;
  String get catAdd => _$this._catAdd;
  set catAdd(String catAdd) => _$this._catAdd = catAdd;

  String _contact;
  String get contact => _$this._contact;
  set contact(String contact) => _$this._contact = contact;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  String _organizer;
  String get organizer => _$this._organizer;
  set organizer(String organizer) => _$this._organizer = organizer;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  bool _permission;
  bool get permission => _$this._permission;
  set permission(bool permission) => _$this._permission = permission;

  String _postName;
  String get postName => _$this._postName;
  set postName(String postName) => _$this._postName = postName;

  String _postEmail;
  String get postEmail => _$this._postEmail;
  set postEmail(String postEmail) => _$this._postEmail = postEmail;

  String _postPhone;
  String get postPhone => _$this._postPhone;
  set postPhone(String postPhone) => _$this._postPhone = postPhone;

  String _postOccupation;
  String get postOccupation => _$this._postOccupation;
  set postOccupation(String postOccupation) =>
      _$this._postOccupation = postOccupation;

  String _to;
  String get to => _$this._to;
  set to(String to) => _$this._to = to;

  ListBuilder<String> _bccUids;
  ListBuilder<String> get bccUids =>
      _$this._bccUids ??= new ListBuilder<String>();
  set bccUids(ListBuilder<String> bccUids) => _$this._bccUids = bccUids;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  DateTime _startDay;
  DateTime get startDay => _$this._startDay;
  set startDay(DateTime startDay) => _$this._startDay = startDay;

  DateTime _finalDay;
  DateTime get finalDay => _$this._finalDay;
  set finalDay(DateTime finalDay) => _$this._finalDay = finalDay;

  String _filePath;
  String get filePath => _$this._filePath;
  set filePath(String filePath) => _$this._filePath = filePath;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ContentsRecordBuilder() {
    ContentsRecord._initializeBuilder(this);
  }

  ContentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _posted = $v.posted;
      _display = $v.display;
      _category = $v.category;
      _catAdd = $v.catAdd;
      _contact = $v.contact;
      _detail = $v.detail;
      _homepage = $v.homepage;
      _organizer = $v.organizer;
      _overview = $v.overview;
      _permission = $v.permission;
      _postName = $v.postName;
      _postEmail = $v.postEmail;
      _postPhone = $v.postPhone;
      _postOccupation = $v.postOccupation;
      _to = $v.to;
      _bccUids = $v.bccUids?.toBuilder();
      _address = $v.address;
      _startDay = $v.startDay;
      _finalDay = $v.finalDay;
      _filePath = $v.filePath;
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
    _$ContentsRecord _$result;
    try {
      _$result = _$v ??
          new _$ContentsRecord._(
              title: title,
              posted: posted,
              display: display,
              category: category,
              catAdd: catAdd,
              contact: contact,
              detail: detail,
              homepage: homepage,
              organizer: organizer,
              overview: overview,
              permission: permission,
              postName: postName,
              postEmail: postEmail,
              postPhone: postPhone,
              postOccupation: postOccupation,
              to: to,
              bccUids: _bccUids?.build(),
              address: address,
              startDay: startDay,
              finalDay: finalDay,
              filePath: filePath,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bccUids';
        _bccUids?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContentsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
