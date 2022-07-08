// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlayersRecord> _$playersRecordSerializer =
    new _$PlayersRecordSerializer();

class _$PlayersRecordSerializer implements StructuredSerializer<PlayersRecord> {
  @override
  final Iterable<Type> types = const [PlayersRecord, _$PlayersRecord];
  @override
  final String wireName = 'PlayersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PlayersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isTeamSelected;
    if (value != null) {
      result
        ..add('is_team_selected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isBlue;
    if (value != null) {
      result
        ..add('is_blue')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isSpymaster;
    if (value != null) {
      result
        ..add('is_spymaster')
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
  PlayersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_team_selected':
          result.isTeamSelected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_blue':
          result.isBlue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_spymaster':
          result.isSpymaster = serializers.deserialize(value,
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

class _$PlayersRecord extends PlayersRecord {
  @override
  final String name;
  @override
  final bool isTeamSelected;
  @override
  final bool isBlue;
  @override
  final bool isSpymaster;
  @override
  final DocumentReference<Object> reference;

  factory _$PlayersRecord([void Function(PlayersRecordBuilder) updates]) =>
      (new PlayersRecordBuilder()..update(updates)).build();

  _$PlayersRecord._(
      {this.name,
      this.isTeamSelected,
      this.isBlue,
      this.isSpymaster,
      this.reference})
      : super._();

  @override
  PlayersRecord rebuild(void Function(PlayersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayersRecordBuilder toBuilder() => new PlayersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayersRecord &&
        name == other.name &&
        isTeamSelected == other.isTeamSelected &&
        isBlue == other.isBlue &&
        isSpymaster == other.isSpymaster &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), isTeamSelected.hashCode),
                isBlue.hashCode),
            isSpymaster.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlayersRecord')
          ..add('name', name)
          ..add('isTeamSelected', isTeamSelected)
          ..add('isBlue', isBlue)
          ..add('isSpymaster', isSpymaster)
          ..add('reference', reference))
        .toString();
  }
}

class PlayersRecordBuilder
    implements Builder<PlayersRecord, PlayersRecordBuilder> {
  _$PlayersRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isTeamSelected;
  bool get isTeamSelected => _$this._isTeamSelected;
  set isTeamSelected(bool isTeamSelected) =>
      _$this._isTeamSelected = isTeamSelected;

  bool _isBlue;
  bool get isBlue => _$this._isBlue;
  set isBlue(bool isBlue) => _$this._isBlue = isBlue;

  bool _isSpymaster;
  bool get isSpymaster => _$this._isSpymaster;
  set isSpymaster(bool isSpymaster) => _$this._isSpymaster = isSpymaster;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PlayersRecordBuilder() {
    PlayersRecord._initializeBuilder(this);
  }

  PlayersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _isTeamSelected = $v.isTeamSelected;
      _isBlue = $v.isBlue;
      _isSpymaster = $v.isSpymaster;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlayersRecord;
  }

  @override
  void update(void Function(PlayersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlayersRecord build() {
    final _$result = _$v ??
        new _$PlayersRecord._(
            name: name,
            isTeamSelected: isTeamSelected,
            isBlue: isBlue,
            isSpymaster: isSpymaster,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
