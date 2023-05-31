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
import 'game_mode_dialog_model.dart';
export 'game_mode_dialog_model.dart';

class GameModeDialogWidget extends StatefulWidget {
  const GameModeDialogWidget({Key? key}) : super(key: key);

  @override
  _GameModeDialogWidgetState createState() => _GameModeDialogWidgetState();
}

class _GameModeDialogWidgetState extends State<GameModeDialogWidget> {
  late GameModeDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameModeDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (!_model.isCreating)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: 600.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select a game mode',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 16.0),
                        child: Text(
                          'You won\'t be able to modify this once a session is created. AI Mode uses an AI-based spymaster for both teams.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0x7F101213),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'GAME_MODE_DIALOG_Container_qyxgqhof_ON_T');
                                    setState(() {
                                      _model.isCreating = true;
                                    });

                                    final roomCreateData = createRoomRecordData(
                                      code: functions.generateRoomCode(),
                                      host: currentUserUid,
                                      isAiSpymaster: false,
                                      createdAt: getCurrentTimestamp,
                                    );
                                    var roomRecordReference =
                                        RoomRecord.collection.doc();
                                    await roomRecordReference
                                        .set(roomCreateData);
                                    _model.roomDetails =
                                        RoomRecord.getDocumentFromData(
                                            roomCreateData,
                                            roomRecordReference);

                                    final playersCreateData =
                                        createPlayersRecordData(
                                      name: currentUserDisplayName,
                                      isTeamSelected: false,
                                      uid: currentUserUid,
                                    );
                                    var playersRecordReference =
                                        PlayersRecord.createDoc(
                                            _model.roomDetails!.reference);
                                    await playersRecordReference
                                        .set(playersCreateData);
                                    _model.playerDocument =
                                        PlayersRecord.getDocumentFromData(
                                            playersCreateData,
                                            playersRecordReference);
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'HostPage',
                                      queryParameters: {
                                        'roomDetails': serializeParam(
                                          _model.roomDetails,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'roomDetails': _model.roomDetails,
                                      },
                                    );

                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 16.0, 10.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/spy_logo.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'REGULAR MODE',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'GAME_MODE_DIALOG_Container_y6i0q3me_ON_T');
                                    setState(() {
                                      _model.isCreating = true;
                                    });

                                    final roomCreateData = createRoomRecordData(
                                      code: functions.generateRoomCode(),
                                      host: currentUserUid,
                                      isAiSpymaster: true,
                                      createdAt: getCurrentTimestamp,
                                    );
                                    var roomRecordReference =
                                        RoomRecord.collection.doc();
                                    await roomRecordReference
                                        .set(roomCreateData);
                                    _model.roomDetailsAI =
                                        RoomRecord.getDocumentFromData(
                                            roomCreateData,
                                            roomRecordReference);

                                    final playersCreateData1 =
                                        createPlayersRecordData(
                                      name: currentUserDisplayName,
                                      isTeamSelected: false,
                                      uid: currentUserUid,
                                    );
                                    var playersRecordReference1 =
                                        PlayersRecord.createDoc(
                                            _model.roomDetailsAI!.reference);
                                    await playersRecordReference1
                                        .set(playersCreateData1);
                                    _model.playerDocumentUser =
                                        PlayersRecord.getDocumentFromData(
                                            playersCreateData1,
                                            playersRecordReference1);

                                    final playersCreateData2 =
                                        createPlayersRecordData(
                                      name: 'AI Spymaster',
                                      isTeamSelected: true,
                                      isBlue: true,
                                      isSpymaster: true,
                                    );
                                    var playersRecordReference2 =
                                        PlayersRecord.createDoc(
                                            _model.roomDetailsAI!.reference);
                                    await playersRecordReference2
                                        .set(playersCreateData2);
                                    _model.spymasterBlueAI =
                                        PlayersRecord.getDocumentFromData(
                                            playersCreateData2,
                                            playersRecordReference2);

                                    final playersCreateData3 =
                                        createPlayersRecordData(
                                      name: 'AI Spymaster',
                                      isTeamSelected: true,
                                      isBlue: false,
                                      isSpymaster: true,
                                    );
                                    var playersRecordReference3 =
                                        PlayersRecord.createDoc(
                                            _model.roomDetailsAI!.reference);
                                    await playersRecordReference3
                                        .set(playersCreateData3);
                                    _model.spymasterRedAI =
                                        PlayersRecord.getDocumentFromData(
                                            playersCreateData3,
                                            playersRecordReference3);
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'HostPage',
                                      queryParameters: {
                                        'roomDetails': serializeParam(
                                          _model.roomDetailsAI,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'roomDetails': _model.roomDetailsAI,
                                      },
                                    );

                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 16.0, 10.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/ai_spy_logo.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'AI MODE',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_model.isCreating)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Container(
              width: 600.0,
              height: 160.0,
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child: custom_widgets.CircularIndicator(
                      width: 50.0,
                      height: 50.0,
                      color: FlutterFlowTheme.of(context).primary,
                      thickness: 4.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
