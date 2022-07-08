// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:confetti/confetti.dart';
import 'dart:math' as math;

class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _ConfettiOverlayState createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay> {
  ConfettiController _topController;

  @override
  void initState() {
    super.initState();

    _topController = ConfettiController(duration: const Duration(seconds: 5));
    _topController.play();
  }

  @override
  void dispose() {
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _topController,
        blastDirection: math.pi / 2,
        maxBlastForce: 4,
        minBlastForce: 1,
        emissionFrequency: 0.01,
        numberOfParticles: 20,
        gravity: 0.6,
        shouldLoop: true,
        colors: const [
          Colors.white,
          Colors.yellow,
        ],
      ),
    );
  }
}
