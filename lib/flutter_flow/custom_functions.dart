import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int generateRoomCode() {
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
  bool isBlue,
  bool isRedGuessing,
  bool isBlueGuessing,
) {
  if (isBlue && isBlueGuessing) {
    return true;
  } else if (!isBlue && isRedGuessing) {
    return true;
  } else {
    return false;
  }
}

bool shouldShowEndTurn(
  bool isBlue,
  bool isRedGuessing,
  bool isBlueGuessing,
  bool isSpy,
) {
  if (isBlue && isBlueGuessing && !isSpy) {
    return true;
  } else if (!isBlue && isRedGuessing && !isSpy) {
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

String retrieveSelectedWordInfo(
  List<String> words,
  int index,
) {
  return words[index];
}

bool isCurrentTeamsTurn(
  bool isBlueTeam,
  bool isBlueGuessing,
) {
  if ((isBlueTeam && isBlueGuessing) || (!isBlueTeam && !isBlueGuessing)) {
    return true;
  }

  return false;
}

String createAISystemPrompt(
  List<String> allWords,
  bool isBlue,
) {
  final teamColor = isBlue ? 'Blue' : 'Red';

  final words = allWords
      .map((word) => separateWordDetails(word)['word'] as String)
      .toList()
      .join(', ');

  final blueWords = allWords
      .where((word) => separateWordDetails(word)['color'] == 'b')
      .map((filteredWords) =>
          separateWordDetails(filteredWords)['word'] as String)
      .toList()
      .join(', ');

  final redWords = allWords
      .where((word) => separateWordDetails(word)['color'] == 'r')
      .map((filteredWords) =>
          separateWordDetails(filteredWords)['word'] as String)
      .toList()
      .join(', ');

  final systemPrompt =
      '''You are the AI Spymaster for the $teamColor team of the Codenames game.

The Board contains these words: $words.

Among these words, those belonging to the Blue team are: $blueWords.

Words belonging to the Red team are: $redWords.

The rest of the words are neutral. There is no assassin in this game.

You will be given the words that are already guessed in this format:

Guessed: Sink,  Poison, Queen

You will reply with a one-word clue for the $teamColor team along with the number of words to guess in this format: [word, number]. Examples:

Clue: Basin, 2

Clue: Law, 1

Clue: King, 0

Some rules are as follows:

- You can give only one clue at a time.

- The word portion of a clue must be either a single word or a proper noun (which can be longer than one word). 

- The clue word must be based on the meaning of one or more words on the board belonging to your team.

- You can't use any word that's present on the board.

- Clue number can be between 0-9.

- The number given with each clue generally represents the number of words to which the clue word applies. The clue number is important because the field operatives can guess up to that number plus words left to guess in their previous turns.

- The clue number can also be zero, which perhaps could be used to send information about which words are not yours. If the clue number is zero, the field operatives can guess an unlimited number of times, as long as they continue to guess words that belong to their team.

- Spymaster's target is to help its field operatives to guess all the words belonging to their team without choosing the other team's or neutral words.

- The game ends when all words of a team are guessed correctly and that team becomes the winner.

- You need to give clues until there is 0 words left in a team.
''';
  return jsonEncode(systemPrompt).substring(1, systemPrompt.length - 1);
}

String getClue(String rawClue) {
  return rawClue.split('Clue: ')[0];
}

String createAIUserPrompt(List<String> allWords) {
  final guessedWords = allWords
      .where(
        (word) => separateWordDetails(word)['is_guessed'] == 't',
      )
      .map(
        (filteredWords) => separateWordDetails(filteredWords)['word'] as String,
      )
      .toList();

  return 'Guessed: ' + guessedWords.join(', ');
}
