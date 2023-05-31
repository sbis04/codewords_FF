// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CircularIndicator extends StatefulWidget {
  const CircularIndicator({
    Key? key,
    this.width,
    this.height,
    required this.color,
    required this.thickness,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;
  final double thickness;

  @override
  _CircularIndicatorState createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
          strokeWidth: widget.thickness,
        ),
      ),
    );
  }
}
