// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
List<String> generateBoardWords(List<String> totalWordList) {
  // generate list of 25 unique words from list
  // format:
  // word # color(b/r/n) # is_guessed(t/f)
  // example:
  // "animal#b#t" ==> animal  b  t
  //
  totalWordList.shuffle();
  final uniqueWords = totalWordList.sublist(0, 25);
  final wordColors = [
    'b',
    'b',
    'b',
    'b',
    'b',
    'b',
    'b',
    'b',
    'b',
    'r',
    'r',
    'r',
    'r',
    'r',
    'r',
    'r',
    'r',
    'n',
    'n',
    'n',
    'n',
    'n',
    'n',
    'n',
    'n',
  ];
  wordColors.shuffle();
  uniqueWords.asMap().forEach((index, word) => uniqueWords[index] =
      uniqueWords[index] + '#' + wordColors[index] + '#' + 'f');
  return uniqueWords;
}
