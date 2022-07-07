import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int generateRoomCode() {
  // Generate 4 digit random number
  math.Random rdm = math.Random();
  int ranRoomCode = rdm.nextInt(9000) + 1000;
  return ranRoomCode;
}

dynamic separateWordDetails(String combinedWord) {
  final parts = combinedWord.split('#');

  final word = parts[0];
  final color = parts[1];
  final isGuessed = parts[2];

  final json = {
    'word': word,
    'color': color,
    'is_guessed': isGuessed,
  };

  return json;
}

bool isBlueVisible(
  String color,
  String isGuessed,
) {
  if (color == 'b' && isGuessed == 't') {
    return true;
  } else {
    return false;
  }
}

bool isBlueVisibleSpy(String color) {
  return color == 'b';
}

bool isRedVisible(
  String color,
  String isGuessed,
) {
  if (color == 'r' && isGuessed == 't') {
    return true;
  } else {
    return false;
  }
}

bool isRedVisibleSpy(String color) {
  return color == 'r';
}

bool isNeutralVisible(
  String color,
  String isGuessed,
) {
  if (color == 'n' && isGuessed == 't') {
    return true;
  } else {
    return false;
  }
}

bool isNeutralVisibleSpy(String color) {
  return color == 'n';
}

bool isGuessed(String isGuessedString) {
  if (isGuessedString == 't') {
    return true;
  } else {
    return false;
  }
}

bool shouldBlock(
  String teamColor,
  bool isRedGuessing,
  bool isBlueGuessing,
) {
  if (teamColor == 'b' && isBlueGuessing) {
    return true;
  } else if (teamColor == 'r' && isRedGuessing) {
    return true;
  } else {
    return false;
  }
}

bool shouldShowEndTurn(
  String teamColor,
  bool isRedGuessing,
  bool isBlueGuessing,
  bool isSpy,
) {
  if (teamColor == 'b' && isBlueGuessing && !isSpy) {
    return true;
  } else if (teamColor == 'r' && isRedGuessing && !isSpy) {
    return true;
  } else {
    return false;
  }
}

bool shouldShowSpyView(
  bool isSpy,
  bool isSpyViewOn,
) {
  if (isSpy && isSpyViewOn) {
    return true;
  } else {
    return false;
  }
}
