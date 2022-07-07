import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'words_record.g.dart';

abstract class WordsRecord implements Built<WordsRecord, WordsRecordBuilder> {
  static Serializer<WordsRecord> get serializer => _$wordsRecordSerializer;

  @nullable
  String get word;

  @nullable
  @BuiltValueField(wireName: 'belongs_to')
  int get belongsTo;

  @nullable
  @BuiltValueField(wireName: 'is_guessed')
  bool get isGuessed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(WordsRecordBuilder builder) => builder
    ..word = ''
    ..belongsTo = 0
    ..isGuessed = false;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('words')
          : FirebaseFirestore.instance.collectionGroup('words');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('words').doc();

  static Stream<WordsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<WordsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WordsRecord._();
  factory WordsRecord([void Function(WordsRecordBuilder) updates]) =
      _$WordsRecord;

  static WordsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createWordsRecordData({
  String word,
  int belongsTo,
  bool isGuessed,
}) =>
    serializers.toFirestore(
        WordsRecord.serializer,
        WordsRecord((w) => w
          ..word = word
          ..belongsTo = belongsTo
          ..isGuessed = isGuessed));
