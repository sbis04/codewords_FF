import 'dart:async';

import 'package:collection/collection.dart';

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
    _code = castToType<int>(snapshotData['code']);
    _host = snapshotData['host'] as String?;
    _words = getDataList(snapshotData['words']);
    _isStarted = snapshotData['is_started'] as bool?;
    _isRedGuessing = snapshotData['is_red_guessing'] as bool?;
    _isBlueGuessing = snapshotData['is_blue_guessing'] as bool?;
    _redWordsLeft = castToType<int>(snapshotData['redWordsLeft']);
    _blueWordsLeft = castToType<int>(snapshotData['blueWordsLeft']);
    _isRedWinner = snapshotData['is_red_winner'] as bool?;
    _isBlueWinner = snapshotData['is_blue_winner'] as bool?;
    _isAiSpymaster = snapshotData['is_ai_spymaster'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _currentTurn = castToType<int>(snapshotData['current_turn']);
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

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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

class RoomRecordDocumentEquality implements Equality<RoomRecord> {
  const RoomRecordDocumentEquality();

  @override
  bool equals(RoomRecord? e1, RoomRecord? e2) {
    const listEquality = ListEquality();
    return e1?.code == e2?.code &&
        e1?.host == e2?.host &&
        listEquality.equals(e1?.words, e2?.words) &&
        e1?.isStarted == e2?.isStarted &&
        e1?.isRedGuessing == e2?.isRedGuessing &&
        e1?.isBlueGuessing == e2?.isBlueGuessing &&
        e1?.redWordsLeft == e2?.redWordsLeft &&
        e1?.blueWordsLeft == e2?.blueWordsLeft &&
        e1?.isRedWinner == e2?.isRedWinner &&
        e1?.isBlueWinner == e2?.isBlueWinner &&
        e1?.isAiSpymaster == e2?.isAiSpymaster &&
        e1?.createdAt == e2?.createdAt &&
        e1?.currentTurn == e2?.currentTurn &&
        listEquality.equals(e1?.clues, e2?.clues);
  }

  @override
  int hash(RoomRecord? e) => const ListEquality().hash([
        e?.code,
        e?.host,
        e?.words,
        e?.isStarted,
        e?.isRedGuessing,
        e?.isBlueGuessing,
        e?.redWordsLeft,
        e?.blueWordsLeft,
        e?.isRedWinner,
        e?.isBlueWinner,
        e?.isAiSpymaster,
        e?.createdAt,
        e?.currentTurn,
        e?.clues
      ]);

  @override
  bool isValidKey(Object? o) => o is RoomRecord;
}
