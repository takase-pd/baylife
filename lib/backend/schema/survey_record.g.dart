// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SurveyRecord> _$surveyRecordSerializer =
    new _$SurveyRecordSerializer();

class _$SurveyRecordSerializer implements StructuredSerializer<SurveyRecord> {
  @override
  final Iterable<Type> types = const [SurveyRecord, _$SurveyRecord];
  @override
  final String wireName = 'SurveyRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SurveyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.choices;
    if (value != null) {
      result
        ..add('choices')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('startDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('endDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.results;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.sid;
    if (value != null) {
      result
        ..add('sid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.display;
    if (value != null) {
      result
        ..add('display')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.open;
    if (value != null) {
      result
        ..add('open')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.explanation;
    if (value != null) {
      result
        ..add('explanation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.textFa;
    if (value != null) {
      result
        ..add('textFa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  SurveyRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurveyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'choices':
          result.choices.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList<Object>);
          break;
        case 'sid':
          result.sid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display':
          result.display = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'open':
          result.open = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'explanation':
          result.explanation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'textFa':
          result.textFa = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$SurveyRecord extends SurveyRecord {
  @override
  final int id;
  @override
  final String question;
  @override
  final BuiltList<String> choices;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final BuiltList<double> results;
  @override
  final String sid;
  @override
  final String comment;
  @override
  final bool display;
  @override
  final bool open;
  @override
  final String explanation;
  @override
  final int count;
  @override
  final String textFa;
  @override
  final bool review;
  @override
  final DocumentReference<Object> reference;

  factory _$SurveyRecord([void Function(SurveyRecordBuilder) updates]) =>
      (new SurveyRecordBuilder()..update(updates)).build();

  _$SurveyRecord._(
      {this.id,
      this.question,
      this.choices,
      this.startDate,
      this.endDate,
      this.results,
      this.sid,
      this.comment,
      this.display,
      this.open,
      this.explanation,
      this.count,
      this.textFa,
      this.review,
      this.reference})
      : super._();

  @override
  SurveyRecord rebuild(void Function(SurveyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurveyRecordBuilder toBuilder() => new SurveyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurveyRecord &&
        id == other.id &&
        question == other.question &&
        choices == other.choices &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        results == other.results &&
        sid == other.sid &&
        comment == other.comment &&
        display == other.display &&
        open == other.open &&
        explanation == other.explanation &&
        count == other.count &&
        textFa == other.textFa &&
        review == other.review &&
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
                                                        $jc($jc(0, id.hashCode),
                                                            question.hashCode),
                                                        choices.hashCode),
                                                    startDate.hashCode),
                                                endDate.hashCode),
                                            results.hashCode),
                                        sid.hashCode),
                                    comment.hashCode),
                                display.hashCode),
                            open.hashCode),
                        explanation.hashCode),
                    count.hashCode),
                textFa.hashCode),
            review.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SurveyRecord')
          ..add('id', id)
          ..add('question', question)
          ..add('choices', choices)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('results', results)
          ..add('sid', sid)
          ..add('comment', comment)
          ..add('display', display)
          ..add('open', open)
          ..add('explanation', explanation)
          ..add('count', count)
          ..add('textFa', textFa)
          ..add('review', review)
          ..add('reference', reference))
        .toString();
  }
}

class SurveyRecordBuilder
    implements Builder<SurveyRecord, SurveyRecordBuilder> {
  _$SurveyRecord _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  ListBuilder<String> _choices;
  ListBuilder<String> get choices =>
      _$this._choices ??= new ListBuilder<String>();
  set choices(ListBuilder<String> choices) => _$this._choices = choices;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  ListBuilder<double> _results;
  ListBuilder<double> get results =>
      _$this._results ??= new ListBuilder<double>();
  set results(ListBuilder<double> results) => _$this._results = results;

  String _sid;
  String get sid => _$this._sid;
  set sid(String sid) => _$this._sid = sid;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  bool _open;
  bool get open => _$this._open;
  set open(bool open) => _$this._open = open;

  String _explanation;
  String get explanation => _$this._explanation;
  set explanation(String explanation) => _$this._explanation = explanation;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  String _textFa;
  String get textFa => _$this._textFa;
  set textFa(String textFa) => _$this._textFa = textFa;

  bool _review;
  bool get review => _$this._review;
  set review(bool review) => _$this._review = review;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SurveyRecordBuilder() {
    SurveyRecord._initializeBuilder(this);
  }

  SurveyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _question = $v.question;
      _choices = $v.choices?.toBuilder();
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _results = $v.results?.toBuilder();
      _sid = $v.sid;
      _comment = $v.comment;
      _display = $v.display;
      _open = $v.open;
      _explanation = $v.explanation;
      _count = $v.count;
      _textFa = $v.textFa;
      _review = $v.review;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurveyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SurveyRecord;
  }

  @override
  void update(void Function(SurveyRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SurveyRecord build() {
    _$SurveyRecord _$result;
    try {
      _$result = _$v ??
          new _$SurveyRecord._(
              id: id,
              question: question,
              choices: _choices?.build(),
              startDate: startDate,
              endDate: endDate,
              results: _results?.build(),
              sid: sid,
              comment: comment,
              display: display,
              open: open,
              explanation: explanation,
              count: count,
              textFa: textFa,
              review: review,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'choices';
        _choices?.build();

        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SurveyRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
