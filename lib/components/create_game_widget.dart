import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../host_page/host_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateGameWidget extends StatefulWidget {
  const CreateGameWidget({Key key}) : super(key: key);

  @override
  _CreateGameWidgetState createState() => _CreateGameWidgetState();
}

class _CreateGameWidgetState extends State<CreateGameWidget> {
  PlayersRecord playerDetails;
  RoomRecord roomDetails;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBtnText,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0x7F000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                final roomCreateData = createRoomRecordData(
                  code: functions.generateRoomCode(),
                  host: textController.text,
                );
                var roomRecordReference = RoomRecord.collection.doc();
                await roomRecordReference.set(roomCreateData);
                roomDetails = RoomRecord.getDocumentFromData(
                    roomCreateData, roomRecordReference);

                final playersCreateData = createPlayersRecordData(
                  name: textController.text,
                  isTeamSelected: false,
                );
                var playersRecordReference =
                    PlayersRecord.createDoc(roomDetails.reference);
                await playersRecordReference.set(playersCreateData);
                playerDetails = PlayersRecord.getDocumentFromData(
                    playersCreateData, playersRecordReference);
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HostPageWidget(
                      roomDetails: roomDetails,
                    ),
                  ),
                  (r) => false,
                );

                setState(() {});
              },
              text: 'Create',
              options: FFButtonOptions(
                width: double.infinity,
                height: 55,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            ),
          ],
        ),
      ),
    );
  }
}
