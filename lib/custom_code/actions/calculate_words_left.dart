// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
dynamic calculateWordsLeft(List<String> rawWords) {
  int redWordsLeft = 0;
  int blueWordsLeft = 0;

  for (int i = 0; i < rawWords.length; i++) {
    final json = separateWordDetails(rawWords[i]);
    final color = json['color'];
    final isGuessed = json['is_guessed'];

    if (isGuessed == 'f' && color == 'r') {
      redWordsLeft++;
    } else if (isGuessed == 'f' && color == 'b') {
      blueWordsLeft++;
    }
  }

  return {
    'red': redWordsLeft,
    'blue': blueWordsLeft,
  };
}
