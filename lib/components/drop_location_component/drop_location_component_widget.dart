import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'drop_location_component_model.dart';
export 'drop_location_component_model.dart';

class DropLocationComponentWidget extends StatefulWidget {
  const DropLocationComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final dynamic parameter1;
  final String? parameter2;
  final List<dynamic>? parameter3;

  @override
  State<DropLocationComponentWidget> createState() =>
      _DropLocationComponentWidgetState();
}

class _DropLocationComponentWidgetState
    extends State<DropLocationComponentWidget> {
  late DropLocationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropLocationComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: LocationApiCall.call(
        searchText: widget.parameter2,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final listViewLocationApiResponse = snapshot.data!;
        return Builder(
          builder: (context) {
            final locationNames = LocationApiCall.locationPrediction(
                  listViewLocationApiResponse.jsonBody,
                )?.toList() ??
                [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: locationNames.length,
              itemBuilder: (context, locationNamesIndex) {
                final locationNamesItem = locationNames[locationNamesIndex];
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().dropLocation = getJsonField(
                        widget.parameter1,
                        r'''$.description''',
                      ).toString();
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 10.0),
                        child: Icon(
                          Icons.pin_drop,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          getJsonField(
                            locationNamesItem,
                            r'''$.description''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
