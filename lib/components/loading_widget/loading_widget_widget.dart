import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_widget_model.dart';
export 'loading_widget_model.dart';

class LoadingWidgetWidget extends StatefulWidget {
  const LoadingWidgetWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetWidgetState createState() => _LoadingWidgetWidgetState();
}

class _LoadingWidgetWidgetState extends State<LoadingWidgetWidget> {
  late LoadingWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingWidgetModel());

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

    return Container(
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
    );
  }
}
