import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'explore_routes_model.dart';
export 'explore_routes_model.dart';

class ExploreRoutesWidget extends StatefulWidget {
  const ExploreRoutesWidget({super.key});

  @override
  State<ExploreRoutesWidget> createState() => _ExploreRoutesWidgetState();
}

class _ExploreRoutesWidgetState extends State<ExploreRoutesWidget> {
  late ExploreRoutesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreRoutesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFDDEDF8),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(60.0, 20.0, 60.0, 20.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '33byuuy9' /* Explore all best routes to com... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    'RoutesPage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
                text: FFLocalizations.of(context).getText(
                  'bwl5v3x3' /* Explore all routes */,
                ),
                options: FFButtonOptions(
                  width: 195.0,
                  height: 37.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(62.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
