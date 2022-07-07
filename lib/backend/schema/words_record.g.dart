// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WordsRecord> _$wordsRecordSerializer = new _$WordsRecordSerializer();

class _$WordsRecordSerializer implements StructuredSerializer<WordsRecord> {
  @override
  final Iterable<Type> types = const [WordsRecord, _$WordsRecord];
  @override
  final String wireName = 'WordsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, WordsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.word;
    if (value != null) {
      result
        ..add('word')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.belongsTo;
    if (value != null) {
      result
        ..add('belongs_to')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isGuessed;
    if (value != null) {
      result
        ..add('is_guessed')
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
  WordsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WordsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'word':
          result.word = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'belongs_to':
          result.belongsTo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_guessed':
          result.isGuessed = serializers.deserialize(value,
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

class _$WordsRecord extends WordsRecord {
  @override
  final String word;
  @override
  final int belongsTo;
  @override
  final bool isGuessed;
  @override
  final DocumentReference<Object> reference;

  factory _$WordsRecord([void Function(WordsRecordBuilder) updates]) =>
      (new WordsRecordBuilder()..update(updates)).build();

  _$WordsRecord._({this.word, this.belongsTo, this.isGuessed, this.reference})
      : super._();

  @override
  WordsRecord rebuild(void Function(WordsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WordsRecordBuilder toBuilder() => new WordsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WordsRecord &&
        word == other.word &&
        belongsTo == other.belongsTo &&
        isGuessed == other.isGuessed &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, word.hashCode), belongsTo.hashCode), isGuessed.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WordsRecord')
          ..add('word', word)
          ..add('belongsTo', belongsTo)
          ..add('isGuessed', isGuessed)
          ..add('reference', reference))
        .toString();
  }
}

class WordsRecordBuilder implements Builder<WordsRecord, WordsRecordBuilder> {
  _$WordsRecord _$v;

  String _word;
  String get word => _$this._word;
  set word(String word) => _$this._word = word;

  int _belongsTo;
  int get belongsTo => _$this._belongsTo;
  set belongsTo(int belongsTo) => _$this._belongsTo = belongsTo;

  bool _isGuessed;
  bool get isGuessed => _$this._isGuessed;
  set isGuessed(bool isGuessed) => _$this._isGuessed = isGuessed;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  WordsRecordBuilder() {
    WordsRecord._initializeBuilder(this);
  }

  WordsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _word = $v.word;
      _belongsTo = $v.belongsTo;
      _isGuessed = $v.isGuessed;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WordsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WordsRecord;
  }

  @override
  void update(void Function(WordsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WordsRecord build() {
    final _$result = _$v ??
        new _$WordsRecord._(
            word: word,
            belongsTo: belongsTo,
            isGuessed: isGuessed,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
