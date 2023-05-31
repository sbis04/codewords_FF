import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomRecord extends FirestoreRecord {
  RoomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "host" field.
  String? _host;
  String get host => _host ?? '';
  bool hasHost() => _host != null;

  // "words" field.
  List<String>? _words;
  List<String> get words => _words ?? const [];
  bool hasWords() => _words != null;

  // "is_started" field.
  bool? _isStarted;
  bool get isStarted => _isStarted ?? false;
  bool hasIsStarted() => _isStarted != null;

  // "is_red_guessing" field.
  bool? _isRedGuessing;
  bool get isRedGuessing => _isRedGuessing ?? false;
  bool hasIsRedGuessing() => _isRedGuessing != null;

  // "is_blue_guessing" field.
  bool? _isBlueGuessing;
  bool get isBlueGuessing => _isBlueGuessing ?? false;
  bool hasIsBlueGuessing() => _isBlueGuessing != null;

  // "redWordsLeft" field.
  int? _redWordsLeft;
  int get redWordsLeft => _redWordsLeft ?? 0;
  bool hasRedWordsLeft() => _redWordsLeft != null;

  // "blueWordsLeft" field.
  int? _blueWordsLeft;
  int get blueWordsLeft => _blueWordsLeft ?? 0;
  bool hasBlueWordsLeft() => _blueWordsLeft != null;

  // "is_red_winner" field.
  bool? _isRedWinner;
  bool get isRedWinner => _isRedWinner ?? false;
  bool hasIsRedWinner() => _isRedWinner != null;

  // "is_blue_winner" field.
  bool? _isBlueWinner;
  bool get isBlueWinner => _isBlueWinner ?? false;
  bool hasIsBlueWinner() => _isBlueWinner != null;

  // "is_ai_spymaster" field.
  bool? _isAiSpymaster;
  bool get isAiSpymaster => _isAiSpymaster ?? false;
  bool hasIsAiSpymaster() => _isAiSpymaster != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "current_turn" field.
  int? _currentTurn;
  int get currentTurn => _currentTurn ?? 0;
  bool hasCurrentTurn() => _currentTurn != null;

  // "clues" field.
  List<ClueDataStruct>? _clues;
  List<ClueDataStruct> get clues => _clues ?? const [];
  bool hasClues() => _clues != null;

  void _initializeFields() {
    _code = snapshotData['code'] as int?;
    _host = snapshotData['host'] as String?;
    _words = getDataList(snapshotData['words']);
    _isStarted = snapshotData['is_started'] as bool?;
    _isRedGuessing = snapshotData['is_red_guessing'] as bool?;
    _isBlueGuessing = snapshotData['is_blue_guessing'] as bool?;
    _redWordsLeft = snapshotData['redWordsLeft'] as int?;
    _blueWordsLeft = snapshotData['blueWordsLeft'] as int?;
    _isRedWinner = snapshotData['is_red_winner'] as bool?;
    _isBlueWinner = snapshotData['is_blue_winner'] as bool?;
    _isAiSpymaster = snapshotData['is_ai_spymaster'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _currentTurn = snapshotData['current_turn'] as int?;
    _clues = getStructList(
      snapshotData['clues'],
      ClueDataStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('room');

  static Stream<RoomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomRecord.fromSnapshot(s));

  static Future<RoomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomRecord.fromSnapshot(s));

  static RoomRecord fromSnapshot(DocumentSnapshot snapshot) => RoomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createRoomRecordData({
  int? code,
  String? host,
  bool? isStarted,
  bool? isRedGuessing,
  bool? isBlueGuessing,
  int? redWordsLeft,
  int? blueWordsLeft,
  bool? isRedWinner,
  bool? isBlueWinner,
  bool? isAiSpymaster,
  DateTime? createdAt,
  int? currentTurn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'host': host,
      'is_started': isStarted,
      'is_red_guessing': isRedGuessing,
      'is_blue_guessing': isBlueGuessing,
      'redWordsLeft': redWordsLeft,
      'blueWordsLeft': blueWordsLeft,
      'is_red_winner': isRedWinner,
      'is_blue_winner': isBlueWinner,
      'is_ai_spymaster': isAiSpymaster,
      'created_at': createdAt,
      'current_turn': currentTurn,
    }.withoutNulls,
  );

  return firestoreData;
}
