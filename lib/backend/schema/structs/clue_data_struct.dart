// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClueDataStruct extends FFFirebaseStruct {
  ClueDataStruct({
    String? clue,
    int? turn,
    bool? isForBlue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _clue = clue,
        _turn = turn,
        _isForBlue = isForBlue,
        super(firestoreUtilData);

  // "clue" field.
  String? _clue;
  String get clue => _clue ?? '';
  set clue(String? val) => _clue = val;
  bool hasClue() => _clue != null;

  // "turn" field.
  int? _turn;
  int get turn => _turn ?? 0;
  set turn(int? val) => _turn = val;
  void incrementTurn(int amount) => _turn = turn + amount;
  bool hasTurn() => _turn != null;

  // "is_for_blue" field.
  bool? _isForBlue;
  bool get isForBlue => _isForBlue ?? false;
  set isForBlue(bool? val) => _isForBlue = val;
  bool hasIsForBlue() => _isForBlue != null;

  static ClueDataStruct fromMap(Map<String, dynamic> data) => ClueDataStruct(
        clue: data['clue'] as String?,
        turn: data['turn'] as int?,
        isForBlue: data['is_for_blue'] as bool?,
      );

  static ClueDataStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ClueDataStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'clue': _clue,
        'turn': _turn,
        'is_for_blue': _isForBlue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clue': serializeParam(
          _clue,
          ParamType.String,
        ),
        'turn': serializeParam(
          _turn,
          ParamType.int,
        ),
        'is_for_blue': serializeParam(
          _isForBlue,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ClueDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClueDataStruct(
        clue: deserializeParam(
          data['clue'],
          ParamType.String,
          false,
        ),
        turn: deserializeParam(
          data['turn'],
          ParamType.int,
          false,
        ),
        isForBlue: deserializeParam(
          data['is_for_blue'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ClueDataStruct(${toMap()})';
}

ClueDataStruct createClueDataStruct({
  String? clue,
  int? turn,
  bool? isForBlue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClueDataStruct(
      clue: clue,
      turn: turn,
      isForBlue: isForBlue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClueDataStruct? updateClueDataStruct(
  ClueDataStruct? clueData, {
  bool clearUnsetFields = true,
}) =>
    clueData
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addClueDataStructData(
  Map<String, dynamic> firestoreData,
  ClueDataStruct? clueData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clueData == null) {
    return;
  }
  if (clueData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && clueData.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clueDataData = getClueDataFirestoreData(clueData, forFieldValue);
  final nestedData = clueDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = clueData.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClueDataFirestoreData(
  ClueDataStruct? clueData, [
  bool forFieldValue = false,
]) {
  if (clueData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clueData.toMap());

  // Add any Firestore field values
  clueData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClueDataListFirestoreData(
  List<ClueDataStruct>? clueDatas,
) =>
    clueDatas?.map((e) => getClueDataFirestoreData(e, true)).toList() ?? [];
