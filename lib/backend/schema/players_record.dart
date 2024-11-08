import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayersRecord extends FirestoreRecord {
  PlayersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "is_team_selected" field.
  bool? _isTeamSelected;
  bool get isTeamSelected => _isTeamSelected ?? false;
  bool hasIsTeamSelected() => _isTeamSelected != null;

  // "is_blue" field.
  bool? _isBlue;
  bool get isBlue => _isBlue ?? false;
  bool hasIsBlue() => _isBlue != null;

  // "is_spymaster" field.
  bool? _isSpymaster;
  bool get isSpymaster => _isSpymaster ?? false;
  bool hasIsSpymaster() => _isSpymaster != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isTeamSelected = snapshotData['is_team_selected'] as bool?;
    _isBlue = snapshotData['is_blue'] as bool?;
    _isSpymaster = snapshotData['is_spymaster'] as bool?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('players')
          : FirebaseFirestore.instance.collectionGroup('players');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('players').doc(id);

  static Stream<PlayersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlayersRecord.fromSnapshot(s));

  static Future<PlayersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlayersRecord.fromSnapshot(s));

  static PlayersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlayersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlayersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlayersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlayersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlayersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlayersRecordData({
  String? name,
  bool? isTeamSelected,
  bool? isBlue,
  bool? isSpymaster,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'is_team_selected': isTeamSelected,
      'is_blue': isBlue,
      'is_spymaster': isSpymaster,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlayersRecordDocumentEquality implements Equality<PlayersRecord> {
  const PlayersRecordDocumentEquality();

  @override
  bool equals(PlayersRecord? e1, PlayersRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isTeamSelected == e2?.isTeamSelected &&
        e1?.isBlue == e2?.isBlue &&
        e1?.isSpymaster == e2?.isSpymaster &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(PlayersRecord? e) => const ListEquality()
      .hash([e?.name, e?.isTeamSelected, e?.isBlue, e?.isSpymaster, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is PlayersRecord;
}
