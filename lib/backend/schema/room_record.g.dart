// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoomRecord> _$roomRecordSerializer = new _$RoomRecordSerializer();

class _$RoomRecordSerializer implements StructuredSerializer<RoomRecord> {
  @override
  final Iterable<Type> types = const [RoomRecord, _$RoomRecord];
  @override
  final String wireName = 'RoomRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, RoomRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.redTeam;
    if (value != null) {
      result
        ..add('red_team')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.blueTeam;
    if (value != null) {
      result
        ..add('blue_team')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.redSpyMaster;
    if (value != null) {
      result
        ..add('red_spy_master')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blueSpyMaster;
    if (value != null) {
      result
        ..add('blue_spy_master')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.host;
    if (value != null) {
      result
        ..add('host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.words;
    if (value != null) {
      result
        ..add('words')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isStarted;
    if (value != null) {
      result
        ..add('is_started')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isRedGuessing;
    if (value != null) {
      result
        ..add('is_red_guessing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isBlueGuessing;
    if (value != null) {
      result
        ..add('is_blue_guessing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.redWordsLeft;
    if (value != null) {
      result
        ..add('redWordsLeft')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.blueWordsLeft;
    if (value != null) {
      result
        ..add('blueWordsLeft')
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
  RoomRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoomRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'red_team':
          result.redTeam.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'blue_team':
          result.blueTeam.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'red_spy_master':
          result.redSpyMaster = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'blue_spy_master':
          result.blueSpyMaster = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'words':
          result.words.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'is_started':
          result.isStarted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_red_guessing':
          result.isRedGuessing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_blue_guessing':
          result.isBlueGuessing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'redWordsLeft':
          result.redWordsLeft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'blueWordsLeft':
          result.blueWordsLeft = serializers.deserialize(value,
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

class _$RoomRecord extends RoomRecord {
  @override
  final int code;
  @override
  final BuiltList<String> redTeam;
  @override
  final BuiltList<String> blueTeam;
  @override
  final String redSpyMaster;
  @override
  final String blueSpyMaster;
  @override
  final String host;
  @override
  final BuiltList<String> words;
  @override
  final bool isStarted;
  @override
  final bool isRedGuessing;
  @override
  final bool isBlueGuessing;
  @override
  final int redWordsLeft;
  @override
  final int blueWordsLeft;
  @override
  final DocumentReference<Object> reference;

  factory _$RoomRecord([void Function(RoomRecordBuilder) updates]) =>
      (new RoomRecordBuilder()..update(updates)).build();

  _$RoomRecord._(
      {this.code,
      this.redTeam,
      this.blueTeam,
      this.redSpyMaster,
      this.blueSpyMaster,
      this.host,
      this.words,
      this.isStarted,
      this.isRedGuessing,
      this.isBlueGuessing,
      this.redWordsLeft,
      this.blueWordsLeft,
      this.reference})
      : super._();

  @override
  RoomRecord rebuild(void Function(RoomRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomRecordBuilder toBuilder() => new RoomRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomRecord &&
        code == other.code &&
        redTeam == other.redTeam &&
        blueTeam == other.blueTeam &&
        redSpyMaster == other.redSpyMaster &&
        blueSpyMaster == other.blueSpyMaster &&
        host == other.host &&
        words == other.words &&
        isStarted == other.isStarted &&
        isRedGuessing == other.isRedGuessing &&
        isBlueGuessing == other.isBlueGuessing &&
        redWordsLeft == other.redWordsLeft &&
        blueWordsLeft == other.blueWordsLeft &&
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
                                                $jc($jc(0, code.hashCode),
                                                    redTeam.hashCode),
                                                blueTeam.hashCode),
                                            redSpyMaster.hashCode),
                                        blueSpyMaster.hashCode),
                                    host.hashCode),
                                words.hashCode),
                            isStarted.hashCode),
                        isRedGuessing.hashCode),
                    isBlueGuessing.hashCode),
                redWordsLeft.hashCode),
            blueWordsLeft.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RoomRecord')
          ..add('code', code)
          ..add('redTeam', redTeam)
          ..add('blueTeam', blueTeam)
          ..add('redSpyMaster', redSpyMaster)
          ..add('blueSpyMaster', blueSpyMaster)
          ..add('host', host)
          ..add('words', words)
          ..add('isStarted', isStarted)
          ..add('isRedGuessing', isRedGuessing)
          ..add('isBlueGuessing', isBlueGuessing)
          ..add('redWordsLeft', redWordsLeft)
          ..add('blueWordsLeft', blueWordsLeft)
          ..add('reference', reference))
        .toString();
  }
}

class RoomRecordBuilder implements Builder<RoomRecord, RoomRecordBuilder> {
  _$RoomRecord _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  ListBuilder<String> _redTeam;
  ListBuilder<String> get redTeam =>
      _$this._redTeam ??= new ListBuilder<String>();
  set redTeam(ListBuilder<String> redTeam) => _$this._redTeam = redTeam;

  ListBuilder<String> _blueTeam;
  ListBuilder<String> get blueTeam =>
      _$this._blueTeam ??= new ListBuilder<String>();
  set blueTeam(ListBuilder<String> blueTeam) => _$this._blueTeam = blueTeam;

  String _redSpyMaster;
  String get redSpyMaster => _$this._redSpyMaster;
  set redSpyMaster(String redSpyMaster) => _$this._redSpyMaster = redSpyMaster;

  String _blueSpyMaster;
  String get blueSpyMaster => _$this._blueSpyMaster;
  set blueSpyMaster(String blueSpyMaster) =>
      _$this._blueSpyMaster = blueSpyMaster;

  String _host;
  String get host => _$this._host;
  set host(String host) => _$this._host = host;

  ListBuilder<String> _words;
  ListBuilder<String> get words => _$this._words ??= new ListBuilder<String>();
  set words(ListBuilder<String> words) => _$this._words = words;

  bool _isStarted;
  bool get isStarted => _$this._isStarted;
  set isStarted(bool isStarted) => _$this._isStarted = isStarted;

  bool _isRedGuessing;
  bool get isRedGuessing => _$this._isRedGuessing;
  set isRedGuessing(bool isRedGuessing) =>
      _$this._isRedGuessing = isRedGuessing;

  bool _isBlueGuessing;
  bool get isBlueGuessing => _$this._isBlueGuessing;
  set isBlueGuessing(bool isBlueGuessing) =>
      _$this._isBlueGuessing = isBlueGuessing;

  int _redWordsLeft;
  int get redWordsLeft => _$this._redWordsLeft;
  set redWordsLeft(int redWordsLeft) => _$this._redWordsLeft = redWordsLeft;

  int _blueWordsLeft;
  int get blueWordsLeft => _$this._blueWordsLeft;
  set blueWordsLeft(int blueWordsLeft) => _$this._blueWordsLeft = blueWordsLeft;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  RoomRecordBuilder() {
    RoomRecord._initializeBuilder(this);
  }

  RoomRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _redTeam = $v.redTeam?.toBuilder();
      _blueTeam = $v.blueTeam?.toBuilder();
      _redSpyMaster = $v.redSpyMaster;
      _blueSpyMaster = $v.blueSpyMaster;
      _host = $v.host;
      _words = $v.words?.toBuilder();
      _isStarted = $v.isStarted;
      _isRedGuessing = $v.isRedGuessing;
      _isBlueGuessing = $v.isBlueGuessing;
      _redWordsLeft = $v.redWordsLeft;
      _blueWordsLeft = $v.blueWordsLeft;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoomRecord;
  }

  @override
  void update(void Function(RoomRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RoomRecord build() {
    _$RoomRecord _$result;
    try {
      _$result = _$v ??
          new _$RoomRecord._(
              code: code,
              redTeam: _redTeam?.build(),
              blueTeam: _blueTeam?.build(),
              redSpyMaster: redSpyMaster,
              blueSpyMaster: blueSpyMaster,
              host: host,
              words: _words?.build(),
              isStarted: isStarted,
              isRedGuessing: isRedGuessing,
              isBlueGuessing: isBlueGuessing,
              redWordsLeft: redWordsLeft,
              blueWordsLeft: blueWordsLeft,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'redTeam';
        _redTeam?.build();
        _$failedField = 'blueTeam';
        _blueTeam?.build();

        _$failedField = 'words';
        _words?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RoomRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
