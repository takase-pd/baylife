// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlansRecord> _$plansRecordSerializer = new _$PlansRecordSerializer();

class _$PlansRecordSerializer implements StructuredSerializer<PlansRecord> {
  @override
  final Iterable<Type> types = const [PlansRecord, _$PlansRecord];
  @override
  final String wireName = 'PlansRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PlansRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shop;
    if (value != null) {
      result
        ..add('shop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.unitAmount;
    if (value != null) {
      result
        ..add('unit_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.activeQuick;
    if (value != null) {
      result
        ..add('active_quick')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingNormal;
    if (value != null) {
      result
        ..add('shipping_normal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingQuick;
    if (value != null) {
      result
        ..add('shipping_quick')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingFeeNormal;
    if (value != null) {
      result
        ..add('shipping_fee_normal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.published;
    if (value != null) {
      result
        ..add('published')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.quantityMax;
    if (value != null) {
      result
        ..add('quantity_max')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  PlansRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlansRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shop':
          result.shop = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'unit_amount':
          result.unitAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'active_quick':
          result.activeQuick = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_normal':
          result.shippingNormal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_quick':
          result.shippingQuick = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_fee_normal':
          result.shippingFeeNormal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'published':
          result.published = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'quantity_max':
          result.quantityMax = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$PlansRecord extends PlansRecord {
  @override
  final bool active;
  @override
  final String name;
  @override
  final DocumentReference<Object> shop;
  @override
  final int unitAmount;
  @override
  final String description;
  @override
  final bool activeQuick;
  @override
  final String banner;
  @override
  final String shippingNormal;
  @override
  final String shippingQuick;
  @override
  final int shippingFeeNormal;
  @override
  final DateTime published;
  @override
  final int quantityMax;
  @override
  final DocumentReference<Object> reference;

  factory _$PlansRecord([void Function(PlansRecordBuilder) updates]) =>
      (new PlansRecordBuilder()..update(updates)).build();

  _$PlansRecord._(
      {this.active,
      this.name,
      this.shop,
      this.unitAmount,
      this.description,
      this.activeQuick,
      this.banner,
      this.shippingNormal,
      this.shippingQuick,
      this.shippingFeeNormal,
      this.published,
      this.quantityMax,
      this.reference})
      : super._();

  @override
  PlansRecord rebuild(void Function(PlansRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlansRecordBuilder toBuilder() => new PlansRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlansRecord &&
        active == other.active &&
        name == other.name &&
        shop == other.shop &&
        unitAmount == other.unitAmount &&
        description == other.description &&
        activeQuick == other.activeQuick &&
        banner == other.banner &&
        shippingNormal == other.shippingNormal &&
        shippingQuick == other.shippingQuick &&
        shippingFeeNormal == other.shippingFeeNormal &&
        published == other.published &&
        quantityMax == other.quantityMax &&
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
                                                $jc($jc(0, active.hashCode),
                                                    name.hashCode),
                                                shop.hashCode),
                                            unitAmount.hashCode),
                                        description.hashCode),
                                    activeQuick.hashCode),
                                banner.hashCode),
                            shippingNormal.hashCode),
                        shippingQuick.hashCode),
                    shippingFeeNormal.hashCode),
                published.hashCode),
            quantityMax.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlansRecord')
          ..add('active', active)
          ..add('name', name)
          ..add('shop', shop)
          ..add('unitAmount', unitAmount)
          ..add('description', description)
          ..add('activeQuick', activeQuick)
          ..add('banner', banner)
          ..add('shippingNormal', shippingNormal)
          ..add('shippingQuick', shippingQuick)
          ..add('shippingFeeNormal', shippingFeeNormal)
          ..add('published', published)
          ..add('quantityMax', quantityMax)
          ..add('reference', reference))
        .toString();
  }
}

class PlansRecordBuilder implements Builder<PlansRecord, PlansRecordBuilder> {
  _$PlansRecord _$v;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DocumentReference<Object> _shop;
  DocumentReference<Object> get shop => _$this._shop;
  set shop(DocumentReference<Object> shop) => _$this._shop = shop;

  int _unitAmount;
  int get unitAmount => _$this._unitAmount;
  set unitAmount(int unitAmount) => _$this._unitAmount = unitAmount;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _activeQuick;
  bool get activeQuick => _$this._activeQuick;
  set activeQuick(bool activeQuick) => _$this._activeQuick = activeQuick;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  String _shippingNormal;
  String get shippingNormal => _$this._shippingNormal;
  set shippingNormal(String shippingNormal) =>
      _$this._shippingNormal = shippingNormal;

  String _shippingQuick;
  String get shippingQuick => _$this._shippingQuick;
  set shippingQuick(String shippingQuick) =>
      _$this._shippingQuick = shippingQuick;

  int _shippingFeeNormal;
  int get shippingFeeNormal => _$this._shippingFeeNormal;
  set shippingFeeNormal(int shippingFeeNormal) =>
      _$this._shippingFeeNormal = shippingFeeNormal;

  DateTime _published;
  DateTime get published => _$this._published;
  set published(DateTime published) => _$this._published = published;

  int _quantityMax;
  int get quantityMax => _$this._quantityMax;
  set quantityMax(int quantityMax) => _$this._quantityMax = quantityMax;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PlansRecordBuilder() {
    PlansRecord._initializeBuilder(this);
  }

  PlansRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _active = $v.active;
      _name = $v.name;
      _shop = $v.shop;
      _unitAmount = $v.unitAmount;
      _description = $v.description;
      _activeQuick = $v.activeQuick;
      _banner = $v.banner;
      _shippingNormal = $v.shippingNormal;
      _shippingQuick = $v.shippingQuick;
      _shippingFeeNormal = $v.shippingFeeNormal;
      _published = $v.published;
      _quantityMax = $v.quantityMax;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlansRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlansRecord;
  }

  @override
  void update(void Function(PlansRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlansRecord build() {
    final _$result = _$v ??
        new _$PlansRecord._(
            active: active,
            name: name,
            shop: shop,
            unitAmount: unitAmount,
            description: description,
            activeQuick: activeQuick,
            banner: banner,
            shippingNormal: shippingNormal,
            shippingQuick: shippingQuick,
            shippingFeeNormal: shippingFeeNormal,
            published: published,
            quantityMax: quantityMax,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
