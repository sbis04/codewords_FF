import '../backend/backend.dart';
import '../blue_celebrate_page/blue_celebrate_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../red_celebrate_page/red_celebrate_page_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePageWidget extends StatefulWidget {
  const GamePageWidget({
    Key key,
    this.roomCode,
  }) : super(key: key);

  final int roomCode;

  @override
  _GamePageWidgetState createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget> {
  List<String> updatedWordsList;
  String winner;
  dynamic wordsLeftRedJson;
  bool switchListTileValue;
  String winnerBlueButton;
  dynamic wordsLeftBlueJson;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RoomRecord>>(
      stream: queryRoomRecord(
        queryBuilder: (roomRecord) =>
            roomRecord.where('code', isEqualTo: widget.roomCode),
        singleRecord: true,
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
        List<RoomRecord> gamePageRoomRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final gamePageRoomRecord = gamePageRoomRecordList.isNotEmpty
            ? gamePageRoomRecordList.first
            : null;
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
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().isSpy ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 8, 4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: SwitchListTile(
                                      value: switchListTileValue ??=
                                          FFAppState().isSpyViewOn,
                                      onChanged: (newValue) => setState(
                                          () => switchListTileValue = newValue),
                                      title: Text(
                                        'SPY MASTER VIEW',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      tileColor: Colors.black,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 4, 16, 4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Words Left',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Text(
                                    gamePageRoomRecord.blueWordsLeft.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 24,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 4, 0),
                                  child: Text(
                                    '-',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Text(
                                  gamePageRoomRecord.redWordsLeft.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 24,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          if (gamePageRoomRecord.isRedGuessing ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Red team is guessing...',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  if (functions.shouldShowEndTurn(
                                          FFAppState().teamColor,
                                          gamePageRoomRecord.isRedGuessing,
                                          gamePageRoomRecord.isBlueGuessing,
                                          FFAppState().isSpy) ??
                                      true)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        wordsLeftRedJson =
                                            await actions.calculateWordsLeft(
                                          gamePageRoomRecord.words.toList(),
                                        );

                                        final roomUpdateData =
                                            createRoomRecordData(
                                          isRedGuessing: false,
                                          isBlueGuessing: true,
                                          redWordsLeft: getJsonField(
                                            wordsLeftRedJson,
                                            r'''$.red''',
                                          ),
                                          blueWordsLeft: getJsonField(
                                            wordsLeftRedJson,
                                            r'''$.blue''',
                                          ),
                                        );
                                        await gamePageRoomRecord.reference
                                            .update(roomUpdateData);
                                        winner = await actions.declareWinner(
                                          getJsonField(
                                            wordsLeftRedJson,
                                            r'''$.red''',
                                          ),
                                          getJsonField(
                                            wordsLeftRedJson,
                                            r'''$.blue''',
                                          ),
                                        );
                                        if ((winner) == 'r') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'RED TEAM is the WINNER!!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Celebrate'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: RedCelebratePageWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        } else {
                                          if ((winner) == 'b') {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'BLUE TEAM is the WINNER!!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Celebrate'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child:
                                                    BlueCelebratePageWidget(),
                                              ),
                                              (r) => false,
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'End turn',
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 30,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          if (gamePageRoomRecord.isBlueGuessing ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Blue team is guessing...',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  if (functions.shouldShowEndTurn(
                                          FFAppState().teamColor,
                                          gamePageRoomRecord.isRedGuessing,
                                          gamePageRoomRecord.isBlueGuessing,
                                          FFAppState().isSpy) ??
                                      true)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        wordsLeftBlueJson =
                                            await actions.calculateWordsLeft(
                                          gamePageRoomRecord.words.toList(),
                                        );

                                        final roomUpdateData =
                                            createRoomRecordData(
                                          isBlueGuessing: false,
                                          isRedGuessing: true,
                                          redWordsLeft: getJsonField(
                                            wordsLeftBlueJson,
                                            r'''$.red''',
                                          ),
                                          blueWordsLeft: getJsonField(
                                            wordsLeftBlueJson,
                                            r'''$.blue''',
                                          ),
                                        );
                                        await gamePageRoomRecord.reference
                                            .update(roomUpdateData);
                                        winnerBlueButton =
                                            await actions.declareWinner(
                                          getJsonField(
                                            wordsLeftBlueJson,
                                            r'''$.red''',
                                          ),
                                          getJsonField(
                                            wordsLeftBlueJson,
                                            r'''$.blue''',
                                          ),
                                        );
                                        if ((winnerBlueButton) == 'r') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'RED TEAM is the WINNER!!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Celebrate'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: RedCelebratePageWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        } else {
                                          if ((winnerBlueButton) == 'b') {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'BLUE TEAM is the WINNER!!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Celebrate'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child:
                                                    BlueCelebratePageWidget(),
                                              ),
                                              (r) => false,
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'End turn',
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 30,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          Stack(
                            children: [
                              if (functions.shouldShowSpyView(
                                      FFAppState().isSpy,
                                      switchListTileValue) ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 16, 4, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final retrievedWordsSpy =
                                          gamePageRoomRecord.words
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 4,
                                          childAspectRatio: 1,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: retrievedWordsSpy.length,
                                        itemBuilder:
                                            (context, retrievedWordsSpyIndex) {
                                          final retrievedWordsSpyItem =
                                              retrievedWordsSpy[
                                                  retrievedWordsSpyIndex];
                                          return Stack(
                                            children: [
                                              if (functions.isNeutralVisibleSpy(
                                                      getJsonField(
                                                    functions.separateWordDetails(
                                                        retrievedWordsSpyItem),
                                                    r'''$.color''',
                                                  ).toString()) ??
                                                  true)
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF19F79),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        16,
                                                                        8,
                                                                        16),
                                                            child: Text(
                                                              getJsonField(
                                                                functions
                                                                    .separateWordDetails(
                                                                        retrievedWordsSpyItem),
                                                                r'''$.word''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (functions.isGuessed(
                                                            getJsonField(
                                                          functions
                                                              .separateWordDetails(
                                                                  retrievedWordsSpyItem),
                                                          r'''$.is_guessed''',
                                                        ).toString()) ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              if (functions.isRedVisibleSpy(
                                                      getJsonField(
                                                    functions.separateWordDetails(
                                                        retrievedWordsSpyItem),
                                                    r'''$.color''',
                                                  ).toString()) ??
                                                  true)
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        16,
                                                                        8,
                                                                        16),
                                                            child: Text(
                                                              getJsonField(
                                                                functions
                                                                    .separateWordDetails(
                                                                        retrievedWordsSpyItem),
                                                                r'''$.word''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (functions.isGuessed(
                                                            getJsonField(
                                                          functions
                                                              .separateWordDetails(
                                                                  retrievedWordsSpyItem),
                                                          r'''$.is_guessed''',
                                                        ).toString()) ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          size: 20,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              if (functions.isBlueVisibleSpy(
                                                      getJsonField(
                                                    functions.separateWordDetails(
                                                        retrievedWordsSpyItem),
                                                    r'''$.color''',
                                                  ).toString()) ??
                                                  true)
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        16,
                                                                        8,
                                                                        16),
                                                            child: Text(
                                                              getJsonField(
                                                                functions
                                                                    .separateWordDetails(
                                                                        retrievedWordsSpyItem),
                                                                r'''$.word''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (functions.isGuessed(
                                                            getJsonField(
                                                          functions
                                                              .separateWordDetails(
                                                                  retrievedWordsSpyItem),
                                                          r'''$.is_guessed''',
                                                        ).toString()) ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          size: 20,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if (!(functions.shouldShowSpyView(
                                      FFAppState().isSpy,
                                      switchListTileValue)) ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 16, 4, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final retrievedWords = gamePageRoomRecord
                                              .words
                                              .toList()
                                              ?.toList() ??
                                          [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 4,
                                          childAspectRatio: 1,
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
                                              if (functions.isNeutralVisible(
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
                                                      ).toString()) ??
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF19F79),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(8, 16,
                                                                    8, 16),
                                                        child: Text(
                                                          getJsonField(
                                                            functions
                                                                .separateWordDetails(
                                                                    retrievedWordsItem),
                                                            r'''$.word''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (functions.isRedVisible(
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
                                                      ).toString()) ??
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(8, 16,
                                                                    8, 16),
                                                        child: Text(
                                                          getJsonField(
                                                            functions
                                                                .separateWordDetails(
                                                                    retrievedWordsItem),
                                                            r'''$.word''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (functions.isBlueVisible(
                                                      getJsonField(
                                                        functions
                                                            .separateWordDetails(
                                                                retrievedWordsItem),
                                                        r'''$.color''',
                                                      ).toString(),
                                                      't') ??
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(8, 16,
                                                                    8, 16),
                                                        child: Text(
                                                          getJsonField(
                                                            functions
                                                                .separateWordDetails(
                                                                    retrievedWordsItem),
                                                            r'''$.word''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!(functions
                                                      .isGuessed(getJsonField(
                                                    functions
                                                        .separateWordDetails(
                                                            retrievedWordsItem),
                                                    r'''$.is_guessed''',
                                                  ).toString())) ??
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      updatedWordsList =
                                                          await actions
                                                              .wordTapped(
                                                        retrievedWordsIndex,
                                                        gamePageRoomRecord.words
                                                            .toList(),
                                                      );

                                                      final roomUpdateData = {
                                                        'words':
                                                            updatedWordsList,
                                                      };
                                                      await gamePageRoomRecord
                                                          .reference
                                                          .update(
                                                              roomUpdateData);

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8,
                                                                      16,
                                                                      8,
                                                                      16),
                                                          child: Text(
                                                            getJsonField(
                                                              functions
                                                                  .separateWordDetails(
                                                                      retrievedWordsItem),
                                                              r'''$.word''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                        ],
                      ),
                    ),
                  ),
                  if (!(functions.shouldBlock(
                          FFAppState().teamColor,
                          gamePageRoomRecord.isRedGuessing,
                          gamePageRoomRecord.isBlueGuessing)) ??
                      true)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
