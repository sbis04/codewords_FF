import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameModeDialogModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isCreating = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  RoomRecord? roomDetails;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PlayersRecord? playerDocument;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  RoomRecord? roomDetailsAI;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PlayersRecord? playerDocumentUser;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PlayersRecord? spymasterBlueAI;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PlayersRecord? spymasterRedAI;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
