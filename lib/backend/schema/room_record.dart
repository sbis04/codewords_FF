import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'room_record.g.dart';

abstract class RoomRecord implements Built<RoomRecord, RoomRecordBuilder> {
  static Serializer<RoomRecord> get serializer => _$roomRecordSerializer;

  @nullable
  int get code;

  @nullable
  @BuiltValueField(wireName: 'red_team')
  BuiltList<String> get redTeam;

  @nullable
  @BuiltValueField(wireName: 'blue_team')
  BuiltList<String> get blueTeam;

  @nullable
  @BuiltValueField(wireName: 'red_spy_master')
  String get redSpyMaster;

  @nullable
  @BuiltValueField(wireName: 'blue_spy_master')
  String get blueSpyMaster;

  @nullable
  String get host;

  @nullable
  BuiltList<String> get words;

  @nullable
  @BuiltValueField(wireName: 'is_started')
  bool get isStarted;

  @nullable
  @BuiltValueField(wireName: 'is_red_guessing')
  bool get isRedGuessing;

  @nullable
  @BuiltValueField(wireName: 'is_blue_guessing')
  bool get isBlueGuessing;

  @nullable
  int get redWordsLeft;

  @nullable
  int get blueWordsLeft;

  @nullable
  @BuiltValueField(wireName: 'is_red_winner')
  bool get isRedWinner;

  @nullable
  @BuiltValueField(wireName: 'is_blue_winner')
  bool get isBlueWinner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RoomRecordBuilder builder) => builder
    ..code = 0
    ..redTeam = ListBuilder()
    ..blueTeam = ListBuilder()
    ..redSpyMaster = ''
    ..blueSpyMaster = ''
    ..host = ''
    ..words = ListBuilder()
    ..isStarted = false
    ..isRedGuessing = false
    ..isBlueGuessing = false
    ..redWordsLeft = 0
    ..blueWordsLeft = 0
    ..isRedWinner = false
    ..isBlueWinner = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('room');

  static Stream<RoomRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RoomRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RoomRecord._();
  factory RoomRecord([void Function(RoomRecordBuilder) updates]) = _$RoomRecord;

  static RoomRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRoomRecordData({
  int code,
  String redSpyMaster,
  String blueSpyMaster,
  String host,
  bool isStarted,
  bool isRedGuessing,
  bool isBlueGuessing,
  int redWordsLeft,
  int blueWordsLeft,
  bool isRedWinner,
  bool isBlueWinner,
}) =>
    serializers.toFirestore(
        RoomRecord.serializer,
        RoomRecord((r) => r
          ..code = code
          ..redTeam = null
          ..blueTeam = null
          ..redSpyMaster = redSpyMaster
          ..blueSpyMaster = blueSpyMaster
          ..host = host
          ..words = null
          ..isStarted = isStarted
          ..isRedGuessing = isRedGuessing
          ..isBlueGuessing = isBlueGuessing
          ..redWordsLeft = redWordsLeft
          ..blueWordsLeft = blueWordsLeft
          ..isRedWinner = isRedWinner
          ..isBlueWinner = isBlueWinner));
