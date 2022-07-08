import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../start_screen/start_screen_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldOperativesViewWidget extends StatefulWidget {
  const FieldOperativesViewWidget({
    Key key,
    this.roomCode,
    this.name,
  }) : super(key: key);

  final int roomCode;
  final String name;

  @override
  _FieldOperativesViewWidgetState createState() =>
      _FieldOperativesViewWidgetState();
}

class _FieldOperativesViewWidgetState extends State<FieldOperativesViewWidget> {
  List<String> updatedWordsList;
  String winner;
  dynamic wordsLeftRedJson;
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
        List<RoomRecord> fieldOperativesViewRoomRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final fieldOperativesViewRoomRecord =
            fieldOperativesViewRoomRecordList.isNotEmpty
                ? fieldOperativesViewRoomRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Codewords',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 30,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 24),
                                          child: Text(
                                            'Your name: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 24),
                                          child: Text(
                                            widget.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 24),
                                      child: Text(
                                        'Code: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 24),
                                      child: Text(
                                        widget.roomCode.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                                    fieldOperativesViewRoomRecord.blueWordsLeft
                                        .toString(),
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
                                  fieldOperativesViewRoomRecord.redWordsLeft
                                      .toString(),
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
                          if (fieldOperativesViewRoomRecord.isRedGuessing ??
                              true)
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
                                          fieldOperativesViewRoomRecord
                                              .isRedGuessing,
                                          fieldOperativesViewRoomRecord
                                              .isBlueGuessing,
                                          FFAppState().isSpy) ??
                                      true)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        wordsLeftRedJson =
                                            await actions.calculateWordsLeft(
                                          fieldOperativesViewRoomRecord.words
                                              .toList(),
                                        );
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
                                            isRedWinner: true,
                                          );
                                          await fieldOperativesViewRoomRecord
                                              .reference
                                              .update(roomUpdateData);
                                        } else {
                                          if ((winner) == 'b') {
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
                                              isBlueWinner: true,
                                            );
                                            await fieldOperativesViewRoomRecord
                                                .reference
                                                .update(roomUpdateData);
                                          } else {
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
                                            await fieldOperativesViewRoomRecord
                                                .reference
                                                .update(roomUpdateData);
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
                          if (fieldOperativesViewRoomRecord.isBlueGuessing ??
                              true)
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
                                          fieldOperativesViewRoomRecord
                                              .isRedGuessing,
                                          fieldOperativesViewRoomRecord
                                              .isBlueGuessing,
                                          FFAppState().isSpy) ??
                                      true)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        wordsLeftBlueJson =
                                            await actions.calculateWordsLeft(
                                          fieldOperativesViewRoomRecord.words
                                              .toList(),
                                        );
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
                                            isRedWinner: true,
                                          );
                                          await fieldOperativesViewRoomRecord
                                              .reference
                                              .update(roomUpdateData);
                                        } else {
                                          if ((winnerBlueButton) == 'b') {
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
                                              isBlueWinner: true,
                                            );
                                            await fieldOperativesViewRoomRecord
                                                .reference
                                                .update(roomUpdateData);
                                          } else {
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
                                            await fieldOperativesViewRoomRecord
                                                .reference
                                                .update(roomUpdateData);
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 16, 4, 0),
                            child: Builder(
                              builder: (context) {
                                final retrievedWords =
                                    fieldOperativesViewRoomRecord.words
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
                                  itemBuilder: (context, retrievedWordsIndex) {
                                    final retrievedWordsItem =
                                        retrievedWords[retrievedWordsIndex];
                                    return Stack(
                                      children: [
                                        if (functions.isNeutralVisible(
                                                getJsonField(
                                                  functions.separateWordDetails(
                                                      retrievedWordsItem),
                                                  r'''$.color''',
                                                ).toString(),
                                                getJsonField(
                                                  functions.separateWordDetails(
                                                      retrievedWordsItem),
                                                  r'''$.is_guessed''',
                                                ).toString()) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF19F79),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 16, 8, 16),
                                                  child: Text(
                                                    getJsonField(
                                                      functions
                                                          .separateWordDetails(
                                                              retrievedWordsItem),
                                                      r'''$.word''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (functions.isRedVisible(
                                                getJsonField(
                                                  functions.separateWordDetails(
                                                      retrievedWordsItem),
                                                  r'''$.color''',
                                                ).toString(),
                                                getJsonField(
                                                  functions.separateWordDetails(
                                                      retrievedWordsItem),
                                                  r'''$.is_guessed''',
                                                ).toString()) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 16, 8, 16),
                                                  child: Text(
                                                    getJsonField(
                                                      functions
                                                          .separateWordDetails(
                                                              retrievedWordsItem),
                                                      r'''$.word''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (functions.isBlueVisible(
                                                getJsonField(
                                                  functions.separateWordDetails(
                                                      retrievedWordsItem),
                                                  r'''$.color''',
                                                ).toString(),
                                                't') ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 16, 8, 16),
                                                  child: Text(
                                                    getJsonField(
                                                      functions
                                                          .separateWordDetails(
                                                              retrievedWordsItem),
                                                      r'''$.word''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (!(functions.isGuessed(getJsonField(
                                              functions.separateWordDetails(
                                                  retrievedWordsItem),
                                              r'''$.is_guessed''',
                                            ).toString())) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                updatedWordsList =
                                                    await actions.wordTapped(
                                                  retrievedWordsIndex,
                                                  fieldOperativesViewRoomRecord
                                                      .words
                                                      .toList(),
                                                );

                                                final roomUpdateData = {
                                                  'words': updatedWordsList,
                                                };
                                                await fieldOperativesViewRoomRecord
                                                    .reference
                                                    .update(roomUpdateData);

                                                setState(() {});
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                                8, 16, 8, 16),
                                                    child: Text(
                                                      getJsonField(
                                                        functions
                                                            .separateWordDetails(
                                                                retrievedWordsItem),
                                                        r'''$.word''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                    ),
                  ),
                  if (!(functions.shouldBlock(
                          FFAppState().teamColor,
                          fieldOperativesViewRoomRecord.isRedGuessing,
                          fieldOperativesViewRoomRecord.isBlueGuessing)) ??
                      true)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                    ),
                  if (fieldOperativesViewRoomRecord.isRedWinner ?? true)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 36,
                                        ),
                                  ),
                                  Text(
                                    'Red Team',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => FFAppState().words = []);
                                        setState(
                                            () => FFAppState().isSpy = false);
                                        setState(() =>
                                            FFAppState().isSpyViewOn = true);
                                        setState(() =>
                                            FFAppState().hasJoinedTeam = false);
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
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
                  if (fieldOperativesViewRoomRecord.isBlueWinner ?? true)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 36,
                                        ),
                                  ),
                                  Text(
                                    'Blue Team',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => FFAppState().words = []);
                                        setState(
                                            () => FFAppState().isSpy = false);
                                        setState(() =>
                                            FFAppState().isSpyViewOn = true);
                                        setState(() =>
                                            FFAppState().hasJoinedTeam = false);
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
