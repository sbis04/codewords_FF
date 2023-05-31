import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_widget/loading_widget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FieldOperativesViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  InstantTimer? blueAITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in Button widget.
  ApiCallResponse? blueAIOutput;
  InstantTimer? redAITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in Button widget.
  ApiCallResponse? redAIOutput;
  // Stores action output result for [Custom Action - wordTapped] action in WhiteContainer widget.
  List<String>? updatedWordsList;
  // Stores action output result for [Custom Action - calculateWordsLeft] action in WhiteContainer widget.
  dynamic? wordsLeftJson;
  // Stores action output result for [Custom Action - getWordColor] action in WhiteContainer widget.
  String? wordColor;
  InstantTimer? redNeutralAITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? redNeutralAIOutput;
  InstantTimer? blueNeutralAITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? blueNeutralAIOutput;
  InstantTimer? redEndAITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? redEndAIOutput;
  InstantTimer? blueEndAITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? blueEndAIOutput;
  // Stores action output result for [Custom Action - declareWinner] action in WhiteContainer widget.
  String? winner;
  // Stores action output result for [Custom Action - wordTapped] action in WhiteContainer widget.
  List<String>? updatedWordsListLarge;
  // Stores action output result for [Custom Action - calculateWordsLeft] action in WhiteContainer widget.
  dynamic? wordsLeftJsonLarge;
  // Stores action output result for [Custom Action - getWordColor] action in WhiteContainer widget.
  String? wordColorLarge;
  InstantTimer? redNeutralAILargeTimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? redNeutralAIOutputLarge;
  InstantTimer? blueNeutralAILargeTimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? blueNeutralAIOutputLarge;
  InstantTimer? blueEndAILargeTimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? blueEndAIOutputLarge;
  InstantTimer? redEndAILargeTimer;
  // Stores action output result for [Backend Call - API (getClue)] action in WhiteContainer widget.
  ApiCallResponse? redEndAIOutputLarge;
  // Stores action output result for [Custom Action - declareWinner] action in WhiteContainer widget.
  String? winnerLarge;
  // Stores action output result for [Backend Call - API (getClue)] action in Button widget.
  ApiCallResponse? blueAIOutputLarge;
  // Stores action output result for [Backend Call - API (getClue)] action in Button widget.
  ApiCallResponse? redAIOutputLarge;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    blueAITimer?.cancel();
    redAITimer?.cancel();
    redNeutralAITimer?.cancel();
    blueNeutralAITimer?.cancel();
    redEndAITimer?.cancel();
    blueEndAITimer?.cancel();
    redNeutralAILargeTimer?.cancel();
    blueNeutralAILargeTimer?.cancel();
    blueEndAILargeTimer?.cancel();
    redEndAILargeTimer?.cancel();
  }

  /// Additional helper methods are added here.

}
