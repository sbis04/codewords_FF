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
import 'host_page_model.dart';
export 'host_page_model.dart';

class HostPageWidget extends StatefulWidget {
  const HostPageWidget({
    Key? key,
    this.roomDetails,
  }) : super(key: key);

  final RoomRecord? roomDetails;

  @override
  _HostPageWidgetState createState() => _HostPageWidgetState();
}

class _HostPageWidgetState extends State<HostPageWidget> {
  late HostPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HostPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HostPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        floatingActionButton: Visibility(
          visible: !_model.isLoading,
          child: Builder(
            builder: (context) => StreamBuilder<List<PlayersRecord>>(
              stream: queryPlayersRecord(
                parent: widget.roomDetails!.reference,
                queryBuilder: (playersRecord) =>
                    playersRecord.where('uid', isEqualTo: currentUserUid),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                List<PlayersRecord> floatingActionButtonPlayersRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final floatingActionButtonPlayersRecord =
                    floatingActionButtonPlayersRecordList.isNotEmpty
                        ? floatingActionButtonPlayersRecordList.first
                        : null;
                return FloatingActionButton.extended(
                  onPressed: () async {
                    logFirebaseEvent(
                        'HOST_FloatingActionButton_zb5ymbri_ON_TA');
                    setState(() {
                      _model.isLoading = true;
                    });
                    showAlignedDialog(
                      barrierColor: FlutterFlowTheme.of(context).accent2,
                      barrierDismissible: false,
                      context: context,
                      isGlobal: true,
                      avoidOverflow: false,
                      targetAnchor: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      followerAnchor: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_unfocusNode),
                            child: LoadingDialogWidget(),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));

                    await actions.initWords();
                    _model.initialWords = await actions.generateBoardWords(
                      FFAppState().words.toList(),
                    );
                    if (widget.roomDetails!.isAiSpymaster) {
                      _model.AITimer = InstantTimer.periodic(
                        duration: Duration(milliseconds: 10000),
                        callback: (timer) async {
                          _model.aIOutput =
                              await AISpymasterGroup.getClueCall.call(
                            apiKey: FFAppState().apiKey,
                            systemPrompt: functions.createAISystemPrompt(
                                _model.initialWords!.toList(), true),
                            userPrompt: functions.createAIUserPrompt(
                                _model.initialWords!.toList()),
                            modelName: FFAppState().modelName,
                          );
                          if ((_model.aIOutput?.succeeded ?? true)) {
                            _model.AITimer?.cancel();

                            final roomUpdateData1 = {
                              ...createRoomRecordData(
                                isStarted: true,
                                isBlueGuessing: true,
                                isRedGuessing: false,
                                redWordsLeft: 8,
                                blueWordsLeft: 9,
                                isRedWinner: false,
                                isBlueWinner: false,
                                currentTurn: 1,
                              ),
                              'words': _model.initialWords,
                              'clues': FieldValue.arrayUnion([
                                getClueDataFirestoreData(
                                  updateClueDataStruct(
                                    ClueDataStruct(
                                      clue: AISpymasterGroup.getClueCall
                                          .rawClue(
                                            (_model.aIOutput?.jsonBody ?? ''),
                                          )
                                          .toString(),
                                      turn: 1,
                                      isForBlue: true,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            };
                            await widget.roomDetails!.reference
                                .update(roomUpdateData1);
                          }
                        },
                        startImmediately: true,
                      );
                    } else {
                      final roomUpdateData2 = {
                        ...createRoomRecordData(
                          isStarted: true,
                          isBlueGuessing: true,
                          isRedGuessing: false,
                          redWordsLeft: 8,
                          blueWordsLeft: 9,
                          isRedWinner: false,
                          isBlueWinner: false,
                          currentTurn: 1,
                        ),
                        'words': _model.initialWords,
                      };
                      await widget.roomDetails!.reference
                          .update(roomUpdateData2);
                    }

                    setState(() {
                      _model.isLoading = false;
                    });
                    Navigator.pop(context);
                    if (floatingActionButtonPlayersRecord!.isSpymaster) {
                      context.goNamed(
                        'SpyView',
                        queryParameters: {
                          'roomCode': serializeParam(
                            widget.roomDetails!.code,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    } else {
                      context.goNamed(
                        'FieldOperativesView',
                        queryParameters: {
                          'roomCode': serializeParam(
                            widget.roomDetails!.code,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    }

                    setState(() {});
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  label: Text(
                    'Start game',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                  ),
                );
              },
            ),
          ),
        ),
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                    color: FlutterFlowTheme.of(context).primaryText),
                automaticallyImplyLeading: true,
                title: Text(
                  'Codewords',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 30.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HOST',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.0,
                                  ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOST_PAGE_PAGE_Icon_j5eqxctv_ON_TAP');
                                await widget.roomDetails!.reference.delete();

                                context.pushNamed(
                                  'CreateJoinScreen',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Color(0xFFFF434C),
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Your name: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Joinning code: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Text(
                                widget.roomDetails!.code.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Text(
                            'Share this code with your friends to let them join this session.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0x7F101213),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        StreamBuilder<List<PlayersRecord>>(
                          stream: queryPlayersRecord(
                            parent: widget.roomDetails!.reference,
                            queryBuilder: (playersRecord) => playersRecord
                                .where('uid', isEqualTo: currentUserUid),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              );
                            }
                            List<PlayersRecord>
                                joinningButtonsPlayersRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final joinningButtonsPlayersRecord =
                                joinningButtonsPlayersRecordList.isNotEmpty
                                    ? joinningButtonsPlayersRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (!joinningButtonsPlayersRecord!
                                    .isTeamSelected)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOST_PAGE_PAGE_JOIN_RED_TEAM_BTN_ON_TAP');

                                                final playersUpdateData =
                                                    createPlayersRecordData(
                                                  isBlue: false,
                                                  isSpymaster: false,
                                                  isTeamSelected: true,
                                                );
                                                await joinningButtonsPlayersRecord!
                                                    .reference
                                                    .update(playersUpdateData);
                                              },
                                              text: 'Join Red team',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOST_PAGE_PAGE_JOIN_BLUE_TEAM_BTN_ON_TAP');

                                                final playersUpdateData =
                                                    createPlayersRecordData(
                                                  isBlue: true,
                                                  isSpymaster: false,
                                                  isTeamSelected: true,
                                                );
                                                await joinningButtonsPlayersRecord!
                                                    .reference
                                                    .update(playersUpdateData);
                                              },
                                              text: 'Join Blue team',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (!joinningButtonsPlayersRecord!
                                        .isTeamSelected &&
                                    !widget.roomDetails!.isAiSpymaster)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOST_BECOME_SPY_MASTER_BTN_ON_TAP');

                                                final playersUpdateData =
                                                    createPlayersRecordData(
                                                  isBlue: false,
                                                  isSpymaster: true,
                                                  isTeamSelected: true,
                                                );
                                                await joinningButtonsPlayersRecord!
                                                    .reference
                                                    .update(playersUpdateData);
                                              },
                                              text: 'become spy master',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOST_BECOME_SPY_MASTER_BTN_ON_TAP');

                                                final playersUpdateData =
                                                    createPlayersRecordData(
                                                  isBlue: true,
                                                  isSpymaster: true,
                                                  isTeamSelected: true,
                                                );
                                                await joinningButtonsPlayersRecord!
                                                    .reference
                                                    .update(playersUpdateData);
                                              },
                                              text: 'become spy master',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (joinningButtonsPlayersRecord!
                                        .isTeamSelected)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HOST_PAGE_PAGE_CHANGE_TEAM_BTN_ON_TAP');

                                              final playersUpdateData =
                                                  createPlayersRecordData(
                                                isTeamSelected: false,
                                              );
                                              await joinningButtonsPlayersRecord!
                                                  .reference
                                                  .update(playersUpdateData);
                                            },
                                            text: 'Change Team',
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              hoverBorderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              hoverTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              hoverElevation: 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        Divider(
                          thickness: 2.0,
                          color: Color(0x4C000000),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Text(
                            'Blue team',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 24.0,
                                ),
                          ),
                        ),
                        StreamBuilder<List<PlayersRecord>>(
                          stream: queryPlayersRecord(
                            parent: widget.roomDetails!.reference,
                            queryBuilder: (playersRecord) => playersRecord
                                .where('is_team_selected', isEqualTo: true)
                                .where('is_blue', isEqualTo: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              );
                            }
                            List<PlayersRecord> columnPlayersRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(columnPlayersRecordList.length,
                                      (columnIndex) {
                                final columnPlayersRecord =
                                    columnPlayersRecordList[columnIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        columnPlayersRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                    if (columnPlayersRecord.isSpymaster)
                                      FaIcon(
                                        FontAwesomeIcons.hatCowboy,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                    if (columnPlayersRecord.isTeamSelected)
                                      FaIcon(
                                        FontAwesomeIcons.solidCheckCircle,
                                        color: Color(0xFF1DDE10),
                                        size: 20.0,
                                      ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Text(
                            'Red team',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 24.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: StreamBuilder<List<PlayersRecord>>(
                            stream: queryPlayersRecord(
                              parent: widget.roomDetails!.reference,
                              queryBuilder: (playersRecord) => playersRecord
                                  .where('is_team_selected', isEqualTo: true)
                                  .where('is_blue', isEqualTo: false),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<PlayersRecord> columnPlayersRecordList =
                                  snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnPlayersRecordList.length,
                                    (columnIndex) {
                                  final columnPlayersRecord =
                                      columnPlayersRecordList[columnIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          columnPlayersRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      if (columnPlayersRecord.isSpymaster)
                                        FaIcon(
                                          FontAwesomeIcons.hatCowboy,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 20.0,
                                        ),
                                      if (columnPlayersRecord.isTeamSelected)
                                        FaIcon(
                                          FontAwesomeIcons.solidCheckCircle,
                                          color: Color(0xFF1DDE10),
                                          size: 20.0,
                                        ),
                                    ],
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Codewords',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 36.0,
                                  ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 32.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'HOST',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 24.0,
                                                      ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOST_PAGE_PAGE_Icon_ig4i2spg_ON_TAP');
                                                await widget
                                                    .roomDetails!.reference
                                                    .delete();

                                                context.pushNamed(
                                                  'CreateJoinScreen',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .leftToRight,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete_outline,
                                                color: Color(0xFFFF434C),
                                                size: 30.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Your name: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                currentUserDisplayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Joinning code: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Text(
                                                widget.roomDetails!.code
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            'Share this code with your friends to let them join this session.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0x7F101213),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        StreamBuilder<List<PlayersRecord>>(
                                          stream: queryPlayersRecord(
                                            parent:
                                                widget.roomDetails!.reference,
                                            queryBuilder: (playersRecord) =>
                                                playersRecord.where('uid',
                                                    isEqualTo: currentUserUid),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: LinearProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              );
                                            }
                                            List<PlayersRecord>
                                                joinningButtonsPlayersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final joinningButtonsPlayersRecord =
                                                joinningButtonsPlayersRecordList
                                                        .isNotEmpty
                                                    ? joinningButtonsPlayersRecordList
                                                        .first
                                                    : null;
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (!joinningButtonsPlayersRecord!
                                                    .isTeamSelected)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'HOST_PAGE_PAGE_JOIN_RED_TEAM_BTN_ON_TAP');

                                                                final playersUpdateData =
                                                                    createPlayersRecordData(
                                                                  isBlue: false,
                                                                  isSpymaster:
                                                                      false,
                                                                  isTeamSelected:
                                                                      true,
                                                                );
                                                                await joinningButtonsPlayersRecord!
                                                                    .reference
                                                                    .update(
                                                                        playersUpdateData);
                                                              },
                                                              text:
                                                                  'Join Red team',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 50.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'HOST_PAGE_PAGE_JOIN_BLUE_TEAM_BTN_ON_TAP');

                                                                final playersUpdateData =
                                                                    createPlayersRecordData(
                                                                  isBlue: true,
                                                                  isSpymaster:
                                                                      false,
                                                                  isTeamSelected:
                                                                      true,
                                                                );
                                                                await joinningButtonsPlayersRecord!
                                                                    .reference
                                                                    .update(
                                                                        playersUpdateData);
                                                              },
                                                              text:
                                                                  'Join Blue team',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 50.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (!joinningButtonsPlayersRecord!
                                                        .isTeamSelected &&
                                                    !widget.roomDetails!
                                                        .isAiSpymaster)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'HOST_BECOME_SPY_MASTER_BTN_ON_TAP');

                                                                final playersUpdateData =
                                                                    createPlayersRecordData(
                                                                  isBlue: false,
                                                                  isSpymaster:
                                                                      true,
                                                                  isTeamSelected:
                                                                      true,
                                                                );
                                                                await joinningButtonsPlayersRecord!
                                                                    .reference
                                                                    .update(
                                                                        playersUpdateData);
                                                              },
                                                              text:
                                                                  'become spy master',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 30.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'HOST_BECOME_SPY_MASTER_BTN_ON_TAP');

                                                                final playersUpdateData =
                                                                    createPlayersRecordData(
                                                                  isBlue: true,
                                                                  isSpymaster:
                                                                      true,
                                                                  isTeamSelected:
                                                                      true,
                                                                );
                                                                await joinningButtonsPlayersRecord!
                                                                    .reference
                                                                    .update(
                                                                        playersUpdateData);
                                                              },
                                                              text:
                                                                  'become spy master',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 30.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (joinningButtonsPlayersRecord!
                                                        .isTeamSelected)
                                                      Expanded(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOST_PAGE_PAGE_CHANGE_TEAM_BTN_ON_TAP');

                                                            final playersUpdateData =
                                                                createPlayersRecordData(
                                                              isTeamSelected:
                                                                  false,
                                                            );
                                                            await joinningButtonsPlayersRecord!
                                                                .reference
                                                                .update(
                                                                    playersUpdateData);
                                                          },
                                                          text: 'Change team',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 130.0,
                                                            height: 45.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Text(
                                                'Blue team',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 24.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<PlayersRecord>>(
                                                stream: queryPlayersRecord(
                                                  parent: widget
                                                      .roomDetails!.reference,
                                                  queryBuilder: (playersRecord) =>
                                                      playersRecord
                                                          .where(
                                                              'is_team_selected',
                                                              isEqualTo: true)
                                                          .where('is_blue',
                                                              isEqualTo: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child:
                                                            SpinKitFadingGrid(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PlayersRecord>
                                                      columnPlayersRecordList =
                                                      snapshot.data!;
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnPlayersRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnPlayersRecord =
                                                            columnPlayersRecordList[
                                                                columnIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                columnPlayersRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (columnPlayersRecord
                                                                .isSpymaster)
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .hatCowboy,
                                                                color: Color(
                                                                    0xCDFFFFFF),
                                                                size: 20.0,
                                                              ),
                                                            if (columnPlayersRecord
                                                                .isTeamSelected)
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidCheckCircle,
                                                                color: Color(
                                                                    0xFF1DDE10),
                                                                size: 20.0,
                                                              ),
                                                          ],
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Text(
                                                'Red team',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 24.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<PlayersRecord>>(
                                                stream: queryPlayersRecord(
                                                  parent: widget
                                                      .roomDetails!.reference,
                                                  queryBuilder: (playersRecord) =>
                                                      playersRecord
                                                          .where(
                                                              'is_team_selected',
                                                              isEqualTo: true)
                                                          .where('is_blue',
                                                              isEqualTo: false),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child:
                                                            SpinKitFadingGrid(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PlayersRecord>
                                                      columnPlayersRecordList =
                                                      snapshot.data!;
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnPlayersRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnPlayersRecord =
                                                            columnPlayersRecordList[
                                                                columnIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                columnPlayersRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (columnPlayersRecord
                                                                .isSpymaster)
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .hatCowboy,
                                                                color: Color(
                                                                    0xCBFFFFFF),
                                                                size: 20.0,
                                                              ),
                                                            if (columnPlayersRecord
                                                                .isTeamSelected)
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidCheckCircle,
                                                                color: Color(
                                                                    0xFF1DDE10),
                                                                size: 20.0,
                                                              ),
                                                          ],
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
