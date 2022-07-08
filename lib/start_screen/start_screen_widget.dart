import '../components/create_game_widget.dart';
import '../components/join_game_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreenWidget extends StatefulWidget {
  const StartScreenWidget({Key key}) : super(key: key);

  @override
  _StartScreenWidgetState createState() => _StartScreenWidgetState();
}

class _StartScreenWidgetState extends State<StartScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          'Codewords',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 30,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primaryBtnText,
                FlutterFlowTheme.of(context).primaryColor,
                Color(0xFF1B366D)
              ],
              stops: [0, 0.8, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 26),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: CreateGameWidget(),
                          );
                        },
                      );
                    },
                    text: 'Create Game',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: JoinGameWidget(),
                        );
                      },
                    );
                  },
                  text: 'Join Game',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 55,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  showLoadingIndicator: false,
                ),
                Spacer(),
                Image.asset(
                  'assets/images/spy_logo.png',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
