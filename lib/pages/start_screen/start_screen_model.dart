import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'start_screen_widget.dart' show StartScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartScreenModel extends FlutterFlowModel<StartScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldSmall widget.
  FocusNode? textFieldSmallFocusNode;
  TextEditingController? textFieldSmallTextController;
  String? Function(BuildContext, String?)?
      textFieldSmallTextControllerValidator;
  // State field(s) for TextFieldLarge widget.
  FocusNode? textFieldLargeFocusNode;
  TextEditingController? textFieldLargeTextController;
  String? Function(BuildContext, String?)?
      textFieldLargeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSmallFocusNode?.dispose();
    textFieldSmallTextController?.dispose();

    textFieldLargeFocusNode?.dispose();
    textFieldLargeTextController?.dispose();
  }
}
