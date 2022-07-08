import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../start_screen/start_screen_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RedCelebratePageWidget extends StatefulWidget {
  const RedCelebratePageWidget({Key key}) : super(key: key);

  @override
  _RedCelebratePageWidgetState createState() => _RedCelebratePageWidgetState();
}

class _RedCelebratePageWidgetState extends State<RedCelebratePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.trophy,
                          color: Color(0xFFFFB938),
                          size: 90,
                        ),
                        Text(
                          'WINNER',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 36,
                              ),
                        ),
                        Text(
                          'Red Team',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => FFAppState().words = []);
                              setState(() => FFAppState().isSpy = false);
                              setState(() => FFAppState().isSpyViewOn = true);
                              setState(
                                  () => FFAppState().hasJoinedTeam = false);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: StartScreenWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Start New Game',
                            options: FFButtonOptions(
                              width: 200,
                              height: 50,
                              color: Color(0x004B39EF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.ConfettiOverlay(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
