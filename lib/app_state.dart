import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _words = [];
  List<String> get words => _words;
  set words(List<String> value) {
    _words = value;
  }

  void addToWords(String value) {
    words.add(value);
  }

  void removeFromWords(String value) {
    words.remove(value);
  }

  void removeAtIndexFromWords(int index) {
    words.removeAt(index);
  }

  void updateWordsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    words[index] = updateFn(_words[index]);
  }

  void insertAtIndexInWords(int index, String value) {
    words.insert(index, value);
  }

  bool _isVerifyPressed = false;
  bool get isVerifyPressed => _isVerifyPressed;
  set isVerifyPressed(bool value) {
    _isVerifyPressed = value;
  }

  bool _isJoinning = false;
  bool get isJoinning => _isJoinning;
  set isJoinning(bool value) {
    _isJoinning = value;
  }

  String _apiKey = 'YOUR_OPENAI_KEY_HERE';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
  }

  String _modelName = 'gpt-4';
  String get modelName => _modelName;
  set modelName(String value) {
    _modelName = value;
  }
}
