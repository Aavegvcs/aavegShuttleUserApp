import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pickup_location_component_model.dart';
export 'pickup_location_component_model.dart';

class PickupLocationComponentWidget extends StatefulWidget {
  const PickupLocationComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final dynamic parameter1;
  final String? parameter2;
  final List<dynamic>? parameter3;

  @override
  State<PickupLocationComponentWidget> createState() =>
      _PickupLocationComponentWidgetState();
}

class _PickupLocationComponentWidgetState
    extends State<PickupLocationComponentWidget> {
  late PickupLocationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickupLocationComponentModel());
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
                    _model.updatePage(() {
                      FFAppState().pickupLocation = getJsonField(
                        locationNamesItem,
                        r'''$.description''',
                      ).toString();
                    });
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.pin_drop,
                    ),
                    title: Text(
                      getJsonField(
                        locationNamesItem,
                        r'''$.description''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Rubik',
                            fontSize: 18.0,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
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
