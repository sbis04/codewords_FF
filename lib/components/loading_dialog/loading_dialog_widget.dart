import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_dialog_model.dart';
export 'loading_dialog_model.dart';

class LoadingDialogWidget extends StatefulWidget {
  const LoadingDialogWidget({Key? key}) : super(key: key);

  @override
  _LoadingDialogWidgetState createState() => _LoadingDialogWidgetState();
}

class _LoadingDialogWidgetState extends State<LoadingDialogWidget> {
  late LoadingDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingDialogModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
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
    );
  }
}
