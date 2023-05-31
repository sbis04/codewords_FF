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
import 'field_operatives_view_model.dart';
export 'field_operatives_view_model.dart';

class FieldOperativesViewWidget extends StatefulWidget {
  const FieldOperativesViewWidget({
    Key? key,
    this.roomCode,
  }) : super(key: key);

  final int? roomCode;

  @override
  _FieldOperativesViewWidgetState createState() =>
      _FieldOperativesViewWidgetState();
}

class _FieldOperativesViewWidgetState extends State<FieldOperativesViewWidget>
    with TickerProviderStateMixin {
  late FieldOperativesViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.5,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.5,
          end: 0.0,
        ),
      ],
    ),
    'gridViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.98, 0.98),
        ),
        ScaleEffect(
          curve: Curves.easeIn,
          delay: 120.ms,
          duration: 120.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.02, 1.02),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(43.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.5,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.5,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldOperativesViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FieldOperativesView'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<List<RoomRecord>>(
      stream: queryRoomRecord(
        queryBuilder: (roomRecord) =>
            roomRecord.where('code', isEqualTo: widget.roomCode),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<RoomRecord> fieldOperativesViewRoomRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final fieldOperativesViewRoomRecord =
            fieldOperativesViewRoomRecordList.isNotEmpty
                ? fieldOperativesViewRoomRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            endDrawer: Drawer(
              elevation: 16.0,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'FIELD_OPERATIVES_VIEW_arrow_back_ios_rou');
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 0.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'FIELD_OPERATIVES_VIEW_Text_slfauhmd_ON_T');

                                  context.goNamed(
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
                                child: Text(
                                  'Leave game',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0x4C000000),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 24.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Text(
                                  'Blue team',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 24.0,
                                      ),
                                ),
                              ),
                              StreamBuilder<List<PlayersRecord>>(
                                stream: queryPlayersRecord(
                                  parent:
                                      fieldOperativesViewRoomRecord!.reference,
                                  queryBuilder: (playersRecord) => playersRecord
                                      .where('is_team_selected',
                                          isEqualTo: true)
                                      .where('is_blue', isEqualTo: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: LinearProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              columnPlayersRecord.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ),
                                          if (columnPlayersRecord.isSpymaster)
                                            FaIcon(
                                              FontAwesomeIcons.hatCowboy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 24.0,
                                      ),
                                ),
                              ),
                              StreamBuilder<List<PlayersRecord>>(
                                stream: queryPlayersRecord(
                                  parent:
                                      fieldOperativesViewRoomRecord!.reference,
                                  queryBuilder: (playersRecord) => playersRecord
                                      .where('is_team_selected',
                                          isEqualTo: true)
                                      .where('is_blue', isEqualTo: false),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: LinearProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              columnPlayersRecord.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ),
                                          if (columnPlayersRecord.isSpymaster)
                                            FaIcon(
                                              FontAwesomeIcons.hatCowboy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 20.0,
                                            ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<PlayersRecord>>(
                stream: queryPlayersRecord(
                  parent: fieldOperativesViewRoomRecord!.reference,
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
                  List<PlayersRecord> stackPlayersRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final stackPlayersRecord = stackPlayersRecordList.isNotEmpty
                      ? stackPlayersRecordList.first
                      : null;
                  return Stack(
                    children: [
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Code: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            widget.roomCode!.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Codewords',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 30.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Your name: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      currentUserDisplayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  if (stackPlayersRecord!
                                                      .isBlue)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'BLUE TEAM',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  if (!stackPlayersRecord!
                                                      .isBlue)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'RED TEAM',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: Icon(
                                              Icons.people_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'FIELD_OPERATIVES_VIEW_people_rounded_ICN');
                                              scaffoldKey.currentState!
                                                  .openEndDrawer();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Words Left',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              fieldOperativesViewRoomRecord!
                                                  .blueWordsLeft
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 24.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              '-',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            fieldOperativesViewRoomRecord!
                                                .redWordsLeft
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 24.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (fieldOperativesViewRoomRecord!
                                        .isRedGuessing)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (fieldOperativesViewRoomRecord!
                                                      .isAiSpymaster &&
                                                  (fieldOperativesViewRoomRecord!
                                                          .currentTurn ==
                                                      fieldOperativesViewRoomRecord!
                                                          .clues.length) &&
                                                  !fieldOperativesViewRoomRecord!
                                                      .clues[
                                                          fieldOperativesViewRoomRecord!
                                                                  .currentTurn -
                                                              1]
                                                      .isForBlue)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    fieldOperativesViewRoomRecord!
                                                        .clues[
                                                            fieldOperativesViewRoomRecord!
                                                                    .currentTurn -
                                                                1]
                                                        .clue,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 24.0,
                                                        ),
                                                  ),
                                                ),
                                              if (fieldOperativesViewRoomRecord!
                                                      .isAiSpymaster &&
                                                  (fieldOperativesViewRoomRecord!
                                                          .currentTurn !=
                                                      fieldOperativesViewRoomRecord!
                                                          .clues.length))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Thinking...',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 24.0,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation1']!),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Red team is guessing...',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                if (functions.shouldShowEndTurn(
                                                    stackPlayersRecord!.isBlue,
                                                    fieldOperativesViewRoomRecord!
                                                        .isRedGuessing,
                                                    fieldOperativesViewRoomRecord!
                                                        .isBlueGuessing,
                                                    stackPlayersRecord!
                                                        .isSpymaster))
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'FIELD_OPERATIVES_VIEW_END_TURN_BTN_ON_TA');

                                                      final roomUpdateData1 = {
                                                        ...createRoomRecordData(
                                                          isRedGuessing: false,
                                                          isBlueGuessing: true,
                                                        ),
                                                        'current_turn':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await fieldOperativesViewRoomRecord!
                                                          .reference
                                                          .update(
                                                              roomUpdateData1);
                                                      if (fieldOperativesViewRoomRecord!
                                                          .isAiSpymaster) {
                                                        _model.blueAITimer =
                                                            InstantTimer
                                                                .periodic(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  10000),
                                                          callback:
                                                              (timer) async {
                                                            _model.blueAIOutput =
                                                                await AISpymasterGroup
                                                                    .getClueCall
                                                                    .call(
                                                              apiKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                              systemPrompt: functions
                                                                  .createAISystemPrompt(
                                                                      fieldOperativesViewRoomRecord!
                                                                          .words
                                                                          .toList(),
                                                                      true),
                                                              userPrompt: functions
                                                                  .createAIUserPrompt(
                                                                      fieldOperativesViewRoomRecord!
                                                                          .words
                                                                          .toList()),
                                                              modelName:
                                                                  FFAppState()
                                                                      .modelName,
                                                            );
                                                            if ((_model
                                                                    .blueAIOutput
                                                                    ?.succeeded ??
                                                                true)) {
                                                              _model.blueAITimer
                                                                  ?.cancel();

                                                              final roomUpdateData2 =
                                                                  {
                                                                'clues': FieldValue
                                                                    .arrayUnion([
                                                                  getClueDataFirestoreData(
                                                                    updateClueDataStruct(
                                                                      ClueDataStruct(
                                                                        clue: AISpymasterGroup
                                                                            .getClueCall
                                                                            .rawClue(
                                                                              (_model.blueAIOutput?.jsonBody ?? ''),
                                                                            )
                                                                            .toString(),
                                                                        turn: fieldOperativesViewRoomRecord!
                                                                            .currentTurn,
                                                                        isForBlue:
                                                                            true,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                    true,
                                                                  )
                                                                ]),
                                                              };
                                                              await fieldOperativesViewRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      roomUpdateData2);
                                                            }
                                                          },
                                                          startImmediately:
                                                              true,
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'End turn',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (fieldOperativesViewRoomRecord!
                                        .isBlueGuessing)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (fieldOperativesViewRoomRecord!
                                                      .isAiSpymaster &&
                                                  (fieldOperativesViewRoomRecord!
                                                          .currentTurn ==
                                                      fieldOperativesViewRoomRecord!
                                                          .clues.length) &&
                                                  fieldOperativesViewRoomRecord!
                                                      .clues[
                                                          fieldOperativesViewRoomRecord!
                                                                  .currentTurn -
                                                              1]
                                                      .isForBlue)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    fieldOperativesViewRoomRecord!
                                                        .clues[
                                                            fieldOperativesViewRoomRecord!
                                                                    .currentTurn -
                                                                1]
                                                        .clue,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 24.0,
                                                        ),
                                                  ),
                                                ),
                                              if (fieldOperativesViewRoomRecord!
                                                      .isAiSpymaster &&
                                                  (fieldOperativesViewRoomRecord!
                                                          .currentTurn !=
                                                      fieldOperativesViewRoomRecord!
                                                          .clues.length))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Thinking...',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 24.0,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation2']!),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Blue team is guessing...',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                if (functions.shouldShowEndTurn(
                                                    stackPlayersRecord!.isBlue,
                                                    fieldOperativesViewRoomRecord!
                                                        .isRedGuessing,
                                                    fieldOperativesViewRoomRecord!
                                                        .isBlueGuessing,
                                                    stackPlayersRecord!
                                                        .isSpymaster))
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'FIELD_OPERATIVES_VIEW_END_TURN_BTN_ON_TA');

                                                      final roomUpdateData1 = {
                                                        ...createRoomRecordData(
                                                          isRedGuessing: true,
                                                          isBlueGuessing: false,
                                                        ),
                                                        'current_turn':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await fieldOperativesViewRoomRecord!
                                                          .reference
                                                          .update(
                                                              roomUpdateData1);
                                                      if (fieldOperativesViewRoomRecord!
                                                          .isAiSpymaster) {
                                                        _model.redAITimer =
                                                            InstantTimer
                                                                .periodic(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  10000),
                                                          callback:
                                                              (timer) async {
                                                            _model.redAIOutput =
                                                                await AISpymasterGroup
                                                                    .getClueCall
                                                                    .call(
                                                              apiKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                              systemPrompt: functions
                                                                  .createAISystemPrompt(
                                                                      fieldOperativesViewRoomRecord!
                                                                          .words
                                                                          .toList(),
                                                                      false),
                                                              userPrompt: functions
                                                                  .createAIUserPrompt(
                                                                      fieldOperativesViewRoomRecord!
                                                                          .words
                                                                          .toList()),
                                                              modelName:
                                                                  FFAppState()
                                                                      .modelName,
                                                            );
                                                            if ((_model
                                                                    .redAIOutput
                                                                    ?.succeeded ??
                                                                true)) {
                                                              _model.redAITimer
                                                                  ?.cancel();

                                                              final roomUpdateData2 =
                                                                  {
                                                                'clues': FieldValue
                                                                    .arrayUnion([
                                                                  getClueDataFirestoreData(
                                                                    updateClueDataStruct(
                                                                      ClueDataStruct(
                                                                        clue: AISpymasterGroup
                                                                            .getClueCall
                                                                            .rawClue(
                                                                              (_model.redAIOutput?.jsonBody ?? ''),
                                                                            )
                                                                            .toString(),
                                                                        turn: fieldOperativesViewRoomRecord!
                                                                            .currentTurn,
                                                                        isForBlue:
                                                                            false,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                    true,
                                                                  )
                                                                ]),
                                                              };
                                                              await fieldOperativesViewRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      roomUpdateData2);
                                                            }
                                                          },
                                                          startImmediately:
                                                              true,
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'End turn',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 16.0, 4.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final retrievedWords =
                                              fieldOperativesViewRoomRecord!
                                                  .words
                                                  .toList();
                                          if (retrievedWords.isEmpty) {
                                            return LoadingWidgetWidget();
                                          }
                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              crossAxisSpacing: 2.0,
                                              mainAxisSpacing: 4.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: retrievedWords.length,
                                            itemBuilder:
                                                (context, retrievedWordsIndex) {
                                              final retrievedWordsItem =
                                                  retrievedWords[
                                                      retrievedWordsIndex];
                                              return Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'FIELD_OPERATIVES_VIEW_WhiteContainer_ON_');
                                                        _model.updatedWordsList =
                                                            await actions
                                                                .wordTapped(
                                                          retrievedWordsIndex,
                                                          fieldOperativesViewRoomRecord!
                                                              .words
                                                              .toList(),
                                                        );
                                                        _model.wordsLeftJson =
                                                            await actions
                                                                .calculateWordsLeft(
                                                          _model
                                                              .updatedWordsList!
                                                              .toList(),
                                                        );
                                                        _model.wordColor =
                                                            await actions
                                                                .getWordColor(
                                                          retrievedWordsIndex,
                                                          _model
                                                              .updatedWordsList!
                                                              .toList(),
                                                        );
                                                        if (_model.wordColor ==
                                                            'n') {
                                                          if (fieldOperativesViewRoomRecord!
                                                              .isRedGuessing) {
                                                            final roomUpdateData1 =
                                                                {
                                                              ...createRoomRecordData(
                                                                redWordsLeft:
                                                                    getJsonField(
                                                                  _model
                                                                      .wordsLeftJson,
                                                                  r'''$.red''',
                                                                ),
                                                                blueWordsLeft:
                                                                    getJsonField(
                                                                  _model
                                                                      .wordsLeftJson,
                                                                  r'''$.blue''',
                                                                ),
                                                                isRedGuessing:
                                                                    false,
                                                                isBlueGuessing:
                                                                    true,
                                                              ),
                                                              'words': _model
                                                                  .updatedWordsList,
                                                              'current_turn':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            };
                                                            await fieldOperativesViewRoomRecord!
                                                                .reference
                                                                .update(
                                                                    roomUpdateData1);
                                                            if (fieldOperativesViewRoomRecord!
                                                                .isAiSpymaster) {
                                                              _model.redNeutralAITimer =
                                                                  InstantTimer
                                                                      .periodic(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        10000),
                                                                callback:
                                                                    (timer) async {
                                                                  _model.redNeutralAIOutput =
                                                                      await AISpymasterGroup
                                                                          .getClueCall
                                                                          .call(
                                                                    apiKey: FFAppState()
                                                                        .apiKey,
                                                                    systemPrompt: functions.createAISystemPrompt(
                                                                        fieldOperativesViewRoomRecord!
                                                                            .words
                                                                            .toList(),
                                                                        true),
                                                                    userPrompt: functions.createAIUserPrompt(
                                                                        fieldOperativesViewRoomRecord!
                                                                            .words
                                                                            .toList()),
                                                                    modelName:
                                                                        FFAppState()
                                                                            .modelName,
                                                                  );
                                                                  if ((_model
                                                                          .redNeutralAIOutput
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model
                                                                        .redNeutralAITimer
                                                                        ?.cancel();

                                                                    final roomUpdateData2 =
                                                                        {
                                                                      'clues':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getClueDataFirestoreData(
                                                                          updateClueDataStruct(
                                                                            ClueDataStruct(
                                                                              clue: AISpymasterGroup.getClueCall
                                                                                  .rawClue(
                                                                                    (_model.redNeutralAIOutput?.jsonBody ?? ''),
                                                                                  )
                                                                                  .toString(),
                                                                              turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                              isForBlue: true,
                                                                            ),
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    };
                                                                    await fieldOperativesViewRoomRecord!
                                                                        .reference
                                                                        .update(
                                                                            roomUpdateData2);
                                                                  }
                                                                },
                                                                startImmediately:
                                                                    true,
                                                              );
                                                            }
                                                          } else {
                                                            final roomUpdateData3 =
                                                                {
                                                              ...createRoomRecordData(
                                                                redWordsLeft:
                                                                    getJsonField(
                                                                  _model
                                                                      .wordsLeftJson,
                                                                  r'''$.red''',
                                                                ),
                                                                blueWordsLeft:
                                                                    getJsonField(
                                                                  _model
                                                                      .wordsLeftJson,
                                                                  r'''$.blue''',
                                                                ),
                                                                isRedGuessing:
                                                                    true,
                                                                isBlueGuessing:
                                                                    false,
                                                              ),
                                                              'words': _model
                                                                  .updatedWordsList,
                                                              'current_turn':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            };
                                                            await fieldOperativesViewRoomRecord!
                                                                .reference
                                                                .update(
                                                                    roomUpdateData3);
                                                            if (fieldOperativesViewRoomRecord!
                                                                .isAiSpymaster) {
                                                              _model.blueNeutralAITimer =
                                                                  InstantTimer
                                                                      .periodic(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        10000),
                                                                callback:
                                                                    (timer) async {
                                                                  _model.blueNeutralAIOutput =
                                                                      await AISpymasterGroup
                                                                          .getClueCall
                                                                          .call(
                                                                    apiKey: FFAppState()
                                                                        .apiKey,
                                                                    systemPrompt: functions.createAISystemPrompt(
                                                                        fieldOperativesViewRoomRecord!
                                                                            .words
                                                                            .toList(),
                                                                        false),
                                                                    userPrompt: functions.createAIUserPrompt(
                                                                        fieldOperativesViewRoomRecord!
                                                                            .words
                                                                            .toList()),
                                                                    modelName:
                                                                        FFAppState()
                                                                            .modelName,
                                                                  );
                                                                  if ((_model
                                                                          .blueNeutralAIOutput
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    final roomUpdateData4 =
                                                                        {
                                                                      'clues':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getClueDataFirestoreData(
                                                                          updateClueDataStruct(
                                                                            ClueDataStruct(
                                                                              clue: AISpymasterGroup.getClueCall
                                                                                  .rawClue(
                                                                                    (_model.blueNeutralAIOutput?.jsonBody ?? ''),
                                                                                  )
                                                                                  .toString(),
                                                                              turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                              isForBlue: false,
                                                                            ),
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    };
                                                                    await fieldOperativesViewRoomRecord!
                                                                        .reference
                                                                        .update(
                                                                            roomUpdateData4);
                                                                    _model
                                                                        .blueNeutralAITimer
                                                                        ?.cancel();
                                                                  }
                                                                },
                                                                startImmediately:
                                                                    true,
                                                              );
                                                            }
                                                          }
                                                        } else {
                                                          if (_model
                                                                  .wordColor ==
                                                              'r') {
                                                            if (fieldOperativesViewRoomRecord!
                                                                .isRedGuessing) {
                                                              final roomUpdateData5 =
                                                                  {
                                                                ...createRoomRecordData(
                                                                  redWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.red''',
                                                                  ),
                                                                  blueWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.blue''',
                                                                  ),
                                                                ),
                                                                'words': _model
                                                                    .updatedWordsList,
                                                              };
                                                              await fieldOperativesViewRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      roomUpdateData5);
                                                            } else {
                                                              final roomUpdateData6 =
                                                                  {
                                                                ...createRoomRecordData(
                                                                  redWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.red''',
                                                                  ),
                                                                  blueWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.blue''',
                                                                  ),
                                                                  isRedGuessing:
                                                                      true,
                                                                  isBlueGuessing:
                                                                      false,
                                                                ),
                                                                'words': _model
                                                                    .updatedWordsList,
                                                                'current_turn':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await fieldOperativesViewRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      roomUpdateData6);
                                                              if (fieldOperativesViewRoomRecord!
                                                                  .isAiSpymaster) {
                                                                _model.redEndAITimer =
                                                                    InstantTimer
                                                                        .periodic(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          10000),
                                                                  callback:
                                                                      (timer) async {
                                                                    _model.redEndAIOutput =
                                                                        await AISpymasterGroup
                                                                            .getClueCall
                                                                            .call(
                                                                      apiKey: FFAppState()
                                                                          .apiKey,
                                                                      systemPrompt: functions.createAISystemPrompt(
                                                                          fieldOperativesViewRoomRecord!
                                                                              .words
                                                                              .toList(),
                                                                          false),
                                                                      userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!
                                                                          .words
                                                                          .toList()),
                                                                      modelName:
                                                                          FFAppState()
                                                                              .modelName,
                                                                    );
                                                                    if ((_model
                                                                            .redEndAIOutput
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model
                                                                          .redEndAITimer
                                                                          ?.cancel();

                                                                      final roomUpdateData7 =
                                                                          {
                                                                        'clues':
                                                                            FieldValue.arrayUnion([
                                                                          getClueDataFirestoreData(
                                                                            updateClueDataStruct(
                                                                              ClueDataStruct(
                                                                                clue: AISpymasterGroup.getClueCall
                                                                                    .rawClue(
                                                                                      (_model.redEndAIOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    .toString(),
                                                                                turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                isForBlue: false,
                                                                              ),
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      };
                                                                      await fieldOperativesViewRoomRecord!
                                                                          .reference
                                                                          .update(
                                                                              roomUpdateData7);
                                                                    }
                                                                  },
                                                                  startImmediately:
                                                                      true,
                                                                );
                                                              }
                                                            }
                                                          } else {
                                                            if (fieldOperativesViewRoomRecord!
                                                                .isRedGuessing) {
                                                              final roomUpdateData8 =
                                                                  {
                                                                ...createRoomRecordData(
                                                                  redWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.red''',
                                                                  ),
                                                                  blueWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.blue''',
                                                                  ),
                                                                  isRedGuessing:
                                                                      false,
                                                                  isBlueGuessing:
                                                                      true,
                                                                ),
                                                                'words': _model
                                                                    .updatedWordsList,
                                                                'current_turn':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await fieldOperativesViewRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      roomUpdateData8);
                                                              if (fieldOperativesViewRoomRecord!
                                                                  .isAiSpymaster) {
                                                                _model.blueEndAITimer =
                                                                    InstantTimer
                                                                        .periodic(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          10000),
                                                                  callback:
                                                                      (timer) async {
                                                                    _model.blueEndAIOutput =
                                                                        await AISpymasterGroup
                                                                            .getClueCall
                                                                            .call(
                                                                      apiKey: FFAppState()
                                                                          .apiKey,
                                                                      systemPrompt: functions.createAISystemPrompt(
                                                                          fieldOperativesViewRoomRecord!
                                                                              .words
                                                                              .toList(),
                                                                          true),
                                                                      userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!
                                                                          .words
                                                                          .toList()),
                                                                      modelName:
                                                                          FFAppState()
                                                                              .modelName,
                                                                    );
                                                                    if ((_model
                                                                            .blueEndAIOutput
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model
                                                                          .blueEndAITimer
                                                                          ?.cancel();

                                                                      final roomUpdateData9 =
                                                                          {
                                                                        'clues':
                                                                            FieldValue.arrayUnion([
                                                                          getClueDataFirestoreData(
                                                                            updateClueDataStruct(
                                                                              ClueDataStruct(
                                                                                clue: AISpymasterGroup.getClueCall
                                                                                    .rawClue(
                                                                                      (_model.blueEndAIOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    .toString(),
                                                                                turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                isForBlue: true,
                                                                              ),
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      };
                                                                      await fieldOperativesViewRoomRecord!
                                                                          .reference
                                                                          .update(
                                                                              roomUpdateData9);
                                                                    }
                                                                  },
                                                                  startImmediately:
                                                                      true,
                                                                );
                                                              }
                                                            } else {
                                                              final roomUpdateData10 =
                                                                  {
                                                                ...createRoomRecordData(
                                                                  redWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.red''',
                                                                  ),
                                                                  blueWordsLeft:
                                                                      getJsonField(
                                                                    _model
                                                                        .wordsLeftJson,
                                                                    r'''$.blue''',
                                                                  ),
                                                                ),
                                                                'words': _model
                                                                    .updatedWordsList,
                                                              };
                                                              await fieldOperativesViewRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      roomUpdateData10);
                                                            }
                                                          }
                                                        }

                                                        _model.winner =
                                                            await actions
                                                                .declareWinner(
                                                          getJsonField(
                                                            _model
                                                                .wordsLeftJson,
                                                            r'''$.red''',
                                                          ),
                                                          getJsonField(
                                                            _model
                                                                .wordsLeftJson,
                                                            r'''$.blue''',
                                                          ),
                                                        );
                                                        if (_model.winner ==
                                                            'r') {
                                                          final roomUpdateData11 =
                                                              createRoomRecordData(
                                                            isRedWinner: true,
                                                          );
                                                          await fieldOperativesViewRoomRecord!
                                                              .reference
                                                              .update(
                                                                  roomUpdateData11);
                                                        } else {
                                                          if (_model.winner ==
                                                              'b') {
                                                            final roomUpdateData12 =
                                                                createRoomRecordData(
                                                              isBlueWinner:
                                                                  true,
                                                            );
                                                            await fieldOperativesViewRoomRecord!
                                                                .reference
                                                                .update(
                                                                    roomUpdateData12);
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: () {
                                                            if (functions
                                                                .isNeutralVisible(
                                                                    getJsonField(
                                                                      functions
                                                                          .separateWordDetails(
                                                                              retrievedWordsItem),
                                                                      r'''$.color''',
                                                                    ).toString(),
                                                                    getJsonField(
                                                                      functions
                                                                          .separateWordDetails(
                                                                              retrievedWordsItem),
                                                                      r'''$.is_guessed''',
                                                                    ).toString())) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary;
                                                            } else if (functions
                                                                .isRedVisible(
                                                                    getJsonField(
                                                                      functions
                                                                          .separateWordDetails(
                                                                              retrievedWordsItem),
                                                                      r'''$.color''',
                                                                    ).toString(),
                                                                    getJsonField(
                                                                      functions
                                                                          .separateWordDetails(
                                                                              retrievedWordsItem),
                                                                      r'''$.is_guessed''',
                                                                    ).toString())) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate;
                                                            } else if (functions
                                                                .isBlueVisible(
                                                                    getJsonField(
                                                                      functions
                                                                          .separateWordDetails(
                                                                              retrievedWordsItem),
                                                                      r'''$.color''',
                                                                    ).toString(),
                                                                    getJsonField(
                                                                      functions
                                                                          .separateWordDetails(
                                                                              retrievedWordsItem),
                                                                      r'''$.is_guessed''',
                                                                    ).toString())) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBtnText;
                                                            }
                                                          }(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        16.0,
                                                                        8.0,
                                                                        16.0),
                                                            child: Text(
                                                              getJsonField(
                                                                functions
                                                                    .separateWordDetails(
                                                                        retrievedWordsItem),
                                                                r'''$.word''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      functions.isGuessed(
                                                                              getJsonField(
                                                                        functions
                                                                            .separateWordDetails(retrievedWordsItem),
                                                                        r'''$.is_guessed''',
                                                                      ).toString())
                                                                          ? FlutterFlowTheme.of(context).primaryBtnText
                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (!functions.isCurrentTeamsTurn(
                                                      stackPlayersRecord!
                                                          .isBlue,
                                                      fieldOperativesViewRoomRecord!
                                                          .isBlueGuessing))
                                                    Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x34FFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (fieldOperativesViewRoomRecord!.isRedWinner)
                            Container(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.trophy,
                                            color: Color(0xFFFFB938),
                                            size: 90.0,
                                          ),
                                          Text(
                                            'WINNER',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 36.0,
                                                ),
                                          ),
                                          Text(
                                            'Red Team',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 36.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'FIELD_OPERATIVES_VIEW_START_NEW_GAME_BTN');
                                                FFAppState().update(() {
                                                  FFAppState().words = [];
                                                });

                                                context.pushNamed(
                                                  'CreateJoinScreen',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Start New Game',
                                              options: FFButtonOptions(
                                                width: 200.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0x004B39EF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  width: 4.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                          if (fieldOperativesViewRoomRecord!.isBlueWinner)
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.trophy,
                                            color: Color(0xFFFFB938),
                                            size: 90.0,
                                          ),
                                          Text(
                                            'WINNER',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 36.0,
                                                ),
                                          ),
                                          Text(
                                            'Blue Team',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 36.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'FIELD_OPERATIVES_VIEW_START_NEW_GAME_BTN');
                                                FFAppState().update(() {
                                                  FFAppState().words = [];
                                                });

                                                context.goNamed(
                                                  'CreateJoinScreen',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Start New Game',
                                              options: FFButtonOptions(
                                                width: 200.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0x004B39EF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  width: 4.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                        ],
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 32.0, 32.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Codewords',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 36.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Room Code: ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                    Text(
                                                      widget.roomCode!
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Your name: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  currentUserDisplayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              if (stackPlayersRecord!.isBlue)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'BLUE TEAM',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              if (!stackPlayersRecord!.isBlue)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'RED TEAM',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 16.0, 5.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'FIELD_OPERATIVES_VIEW_Text_11ndxjzy_ON_T');

                                                    context.goNamed(
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
                                                  child: Text(
                                                    'Leave game',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 32.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) {
                                                          final retrievedWords =
                                                              fieldOperativesViewRoomRecord!
                                                                  .words
                                                                  .toList();
                                                          return GridView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 5,
                                                              crossAxisSpacing:
                                                                  2.0,
                                                              mainAxisSpacing:
                                                                  4.0,
                                                              childAspectRatio:
                                                                  1.0,
                                                            ),
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                retrievedWords
                                                                    .length,
                                                            itemBuilder: (context,
                                                                retrievedWordsIndex) {
                                                              final retrievedWordsItem =
                                                                  retrievedWords[
                                                                      retrievedWordsIndex];
                                                              return Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'FIELD_OPERATIVES_VIEW_WhiteContainer_ON_');
                                                                        if (animationsMap['containerOnActionTriggerAnimation'] !=
                                                                            null) {
                                                                          animationsMap['containerOnActionTriggerAnimation']!
                                                                              .controller
                                                                              .forward(from: 0.0);
                                                                        }
                                                                        _model.updatedWordsListLarge =
                                                                            await actions.wordTapped(
                                                                          retrievedWordsIndex,
                                                                          fieldOperativesViewRoomRecord!
                                                                              .words
                                                                              .toList(),
                                                                        );
                                                                        _model.wordsLeftJsonLarge =
                                                                            await actions.calculateWordsLeft(
                                                                          _model
                                                                              .updatedWordsListLarge!
                                                                              .toList(),
                                                                        );
                                                                        _model.wordColorLarge =
                                                                            await actions.getWordColor(
                                                                          retrievedWordsIndex,
                                                                          _model
                                                                              .updatedWordsListLarge!
                                                                              .toList(),
                                                                        );
                                                                        if (_model.wordColorLarge ==
                                                                            'n') {
                                                                          if (fieldOperativesViewRoomRecord!
                                                                              .isRedGuessing) {
                                                                            final roomUpdateData1 =
                                                                                {
                                                                              ...createRoomRecordData(
                                                                                redWordsLeft: getJsonField(
                                                                                  _model.wordsLeftJsonLarge,
                                                                                  r'''$.red''',
                                                                                ),
                                                                                blueWordsLeft: getJsonField(
                                                                                  _model.wordsLeftJsonLarge,
                                                                                  r'''$.blue''',
                                                                                ),
                                                                                isRedGuessing: false,
                                                                                isBlueGuessing: true,
                                                                              ),
                                                                              'words': _model.updatedWordsListLarge,
                                                                              'current_turn': FieldValue.increment(1),
                                                                            };
                                                                            await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData1);
                                                                            if (fieldOperativesViewRoomRecord!.isAiSpymaster) {
                                                                              _model.redNeutralAILargeTimer = InstantTimer.periodic(
                                                                                duration: Duration(milliseconds: 10000),
                                                                                callback: (timer) async {
                                                                                  _model.redNeutralAIOutputLarge = await AISpymasterGroup.getClueCall.call(
                                                                                    apiKey: FFAppState().apiKey,
                                                                                    systemPrompt: functions.createAISystemPrompt(fieldOperativesViewRoomRecord!.words.toList(), true),
                                                                                    userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!.words.toList()),
                                                                                    modelName: FFAppState().modelName,
                                                                                  );
                                                                                  if ((_model.redNeutralAIOutputLarge?.succeeded ?? true)) {
                                                                                    _model.redNeutralAILargeTimer?.cancel();

                                                                                    final roomUpdateData2 = {
                                                                                      'clues': FieldValue.arrayUnion([
                                                                                        getClueDataFirestoreData(
                                                                                          updateClueDataStruct(
                                                                                            ClueDataStruct(
                                                                                              clue: AISpymasterGroup.getClueCall
                                                                                                  .rawClue(
                                                                                                    (_model.redNeutralAIOutputLarge?.jsonBody ?? ''),
                                                                                                  )
                                                                                                  .toString(),
                                                                                              turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                              isForBlue: true,
                                                                                            ),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          true,
                                                                                        )
                                                                                      ]),
                                                                                    };
                                                                                    await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData2);
                                                                                  }
                                                                                },
                                                                                startImmediately: true,
                                                                              );
                                                                            }
                                                                          } else {
                                                                            final roomUpdateData3 =
                                                                                {
                                                                              ...createRoomRecordData(
                                                                                redWordsLeft: getJsonField(
                                                                                  _model.wordsLeftJsonLarge,
                                                                                  r'''$.red''',
                                                                                ),
                                                                                blueWordsLeft: getJsonField(
                                                                                  _model.wordsLeftJsonLarge,
                                                                                  r'''$.blue''',
                                                                                ),
                                                                                isRedGuessing: true,
                                                                                isBlueGuessing: false,
                                                                              ),
                                                                              'words': _model.updatedWordsListLarge,
                                                                              'current_turn': FieldValue.increment(1),
                                                                            };
                                                                            await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData3);
                                                                            if (fieldOperativesViewRoomRecord!.isAiSpymaster) {
                                                                              _model.blueNeutralAILargeTimer = InstantTimer.periodic(
                                                                                duration: Duration(milliseconds: 10000),
                                                                                callback: (timer) async {
                                                                                  _model.blueNeutralAIOutputLarge = await AISpymasterGroup.getClueCall.call(
                                                                                    apiKey: FFAppState().apiKey,
                                                                                    systemPrompt: functions.createAISystemPrompt(fieldOperativesViewRoomRecord!.words.toList(), false),
                                                                                    userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!.words.toList()),
                                                                                    modelName: FFAppState().modelName,
                                                                                  );
                                                                                  if ((_model.blueNeutralAIOutputLarge?.succeeded ?? true)) {
                                                                                    _model.blueNeutralAILargeTimer?.cancel();

                                                                                    final roomUpdateData4 = {
                                                                                      'clues': FieldValue.arrayUnion([
                                                                                        getClueDataFirestoreData(
                                                                                          updateClueDataStruct(
                                                                                            ClueDataStruct(
                                                                                              clue: AISpymasterGroup.getClueCall
                                                                                                  .rawClue(
                                                                                                    (_model.blueNeutralAIOutputLarge?.jsonBody ?? ''),
                                                                                                  )
                                                                                                  .toString(),
                                                                                              turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                              isForBlue: false,
                                                                                            ),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          true,
                                                                                        )
                                                                                      ]),
                                                                                    };
                                                                                    await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData4);
                                                                                  }
                                                                                },
                                                                                startImmediately: true,
                                                                              );
                                                                            }
                                                                          }
                                                                        } else {
                                                                          if (_model.wordColorLarge ==
                                                                              'r') {
                                                                            if (fieldOperativesViewRoomRecord!.isRedGuessing) {
                                                                              final roomUpdateData5 = {
                                                                                ...createRoomRecordData(
                                                                                  redWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.red''',
                                                                                  ),
                                                                                  blueWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.blue''',
                                                                                  ),
                                                                                ),
                                                                                'words': _model.updatedWordsListLarge,
                                                                              };
                                                                              await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData5);
                                                                            } else {
                                                                              final roomUpdateData6 = {
                                                                                ...createRoomRecordData(
                                                                                  redWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.red''',
                                                                                  ),
                                                                                  blueWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.blue''',
                                                                                  ),
                                                                                  isRedGuessing: true,
                                                                                  isBlueGuessing: false,
                                                                                ),
                                                                                'words': _model.updatedWordsListLarge,
                                                                                'current_turn': FieldValue.increment(1),
                                                                              };
                                                                              await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData6);
                                                                              if (fieldOperativesViewRoomRecord!.isAiSpymaster) {
                                                                                _model.blueEndAILargeTimer = InstantTimer.periodic(
                                                                                  duration: Duration(milliseconds: 10000),
                                                                                  callback: (timer) async {
                                                                                    _model.blueEndAIOutputLarge = await AISpymasterGroup.getClueCall.call(
                                                                                      apiKey: FFAppState().apiKey,
                                                                                      systemPrompt: functions.createAISystemPrompt(fieldOperativesViewRoomRecord!.words.toList(), false),
                                                                                      userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!.words.toList()),
                                                                                      modelName: FFAppState().modelName,
                                                                                    );
                                                                                    if ((_model.blueEndAIOutputLarge?.succeeded ?? true)) {
                                                                                      _model.blueEndAILargeTimer?.cancel();

                                                                                      final roomUpdateData7 = {
                                                                                        'clues': FieldValue.arrayUnion([
                                                                                          getClueDataFirestoreData(
                                                                                            updateClueDataStruct(
                                                                                              ClueDataStruct(
                                                                                                clue: AISpymasterGroup.getClueCall
                                                                                                    .rawClue(
                                                                                                      (_model.blueEndAIOutputLarge?.jsonBody ?? ''),
                                                                                                    )
                                                                                                    .toString(),
                                                                                                turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                                isForBlue: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                            true,
                                                                                          )
                                                                                        ]),
                                                                                      };
                                                                                      await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData7);
                                                                                    }
                                                                                  },
                                                                                  startImmediately: true,
                                                                                );
                                                                              }
                                                                            }
                                                                          } else {
                                                                            if (fieldOperativesViewRoomRecord!.isRedGuessing) {
                                                                              final roomUpdateData8 = {
                                                                                ...createRoomRecordData(
                                                                                  redWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.red''',
                                                                                  ),
                                                                                  blueWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.blue''',
                                                                                  ),
                                                                                  isRedGuessing: false,
                                                                                  isBlueGuessing: true,
                                                                                ),
                                                                                'words': _model.updatedWordsListLarge,
                                                                                'current_turn': FieldValue.increment(1),
                                                                              };
                                                                              await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData8);
                                                                              if (fieldOperativesViewRoomRecord!.isAiSpymaster) {
                                                                                _model.redEndAILargeTimer = InstantTimer.periodic(
                                                                                  duration: Duration(milliseconds: 10000),
                                                                                  callback: (timer) async {
                                                                                    _model.redEndAIOutputLarge = await AISpymasterGroup.getClueCall.call(
                                                                                      apiKey: FFAppState().apiKey,
                                                                                      systemPrompt: functions.createAISystemPrompt(fieldOperativesViewRoomRecord!.words.toList(), true),
                                                                                      userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!.words.toList()),
                                                                                      modelName: FFAppState().modelName,
                                                                                    );
                                                                                    if ((_model.redEndAIOutputLarge?.succeeded ?? true)) {
                                                                                      _model.redEndAILargeTimer?.cancel();

                                                                                      final roomUpdateData9 = {
                                                                                        'clues': FieldValue.arrayUnion([
                                                                                          getClueDataFirestoreData(
                                                                                            updateClueDataStruct(
                                                                                              ClueDataStruct(
                                                                                                clue: AISpymasterGroup.getClueCall
                                                                                                    .rawClue(
                                                                                                      (_model.redEndAIOutputLarge?.jsonBody ?? ''),
                                                                                                    )
                                                                                                    .toString(),
                                                                                                turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                                isForBlue: true,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                            true,
                                                                                          )
                                                                                        ]),
                                                                                      };
                                                                                      await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData9);
                                                                                    }
                                                                                  },
                                                                                  startImmediately: true,
                                                                                );
                                                                              }
                                                                            } else {
                                                                              final roomUpdateData10 = {
                                                                                ...createRoomRecordData(
                                                                                  redWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.red''',
                                                                                  ),
                                                                                  blueWordsLeft: getJsonField(
                                                                                    _model.wordsLeftJsonLarge,
                                                                                    r'''$.blue''',
                                                                                  ),
                                                                                ),
                                                                                'words': _model.updatedWordsListLarge,
                                                                              };
                                                                              await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData10);
                                                                            }
                                                                          }
                                                                        }

                                                                        _model.winnerLarge =
                                                                            await actions.declareWinner(
                                                                          getJsonField(
                                                                            _model.wordsLeftJsonLarge,
                                                                            r'''$.red''',
                                                                          ),
                                                                          getJsonField(
                                                                            _model.wordsLeftJsonLarge,
                                                                            r'''$.blue''',
                                                                          ),
                                                                        );
                                                                        if (_model.winnerLarge ==
                                                                            'r') {
                                                                          final roomUpdateData11 =
                                                                              createRoomRecordData(
                                                                            isRedWinner:
                                                                                true,
                                                                          );
                                                                          await fieldOperativesViewRoomRecord!
                                                                              .reference
                                                                              .update(roomUpdateData11);
                                                                        } else {
                                                                          if (_model.winnerLarge ==
                                                                              'b') {
                                                                            final roomUpdateData12 =
                                                                                createRoomRecordData(
                                                                              isBlueWinner: true,
                                                                            );
                                                                            await fieldOperativesViewRoomRecord!.reference.update(roomUpdateData12);
                                                                          }
                                                                        }

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              () {
                                                                            if (functions.isNeutralVisible(
                                                                                getJsonField(
                                                                                  functions.separateWordDetails(retrievedWordsItem),
                                                                                  r'''$.color''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  functions.separateWordDetails(retrievedWordsItem),
                                                                                  r'''$.is_guessed''',
                                                                                ).toString())) {
                                                                              return FlutterFlowTheme.of(context).tertiary;
                                                                            } else if (functions.isRedVisible(
                                                                                getJsonField(
                                                                                  functions.separateWordDetails(retrievedWordsItem),
                                                                                  r'''$.color''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  functions.separateWordDetails(retrievedWordsItem),
                                                                                  r'''$.is_guessed''',
                                                                                ).toString())) {
                                                                              return FlutterFlowTheme.of(context).alternate;
                                                                            } else if (functions.isBlueVisible(
                                                                                getJsonField(
                                                                                  functions.separateWordDetails(retrievedWordsItem),
                                                                                  r'''$.color''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  functions.separateWordDetails(retrievedWordsItem),
                                                                                  r'''$.is_guessed''',
                                                                                ).toString())) {
                                                                              return FlutterFlowTheme.of(context).primary;
                                                                            } else {
                                                                              return FlutterFlowTheme.of(context).primaryBtnText;
                                                                            }
                                                                          }(),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.black,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                16.0,
                                                                                8.0,
                                                                                16.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              getJsonField(
                                                                                functions.separateWordDetails(retrievedWordsItem),
                                                                                r'''$.word''',
                                                                              ).toString(),
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: valueOrDefault<Color>(
                                                                                      functions.isGuessed(getJsonField(
                                                                                        functions.separateWordDetails(retrievedWordsItem),
                                                                                        r'''$.is_guessed''',
                                                                                      ).toString())
                                                                                          ? FlutterFlowTheme.of(context).primaryBtnText
                                                                                          : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'containerOnActionTriggerAnimation']!,
                                                                    ),
                                                                  ),
                                                                  if (!functions.isCurrentTeamsTurn(
                                                                      stackPlayersRecord!
                                                                          .isBlue,
                                                                      fieldOperativesViewRoomRecord!
                                                                          .isBlueGuessing))
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x34FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                ],
                                                              );
                                                            },
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'gridViewOnPageLoadAnimation']!);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 1.5,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              decoration: BoxDecoration(
                                                color: Color(0x33000000),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        64.0, 0.0, 32.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Words Left',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        24.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              fieldOperativesViewRoomRecord!
                                                                  .blueWordsLeft
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        32.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              '-',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            fieldOperativesViewRoomRecord!
                                                                .redWordsLeft
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      32.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (fieldOperativesViewRoomRecord!
                                                        .isRedGuessing)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (fieldOperativesViewRoomRecord!
                                                                      .isAiSpymaster &&
                                                                  (fieldOperativesViewRoomRecord!
                                                                          .currentTurn ==
                                                                      fieldOperativesViewRoomRecord!
                                                                          .clues
                                                                          .length) &&
                                                                  !fieldOperativesViewRoomRecord!
                                                                      .clues[
                                                                          fieldOperativesViewRoomRecord!.currentTurn -
                                                                              1]
                                                                      .isForBlue)
                                                                Text(
                                                                  fieldOperativesViewRoomRecord!
                                                                      .clues[
                                                                          fieldOperativesViewRoomRecord!.currentTurn -
                                                                              1]
                                                                      .clue,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            24.0,
                                                                      ),
                                                                ),
                                                              if (fieldOperativesViewRoomRecord!
                                                                      .isAiSpymaster &&
                                                                  (fieldOperativesViewRoomRecord!
                                                                          .currentTurn !=
                                                                      fieldOperativesViewRoomRecord!
                                                                          .clues
                                                                          .length))
                                                                Text(
                                                                  'Thinking...',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            24.0,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation3']!),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Red team is guessing...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              if (functions.shouldShowEndTurn(
                                                                  stackPlayersRecord!
                                                                      .isBlue,
                                                                  fieldOperativesViewRoomRecord!
                                                                      .isRedGuessing,
                                                                  fieldOperativesViewRoomRecord!
                                                                      .isBlueGuessing,
                                                                  stackPlayersRecord!
                                                                      .isSpymaster))
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'FIELD_OPERATIVES_VIEW_END_TURN_BTN_ON_TA');

                                                                    final roomUpdateData1 =
                                                                        {
                                                                      ...createRoomRecordData(
                                                                        isRedGuessing:
                                                                            false,
                                                                        isBlueGuessing:
                                                                            true,
                                                                      ),
                                                                      'current_turn':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    };
                                                                    await fieldOperativesViewRoomRecord!
                                                                        .reference
                                                                        .update(
                                                                            roomUpdateData1);
                                                                    if (fieldOperativesViewRoomRecord!
                                                                        .isAiSpymaster) {
                                                                      _model.blueAIOutputLarge = await AISpymasterGroup
                                                                          .getClueCall
                                                                          .call(
                                                                        apiKey:
                                                                            FFAppState().apiKey,
                                                                        systemPrompt: functions.createAISystemPrompt(
                                                                            fieldOperativesViewRoomRecord!.words.toList(),
                                                                            true),
                                                                        userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!
                                                                            .words
                                                                            .toList()),
                                                                        modelName:
                                                                            FFAppState().modelName,
                                                                      );

                                                                      final roomUpdateData2 =
                                                                          {
                                                                        'clues':
                                                                            FieldValue.arrayUnion([
                                                                          getClueDataFirestoreData(
                                                                            updateClueDataStruct(
                                                                              ClueDataStruct(
                                                                                clue: AISpymasterGroup.getClueCall
                                                                                    .rawClue(
                                                                                      (_model.blueAIOutputLarge?.jsonBody ?? ''),
                                                                                    )
                                                                                    .toString(),
                                                                                turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                isForBlue: true,
                                                                              ),
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      };
                                                                      await fieldOperativesViewRoomRecord!
                                                                          .reference
                                                                          .update(
                                                                              roomUpdateData2);
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  text:
                                                                      'End turn',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        160.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
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
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    if (fieldOperativesViewRoomRecord!
                                                        .isBlueGuessing)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (fieldOperativesViewRoomRecord!
                                                                      .isAiSpymaster &&
                                                                  (fieldOperativesViewRoomRecord!
                                                                          .currentTurn ==
                                                                      fieldOperativesViewRoomRecord!
                                                                          .clues
                                                                          .length) &&
                                                                  fieldOperativesViewRoomRecord!
                                                                      .clues[
                                                                          fieldOperativesViewRoomRecord!.currentTurn -
                                                                              1]
                                                                      .isForBlue)
                                                                Text(
                                                                  fieldOperativesViewRoomRecord!
                                                                      .clues[
                                                                          fieldOperativesViewRoomRecord!.currentTurn -
                                                                              1]
                                                                      .clue,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            24.0,
                                                                      ),
                                                                ),
                                                              if (fieldOperativesViewRoomRecord!
                                                                      .isAiSpymaster &&
                                                                  (fieldOperativesViewRoomRecord!
                                                                          .currentTurn !=
                                                                      fieldOperativesViewRoomRecord!
                                                                          .clues
                                                                          .length))
                                                                Text(
                                                                  'Thinking...',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            24.0,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation4']!),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Blue team is guessing...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              if (functions.shouldShowEndTurn(
                                                                  stackPlayersRecord!
                                                                      .isBlue,
                                                                  fieldOperativesViewRoomRecord!
                                                                      .isRedGuessing,
                                                                  fieldOperativesViewRoomRecord!
                                                                      .isBlueGuessing,
                                                                  stackPlayersRecord!
                                                                      .isSpymaster))
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'FIELD_OPERATIVES_VIEW_END_TURN_BTN_ON_TA');

                                                                    final roomUpdateData1 =
                                                                        {
                                                                      ...createRoomRecordData(
                                                                        isRedGuessing:
                                                                            true,
                                                                        isBlueGuessing:
                                                                            false,
                                                                      ),
                                                                      'current_turn':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    };
                                                                    await fieldOperativesViewRoomRecord!
                                                                        .reference
                                                                        .update(
                                                                            roomUpdateData1);
                                                                    if (fieldOperativesViewRoomRecord!
                                                                        .isAiSpymaster) {
                                                                      _model.redAIOutputLarge = await AISpymasterGroup
                                                                          .getClueCall
                                                                          .call(
                                                                        apiKey:
                                                                            FFAppState().apiKey,
                                                                        systemPrompt: functions.createAISystemPrompt(
                                                                            fieldOperativesViewRoomRecord!.words.toList(),
                                                                            false),
                                                                        userPrompt: functions.createAIUserPrompt(fieldOperativesViewRoomRecord!
                                                                            .words
                                                                            .toList()),
                                                                        modelName:
                                                                            FFAppState().modelName,
                                                                      );

                                                                      final roomUpdateData2 =
                                                                          {
                                                                        'clues':
                                                                            FieldValue.arrayUnion([
                                                                          getClueDataFirestoreData(
                                                                            updateClueDataStruct(
                                                                              ClueDataStruct(
                                                                                clue: AISpymasterGroup.getClueCall
                                                                                    .rawClue(
                                                                                      (_model.redAIOutputLarge?.jsonBody ?? ''),
                                                                                    )
                                                                                    .toString(),
                                                                                turn: fieldOperativesViewRoomRecord!.currentTurn,
                                                                                isForBlue: false,
                                                                              ),
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      };
                                                                      await fieldOperativesViewRoomRecord!
                                                                          .reference
                                                                          .update(
                                                                              roomUpdateData2);
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  text:
                                                                      'End turn',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        160.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
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
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x35000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Text(
                                                                'Blue team',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          32.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    PlayersRecord>>(
                                                              stream:
                                                                  queryPlayersRecord(
                                                                parent:
                                                                    fieldOperativesViewRoomRecord!
                                                                        .reference,
                                                                queryBuilder: (playersRecord) => playersRecord
                                                                    .where(
                                                                        'is_team_selected',
                                                                        isEqualTo:
                                                                            true)
                                                                    .where(
                                                                        'is_blue',
                                                                        isEqualTo:
                                                                            true),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        LinearProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  );
                                                                }
                                                                List<PlayersRecord>
                                                                    columnPlayersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      columnPlayersRecordList
                                                                          .length,
                                                                      (columnIndex) {
                                                                    final columnPlayersRecord =
                                                                        columnPlayersRecordList[
                                                                            columnIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            columnPlayersRecord.name,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 22.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if (columnPlayersRecord
                                                                            .isSpymaster)
                                                                          FaIcon(
                                                                            FontAwesomeIcons.hatCowboy,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                      ],
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Text(
                                                                'Red team',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          32.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    PlayersRecord>>(
                                                              stream:
                                                                  queryPlayersRecord(
                                                                parent:
                                                                    fieldOperativesViewRoomRecord!
                                                                        .reference,
                                                                queryBuilder: (playersRecord) => playersRecord
                                                                    .where(
                                                                        'is_team_selected',
                                                                        isEqualTo:
                                                                            true)
                                                                    .where(
                                                                        'is_blue',
                                                                        isEqualTo:
                                                                            false),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        LinearProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  );
                                                                }
                                                                List<PlayersRecord>
                                                                    columnPlayersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      columnPlayersRecordList
                                                                          .length,
                                                                      (columnIndex) {
                                                                    final columnPlayersRecord =
                                                                        columnPlayersRecordList[
                                                                            columnIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            columnPlayersRecord.name,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 22.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if (columnPlayersRecord
                                                                            .isSpymaster)
                                                                          FaIcon(
                                                                            FontAwesomeIcons.hatCowboy,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                      ],
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'columnOnPageLoadAnimation']!),
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
                          if (fieldOperativesViewRoomRecord!.isBlueWinner &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.trophy,
                                        color: Color(0xFFFFB938),
                                        size: 250.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'WINNER',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0x99FFFFFF),
                                                        fontSize: 32.0,
                                                        letterSpacing: 2.0,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            Text(
                                              'Blue Team',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 60.0,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.0,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 42.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'FIELD_OPERATIVES_VIEW_START_NEW_GAME_BTN');
                                                  FFAppState().update(() {
                                                    FFAppState().words = [];
                                                  });

                                                  context.goNamed(
                                                    'CreateJoinScreen',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                text: 'Start New Game',
                                                options: FFButtonOptions(
                                                  width: 350.0,
                                                  height: 80.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x004B39EF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    width: 5.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                          if (fieldOperativesViewRoomRecord!.isRedWinner &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                            Container(
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
                                      FaIcon(
                                        FontAwesomeIcons.trophy,
                                        color: Color(0xFFFFB938),
                                        size: 250.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'WINNER',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0x99FFFFFF),
                                                        fontSize: 32.0,
                                                        letterSpacing: 2.0,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            Text(
                                              'Red Team',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 60.0,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.0,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 42.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'FIELD_OPERATIVES_VIEW_START_NEW_GAME_BTN');
                                                  FFAppState().update(() {
                                                    FFAppState().words = [];
                                                  });

                                                  context.goNamed(
                                                    'CreateJoinScreen',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                text: 'Start New Game',
                                                options: FFButtonOptions(
                                                  width: 350.0,
                                                  height: 80.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x004B39EF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    width: 5.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
