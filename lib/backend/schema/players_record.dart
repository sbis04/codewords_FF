import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'players_record.g.dart';

abstract class PlayersRecord
    implements Built<PlayersRecord, PlayersRecordBuilder> {
  static Serializer<PlayersRecord> get serializer => _$playersRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'is_team_selected')
  bool get isTeamSelected;

  @nullable
  @BuiltValueField(wireName: 'is_blue')
  bool get isBlue;

  @nullable
  @BuiltValueField(wireName: 'is_spymaster')
  bool get isSpymaster;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(PlayersRecordBuilder builder) => builder
    ..name = ''
    ..isTeamSelected = false
    ..isBlue = false
    ..isSpymaster = false;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('players')
          : FirebaseFirestore.instance.collectionGroup('players');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('players').doc();

  static Stream<PlayersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PlayersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PlayersRecord._();
  factory PlayersRecord([void Function(PlayersRecordBuilder) updates]) =
      _$PlayersRecord;

  static PlayersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPlayersRecordData({
  String name,
  bool isTeamSelected,
  bool isBlue,
  bool isSpymaster,
}) =>
    serializers.toFirestore(
        PlayersRecord.serializer,
        PlayersRecord((p) => p
          ..name = name
          ..isTeamSelected = isTeamSelected
          ..isBlue = isBlue
          ..isSpymaster = isSpymaster));
