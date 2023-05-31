import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_dialog/loading_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - generateBoardWords] action in FloatingActionButton widget.
  List<String>? initialWords;
  InstantTimer? AITimer;
  // Stores action output result for [Backend Call - API (getClue)] action in FloatingActionButton widget.
  ApiCallResponse? aIOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    AITimer?.cancel();
  }

  /// Additional helper methods are added here.

}
