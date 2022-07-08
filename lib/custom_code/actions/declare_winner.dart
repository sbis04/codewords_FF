// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
String declareWinner(int redWordsLeft, int blueWordsLeft) {
  if (redWordsLeft == 0) {
    return 'r';
  } else if (blueWordsLeft == 0) {
    return 'b';
  } else {
    return 'n';
  }
}
