// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
List<String> wordTapped(int index, List<String> words) {
  final selectedWord = words[index];
  final updatedWord = selectedWord.substring(0, selectedWord.length - 1) + 't';
  words[index] = updatedWord;
  return words;
}
