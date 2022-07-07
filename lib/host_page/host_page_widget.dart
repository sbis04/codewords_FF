import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../game_page/game_page_widget.dart';
import '../start_screen/start_screen_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HostPageWidget extends StatefulWidget {
  const HostPageWidget({
    Key key,
    this.roomDetails,
  }) : super(key: key);

  final RoomRecord roomDetails;

  @override
  _HostPageWidgetState createState() => _HostPageWidgetState();
}

class _HostPageWidgetState extends State<HostPageWidget> {
  List<String> initialWords;
  PlayersRecord bluePlayerDetails;
  PlayersRecord redPlayerDetails;
  PlayersRecord blueSpyPlayerDetails;
  PlayersRecord redSpyPlayerDetails;
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await actions.initWords();
          initialWords = await actions.generateBoardWords(
            FFAppState().words.toList(),
          );

          final roomUpdateData = {
            ...createRoomRecordData(
              isStarted: true,
              isBlueGuessing: true,
              isRedGuessing: false,
              redWordsLeft: 8,
              blueWordsLeft: 9,
            ),
            'words': initialWords,
          };
          await widget.roomDetails.reference.update(roomUpdateData);
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePageWidget(
                roomCode: widget.roomDetails.code,
              ),
            ),
          );
          setState(() => FFAppState().hasJoinedTeam = false);

          final wordsCreateData = createWordsRecordData(
            word: '',
          );
          await WordsRecord.createDoc(widget.roomDetails.reference)
              .set(wordsCreateData);

          setState(() {});
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        label: Text(
          'Start game',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                            ),
                      ),
                      InkWell(
                        onTap: () async {
                          await widget.roomDetails.reference.delete();
                          await Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: StartScreenWidget(),
                            ),
                            (r) => false,
                          );
                          setState(() => FFAppState().hasJoinedTeam = false);
                        },
                        child: Icon(
                          Icons.delete_outline,
                          color: Color(0xFFFF434C),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Your name: ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        widget.roomDetails.host,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Joinning code: ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Text(
                          widget.roomDetails.code.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      'Share this code with your friends to let them join this session.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0x7F101213),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  if (!(FFAppState().hasJoinedTeam) ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final playersCreateData =
                                      createPlayersRecordData(
                                    name: widget.roomDetails.host,
                                    isTeamSelected: true,
                                    isBlue: false,
                                    isSpymaster: false,
                                  );
                                  var playersRecordReference =
                                      PlayersRecord.createDoc(
                                          widget.roomDetails.reference);
                                  await playersRecordReference
                                      .set(playersCreateData);
                                  redPlayerDetails =
                                      PlayersRecord.getDocumentFromData(
                                          playersCreateData,
                                          playersRecordReference);
                                  setState(
                                      () => FFAppState().hasJoinedTeam = true);
                                  setState(() => FFAppState().teamColor = 'r');

                                  setState(() {});
                                },
                                text: 'Join Red team',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 50,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final playersCreateData =
                                      createPlayersRecordData(
                                    name: widget.roomDetails.host,
                                    isTeamSelected: true,
                                    isBlue: true,
                                    isSpymaster: false,
                                  );
                                  var playersRecordReference =
                                      PlayersRecord.createDoc(
                                          widget.roomDetails.reference);
                                  await playersRecordReference
                                      .set(playersCreateData);
                                  bluePlayerDetails =
                                      PlayersRecord.getDocumentFromData(
                                          playersCreateData,
                                          playersRecordReference);
                                  setState(
                                      () => FFAppState().hasJoinedTeam = true);
                                  setState(() => FFAppState().teamColor = 'b');

                                  setState(() {});
                                },
                                text: 'Join Blue team',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!(FFAppState().hasJoinedTeam) ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final playersCreateData =
                                      createPlayersRecordData(
                                    name: widget.roomDetails.host,
                                    isTeamSelected: true,
                                    isBlue: false,
                                    isSpymaster: true,
                                  );
                                  var playersRecordReference =
                                      PlayersRecord.createDoc(
                                          widget.roomDetails.reference);
                                  await playersRecordReference
                                      .set(playersCreateData);
                                  redSpyPlayerDetails =
                                      PlayersRecord.getDocumentFromData(
                                          playersCreateData,
                                          playersRecordReference);
                                  setState(
                                      () => FFAppState().hasJoinedTeam = true);
                                  setState(() => FFAppState().teamColor = 'r');
                                  setState(() => FFAppState().isSpy = true);

                                  setState(() {});
                                },
                                text: 'become spy master',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 30,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final playersCreateData =
                                      createPlayersRecordData(
                                    name: widget.roomDetails.host,
                                    isTeamSelected: true,
                                    isBlue: true,
                                    isSpymaster: true,
                                  );
                                  var playersRecordReference =
                                      PlayersRecord.createDoc(
                                          widget.roomDetails.reference);
                                  await playersRecordReference
                                      .set(playersCreateData);
                                  blueSpyPlayerDetails =
                                      PlayersRecord.getDocumentFromData(
                                          playersCreateData,
                                          playersRecordReference);
                                  setState(
                                      () => FFAppState().hasJoinedTeam = true);
                                  setState(() => FFAppState().teamColor = 'b');
                                  setState(() => FFAppState().isSpy = true);

                                  setState(() {});
                                },
                                text: 'become spy master',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 30,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Divider(
                    thickness: 2,
                    color: Color(0x4C000000),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: Text(
                      'Blue team',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 24,
                          ),
                    ),
                  ),
                  StreamBuilder<List<PlayersRecord>>(
                    stream: queryPlayersRecord(
                      parent: widget.roomDetails.reference,
                      queryBuilder: (playersRecord) => playersRecord
                          .where('is_team_selected', isEqualTo: true)
                          .where('is_blue', isEqualTo: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<PlayersRecord> columnPlayersRecordList =
                          snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnPlayersRecordList.length,
                            (columnIndex) {
                          final columnPlayersRecord =
                              columnPlayersRecordList[columnIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  columnPlayersRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              if (columnPlayersRecord.isSpymaster ?? true)
                                FaIcon(
                                  FontAwesomeIcons.hatCowboy,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 20,
                                ),
                              if (columnPlayersRecord.isTeamSelected ?? true)
                                FaIcon(
                                  FontAwesomeIcons.solidCheckCircle,
                                  color: Color(0xFF1DDE10),
                                  size: 20,
                                ),
                            ],
                          );
                        }),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: Text(
                      'Red team',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 24,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: StreamBuilder<List<PlayersRecord>>(
                      stream: queryPlayersRecord(
                        parent: widget.roomDetails.reference,
                        queryBuilder: (playersRecord) => playersRecord
                            .where('is_team_selected', isEqualTo: true)
                            .where('is_blue', isEqualTo: false),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<PlayersRecord> columnPlayersRecordList =
                            snapshot.data;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnPlayersRecordList.length, (columnIndex) {
                            final columnPlayersRecord =
                                columnPlayersRecordList[columnIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    columnPlayersRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                                if (columnPlayersRecord.isSpymaster ?? true)
                                  FaIcon(
                                    FontAwesomeIcons.hatCowboy,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 20,
                                  ),
                                if (columnPlayersRecord.isTeamSelected ?? true)
                                  FaIcon(
                                    FontAwesomeIcons.solidCheckCircle,
                                    color: Color(0xFF1DDE10),
                                    size: 20,
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
        ),
      ),
    );
  }
}
